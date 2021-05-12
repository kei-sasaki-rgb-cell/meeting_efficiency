class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"  # コメントと結びつく投稿の詳細画面に遷移する
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    if comment.destroy
      redirect_to "/posts/#{comment.post.id}"  # コメントと結びつく投稿の詳細画面に遷移する
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :evaluation).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
