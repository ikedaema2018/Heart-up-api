module UserStalke
  def user_stalke
    p Time.now
    locate_infos = LocateInfo.all
    locate_infos.each do |f|
      if f.life_flag == true
        next
      end
      p f.target_user
      @user_id = f.target_user.user_id
      @user_locate = UserLocate.find_by(user_id: @user_id)
       p "________________"
      p f.keido
      p @user_locate.keido

      p "________________"
      p f.ido
      p @user_locate.ido
      

      # binding.pry
      if (f.ido.abs - @user_locate.ido.abs).abs <= 0.006 && (f.keido.abs - @user_locate.keido.abs).abs <= 0.006
        p "緯度と経度が0.005以内だよ"
        #アラートに登録する
        closer_alert = CloserAlert.new
        closer_alert.user_id = @user_locate.user_id
        closer_alert.locate_info_id = f.id
        closer_alert.save
        #target_userを変える
        @user_id = MostCloser.weak_close_of_distance(f.ido, f.keido, f.user_id, @user_locate.user_id)
        p f.target_user
        f.target_user.user_id = @user_id
        p f.target_user
        f.target_user.save
      elsif (f.ido.abs - @user_locate.ido.abs).abs <= 0.006
        p "緯度が0.005以内だよ！"
        if f.ido - @user_locate.ido >= 0
          f.keido -= 0.010
        else
          f.keido += 0.010
        end
        f.save
      elsif (f.keido.abs - @user_locate.keido.abs).abs <= 0.006
        p "経度が0.0005以内だよ！"
        if f.keido - @user_locate.keido >= 0
          f.ido -= 0.010
        else
          f.ido += 0.010
        end
        f.save
      else
        p 'ダメダメ'
        if f.ido - @user_locate.ido >= 0.006
          f.ido -= 0.005
        elsif @user_locate.ido - f.ido >= 0.006
          f.ido += 0.005
        end
        
        if f.keido - @user_locate.keido >= 0.006
          f.keido -= 0.005
        elsif @user_locate.keido - f.keido >= 0.006
          f.keido += 0.005
        end
        f.save
      end
                  
    end
  end

  module_function :user_stalke
end