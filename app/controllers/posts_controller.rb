class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :show]
  helper_method :set_sum

  def index
    @users = User.all
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    if @post.save
        #test
        #binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  private

  def post_params #postモデルの情報を受け取るように設定
    params.require(:post).permit(:image, :title, :text, :content_id, :meeting_time_id, :progress_id, :information_id, :people_id).merge(user_id: current_user.id)
  end

  def set_sum #アクティブハッシュのid同士を足す
    @sum = (@post.content_id - 1) + (@post.meeting_time_id - 1) + (@post.progress_id - 1) + (@post.information_id - 1) + (@post.people_id - 1)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
