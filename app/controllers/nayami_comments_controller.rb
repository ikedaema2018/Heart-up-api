class NayamiCommentsController < ApplicationController
  def create 
    @nayami_comment = NayamiComment.new(create_params)
    unless @nayami_comment.save # もし、memoが保存できなかったら
      render json:@error_message = [@nayami_comment.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      render json: @locate_info
    end
  end

  private

  def create_params
    params.require(:nayami_comment).permit(:locate_info_id, :nayami_comment).merge(user_id: @user.id)
  end
end
