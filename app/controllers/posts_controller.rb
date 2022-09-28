class PostsController < ApplicationController
  include SuggestedUsers

  before_action :set_post, only: %i[show]
  before_action :set_sugested_users, only: %i[index]

  def index
    #flash.now[:notice] = "Yay!!"
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(created_by: current_user))

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:photo, :description)
  end
end
