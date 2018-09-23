class LocateInfosController < ApplicationController
  skip_before_action :login_check, only: [:distance, :user_stalke, :push_test]
  require 'json'

  def index
    @locate_infos = LocateInfo.where(:life_flag => false)
    # today = DateTime.now()
    # one_hour_ago = today - Rational(1, 24)
    # @users = UserLocate.where("updated_at > ?", one_hour_ago)
    
    # @mass_info = {}
    # @mass_info["locate_infos"] = @locate_infos.to_json
    # @mass_info["users"] = @users.to_json
    # p @mass_info
    # p @locate_infos
    # render json: {
    #   locate_infos: @locate_infos,
    #   users: @users
    # }
    render json: @locate_infos
  end

  def create
    @locate_info = LocateInfo.new(create_params)
    # エラー処理
    unless @locate_info.save # もし、memoが保存できなかったら
      render json:@error_message = [@locate_info.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      #user_locatesから一番近いユーザーを検索してtarget_userに登録
      p @locate_info[:ido]
      p @locate_info[:keido]
      p @locate_info[:user_id]
      @user_id = MostCloser.close_of_distance(@locate_info[:ido], @locate_info[:keido], @locate_info[:user_id])
      p "---------------------------------------"
      p @user_id
      @target_user = TargetUser.new(user_id: @user_id, locate_info_id: @locate_info[:id])
      p "----------aaaaa---------------------------"
      p @target_user
      @target_user.save

      render json: @locate_info
    end
  end

  def show
    @id = params[:id]
    @locate_info = LocateInfo.find(@id)
    NayamiComment.where(locate_info_id: @locate_info[:id]).update_all(yonda_flag: true)
    render json: @locate_info
  end

  # ユーザーIDに一致したコメントを返す
  def find_my_shabon
     @locate_infos = LocateInfo.where(user_id: @user.id)
     render json: @locate_infos
  end

  def get_my_shabon_detail
    @id = params[:id]
    @locate_info = LocateInfo.find(@id)
    #取得したlocate_infoのsplash_yonda_checkがfalseだった時、そこのnayami_commentsを全部trueにしてsplash_yonda_flagもtrueに
    @splash_yonda_check = SplashYondaCheck.where(locate_info_id: @locate_info[:id])
    if !@splash_yonda_check[:yonda_flag]
      @splash_yonda_check.update(yonda_flag: true)
      NayamiComment.where(locate_info_id: @locate_info[:id]).update_all(yonda_flag: true)
    end
    render json: @locate_info
  end

  def distance
    UserStalke.user_stalke
    # render json: locate_infos[0]
  end

  def push_test
    # coding: utf-8
    require 'fcm'

    fcm = FCM.new("AAAA-TM2pZc:APA91bFLB_VLAjK8OjNqMRauAM8tLQng6DT6JHss6s2am9aGOCcSttXyyd8hxoGQmAXgm1eONZ4jqttjHNzifGTQOt-Oy4mQaOfjsBprZf31qn8hJzr8c7d7PyJzLQtxgZ09X2AjKnFi")

    token = "fvc6iqZxTHo:APA91bEHXOmCZWHpJYPrnbXFdMZeBpmSfn5d4mcH60LpIQTpRHekdG7gxO9uI8gxUGjKJinUWGFMy9Q8o00bIjJj1NgSklQcZKp7OJHI122t378u-KEkj-yUj7hkPEFK3ImeF0wXVOCn"
    opts = {
      "notification" => {
        "body" => "新着記事があります！"
      }
    }
    ret = fcm.send_with_notification_key(token, opts)
    p ret
  end

  
  

  private
  def create_params
    params.require(:locate).permit(:ido, :keido, :nayami, :color).merge(user_id: @user.id)
  end

  # #close_of?distanceのためのソナタ
  # def set_up(latitude, longitude)
  #   sql4 = <<-"EOS"
  #   (
  #     6371 * ACOS(
  #       COS(RADIANS(
  #         EOS

  #   sql5 = <<-"EOS"
  #         )) * COS(RADIANS(a.ido)) * COS(RADIANS(a.keido) - RADIANS(
  #         EOS

  #   sql6 = ")) + SIN(RADIANS(#{latitude})) * SIN(RADIANS(a.ido))))"
  #   sql2 = sql4 + latitude.to_s + sql5 + longitude.to_s + sql6
  #   return sql2
  # end

  # #これで引数の緯度と経度に一番近いuser_idを取得
  # def close_of_distance(latitude, longitude)
  #   p "test"
  #   # SQLを作成
  #   sql1 = <<-"EOS"
  #   select
  #   a.id
  # , a.ido
  # , a.keido
  # , a.user_id
  # , 
  # EOS
  #     #ここにset_upの内容

  #       sql3 = <<-"EOS"
  #     as DISTANCE
  #   from
  #     user_locates a ORDER BY DISTANCE LIMIT 1;
  #       EOS

  #   # sqlを実行し、取得結果をhashに変換
  #   # ActiveRecord::Base.connection.select_all(sql).to_hash 
  #   sql2 = set_up(latitude, longitude)
  #   sql = sql1 + sql2 + sql3
  #       # return sql
        
  #       test2 = ActiveRecord::Base.connection.select_all(sql).to_hash 
  #       return test2[0]["user_id"]
  # end



end
