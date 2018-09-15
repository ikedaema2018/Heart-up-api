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
        f.ido -= 0.0001
      else
        f.ido += 0.0001
      end
      
      if f.keido - @user_locate.keido >= 0
        f.keido -= 0.0001
      else
        f.keido += 0.0001
      end
      f.save
      
    end
  end

  module_function :user_stalke
end