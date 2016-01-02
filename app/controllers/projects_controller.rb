class ProjectsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show, :theprojects]

 before_action :find_user, except: [:index, :show, :theprojects]
 before_action :find_project, only: [:show, :edit, :update, :destroy]

 def theprojects
  @allprojects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 7)
 end 

 def index
  @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 3)
 end

 def new
  @project = @user.projects.new
 end

 def create
  @project = @user.projects.new project_params
  
  if @project.save
   redirect_to user_project_path(@user, @project), notice: "Your project was successfully saved."
  else
   render 'new'
  end
 end

 def show
 end

 def edit
 end

 def update
  if @project.update project_params
    redirect_to user_project_path(@user,@project), notice: "Your project was successfully updated."
  else
    render 'edit'
  end
 end

 def destroy
  @project.destroy
  redirect_to projects_path
 end

 private
 def find_project
  @project = Project.friendly.find(params[:id])
 end

 def project_params
  params.require(:project).permit(:title, :proj_thumbnail, :description, :link)
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
