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
        CloserAlert.where(locate_info_id: @locate_info.id).destroy_all
        @shabon_alert = ShabonAlert.new(locate_info_id: @locate_info[:id], splash: false)
        # エラー処理はしなくていいの？
        @shabon_alert.save
      end
      render json: @nayami_comment
    end
  end

  def my_post
    @nayami_comments = NayamiComment.where(user_id: @user.id).order(id: "DESC")
    render json: @nayami_comments, include: { locate_info: [:user] }
  end


  def my_shabon_nayami_find
    @nayami_comments = NayamiComment.where(yonda_flag: false).joins(:locate_info).merge(LocateInfo.where(user_id: @user.id))
    render json: @nayami_comments
  end

  def fix_yonda_flag
    @id = params[:id]
    @nayami_comments = NayamiComment.where(locate_info_id: @id).update_all(yonda_flag: true)
    render @nayami_comments
  end

  private

  def create_params
    params.require(:nayami_comment).permit(:locate_info_id, :nayami_comment).merge(user_id: @user.id)
  end
end
