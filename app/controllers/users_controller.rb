class UsersController < ApplicationController
  skip_before_action :login_check, only: [:create]
  before_action :set_user, only: [:update]

  # GET /users
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  # GET /users/1
  # def show
  #   @user = User.find(params[:id])
  #   render json: @user
  # end

  # POST /users
  def create
    @user = User.create(user_params)
 
    @user["age"] = @user["age"].to_i
    if @user.save
      render json: @user, status: :created, location: @user
    else
      error_messages = @user.errors.keys.map { |key| [key, @user.errors.full_messages_for(key)]}.to_h
      render json: {message: error_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/intro_update
  def intro_update
    if @user.update(intro_create)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def one_hour_ago_user
    today = DateTime.now()
    one_hour_ago = today - Rational(1, 24)
    @users = UserLocate.where("updated_at > ?", one_hour_ago)
    render json: @users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_name, :email, :password_digest, :age, :self_introduce, :gender)
    end

    def intro_create
      params.permit(:self_introduce)
    end
end
