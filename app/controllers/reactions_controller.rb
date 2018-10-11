class ReactionsController < ApplicationController
  def create
    p "---------daw-------------------------"
    p params
    @reaction = Reaction.new(create_params)
    unless @reaction.save
      render json:@error_message = [@nayami_comment.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
    render json: @reaction
  end


  private
  def create_params
    params.fetch(:reaction, {nayami_comment_id: nil, reply_comment_id: nil}).permit(:reaction_id, :nayami_comment_id, :reply_comment_id).merge(user_id: @user.id)
  end
end
