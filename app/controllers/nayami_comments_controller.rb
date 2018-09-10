class NayamiCommentsController < ApplicationController
  def create 
    @nayami_comment = NayamiComment.new(create_params)
    unless @nayami_comment.save # もし、memoが保存できなかったら
      render json:@error_message = [@nayami_comment.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    else
      # Nayami_commentの数が９個になったらlocate_infoをfalseに
      if NayamiComment.where(locate_info_id: @nayami_comment[:locate_info_id]).count >= 9
        @locate_info = LocateInfo.find(@nayami_comment[:locate_info_id])
        @locate_info.update(life_flag: true)
        p "\(@locate_info[:id])番の悩みが解決しました！"
      end
      render json: @nayami_comment
    end
  end

  private

  def create_params
    params.require(:nayami_comment).permit(:locate_info_id, :nayami_comment).merge(user_id: @user.id)
  end
end
