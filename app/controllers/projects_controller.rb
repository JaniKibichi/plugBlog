class ProjectsController < ApplicationController
 before_action :find_project only: [:show, :edit, :update, :destroy]

 def index
  @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 3)
 end

 def new
  @project = Project.new
 end

 def create
  @project = Project.new project_params
  
  if @project.save
   redirect_to @project, notice: "Your project was successfully saved."
  else
   render 'new'
  end
 end

 def show
  
 end

 private
 def find_project
  @project = Project.find(params[:id])
 end

 def project_params
  params.require(:project).permit(:title, :description, :link)
 end

end
