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

  def distance
    # SQLを作成
    sql = <<-"EOS"
    select
    a.id
  , a.ido
  , a.keido
  , a.user_id
  , ( 
    6371 * ACOS( 
      COS(RADIANS(37.3248)) * COS(RADIANS(a.ido)) * COS(RADIANS(a.keido) - RADIANS(-122.0197))
       + SIN(RADIANS(37.3248)) * SIN(RADIANS(a.ido))
    )
  ) as DISTANCE 
from
  user_locates a ORDER BY DISTANCE LIMIT 1; 
    EOS

# sqlを実行し、取得結果をhashに変換
# ActiveRecord::Base.connection.select_all(sql).to_hash     
    
    test2 = ActiveRecord::Base.connection.select_all(sql).to_hash 
    p test2[0]["user_id"]
  end

  private
  def create_params
    params.require(:locate).permit(:ido, :keido, :nayami, :color).merge(user_id: @user.id)
  end


end
