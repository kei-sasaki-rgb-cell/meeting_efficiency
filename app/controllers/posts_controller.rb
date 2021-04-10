class PostsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = Post.new(post_params)
    if @post.save
      test
      binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params #postモデルの情報を受け取るように設定
    params.require(:post).permit(:text,:content_id,:meeting_time_id,:progress_id,:information_id,:people_id)
  end

  def test
    sum = @post.content_id + @post.meeting_time_id + @post.progress_id + @post.information_id + @post.people_id
  end
end
