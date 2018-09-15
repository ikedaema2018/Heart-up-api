module UserStalke
  def user_stalke
    locate_infos = LocateInfo.all
    locate_infos.each do |f|
      @user_id
      f.target_users.each do |u|
        if !u.life_flag
          @user_id = u.user_id
        end
      end
      @user_locate = UserLocate.find_by(user_id: @user_id)
       p "________________"
      p f.keido
      p @user_locate.keido

      if f.ido - @user_locate.ido >= 0
        f.ido -= 0.0005
      else
        f.ido += 0.0005
      end
      
      if f.keido - @user_locate.keido >= 0
        f.keido -= 0.0005
      else
        f.keido += 0.0005
      end

      if abs(f.ido) - abs(@user_locate.ido) >= 0.0005 && abs(f.keido) - abs(@user_locate.keido) >= 0.0005
        #アラートに登録する
        closer_alert = CloserAlert.new
        closer_alert.user_id = @user_locate.user_id
        closer_alert.locate_id = @locate_info.id
        closer_alert.save
      elsif abs(f.ido) - abs(@user_locate.ido) >= 0.0005
        p "緯度が0.0005以内だよ！"
        if f.ido - @user_locate.ido >= 0
          f.ido -= 0.0005
        else
          f.ido += 0.0005
        end
      elsif abs(f.keido) - abs(@user_locate.keido) >= 0.0005
        p "経度が0.0005以内だよ！"
        if f.keido - @user_locate.keido >= 0
          f.keido -= 0.0005
        else
          f.keido += 0.0005
        end
      end

      f.save
      
    end
  end

  module_function :user_stalke
end