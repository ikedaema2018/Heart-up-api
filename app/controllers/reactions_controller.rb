class ReactionsController < ApplicationController
  def create
    @reaction = create_params
    unless @reaction.save
      render json:@error_message = [@nayami_comment.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
    render json: @reaction
  end


  private
  def create_params
    params.fetch(:reaction, {nayami_comment_id: nil, reply_comment_id: nil}).permit(:reaction_id).merge(user_id: @user.id)
  end
end
