class LocateInfosController < ApplicationController
  skip_before_action :login_check, only: [:distance]

  def index
    @locate_infos = LocateInfo.where(:life_flag => false)
    render json: @locate_infos
  end

  def create
    @locate_info = LocateInfo.new(create_params)
    # エラー処理
    unless @locate_info.save # もし、memoが保存できなかったら
      render json:@error_message = [@locate_info.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      #user_locatesから一番近いユーザーを検索してtarget_userに登録
      user_id = close_of_distance(@locate_info[:ido], @locate_info[:keido])
      target_user = TargetUser.new(user_id: user_id, locate_info_id: @locate_info[:id])
      target_user.save

      render json: @locate_info
    end
  end

  def show
    @id = params[:id]
    @locate_info = LocateInfo.find(@id)
    render json: @locate_info
  end

  # ユーザーIDに一致したシャボン玉を返す
  def find_my_shabon
     @locate_infos = LocateInfo.where(user_id: @user.id)
     render json: @locate_infos
  end

  

  private
  def create_params
    params.require(:locate).permit(:ido, :keido, :nayami, :color).merge(user_id: @user.id)
  end

  #close_of?distanceのためのソナタ
  def set_up(latitude, longitude)
    sql4 = <<-"EOS"
    (
      6371 * ACOS(
        COS(RADIANS(
          EOS

    sql5 = <<-"EOS"
          )) * COS(RADIANS(a.ido)) * COS(RADIANS(a.keido) - RADIANS(
          EOS

    sql6 = ")) + SIN(RADIANS(#{latitude})) * SIN(RADIANS(a.ido))))"
    sql2 = sql4 + latitude.to_s + sql5 + longitude.to_s + sql6
    return sql2
  end

  #これで引数の緯度と経度に一番近いuser_idを取得
  def close_of_distance(latitude, longitude)
    p "test"
    # SQLを作成
    sql1 = <<-"EOS"
    select
    a.id
  , a.ido
  , a.keido
  , a.user_id
  , 
  EOS
      #ここにset_upの内容

        sql3 = <<-"EOS"
      as DISTANCE
    from
      user_locates a ORDER BY DISTANCE LIMIT 1;
        EOS

    # sqlを実行し、取得結果をhashに変換
    # ActiveRecord::Base.connection.select_all(sql).to_hash 
    sql2 = set_up(latitude, longitude)
    sql = sql1 + sql2 + sql3
        # return sql
        
        test2 = ActiveRecord::Base.connection.select_all(sql).to_hash 
        return test2[0]["user_id"]
  end



end
