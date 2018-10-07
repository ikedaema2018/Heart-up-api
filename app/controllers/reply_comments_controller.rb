class ReplyCommentsController < ApplicationController
  def create
    p params
    p "--------------------@reply_comment-----------------"
    p create_params
    @reply_comment = ReplyComment.new(create_params)
    # エラー処理
    unless @reply_comment.save # もし、memoが保存できなかったら
      render json:@error_message = [@reply_comment.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      render json:@reply_comment
    end
  end

  private
    def create_params
      params.require(:reply_comment).permit(:reply_comment, :nayami_comment_id).merge(user_id: @user.id)
    end
end
