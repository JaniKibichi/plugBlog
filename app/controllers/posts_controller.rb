class PostsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show, :theposts]
 
 before_action :find_user, except: [:index, :show, :theposts]
 before_action :find_post, only: [:show, :edit, :update, :destroy]

 def theposts
  @allposts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 7)
 end

 def index
  @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 3)
 end

 def new
  @post = @user.posts.new
 end

 def create
  @post = @user.posts.new post_params

  if @post.save
   redirect_to user_post_path(@user, @post), notice: "Thank you for submitting a new post!"
  else
   render 'new', notice: "Something went wrong. Please resubmit the post."
  end
 end

 def show
 end

 def edit
 end

 def update
  if @post.update post_params
   redirect_to user_post_path(@user, @post), notice: "You have successfully updated the post."
  else
   render 'edit'
  end
 end

 def destroy
  @post.destroy
  redirect_to user_posts_path
 end

 private
 def post_params
  params.require(:post).permit(:title, :plug_thumbnail, :content, :slug)
 end

 def find_post
  @post = Post.friendly.find(params[:id])
 end

 def find_user
  @user = User.find(params[:user_id])
 end

 def require_permission
  @user = User.find(params[:user_id])
  if current_user != @user
   redirect_to root_path, notice: "Please sign up with the right credentials to view that post."
  end
 end
end
