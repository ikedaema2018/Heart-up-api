class ApplicationController < ActionController::API
  before_action :login_check

  # private
    def login_check
      @user = User.find_by(auth_token: params["auth_token"])
      if @user.nil?
        render status: 401, json: { status: 401, message: 'ユーザー情報がおかしい' }
      end
    end
end
