class ProjectsController < ApplicationController
	#before_filter :authenticate_user!
	respond_to :json, :html
	def index
		@projects = Project.all
		respond_with @projects
	end

	def show
		@project = Project.find(params[:id])
		respond_with @project
		
	end

	def new
		
	end

	def create
		@project = Project.new(project_params)
		@project.save
		redirect_to @project
	end

	private
		def project_params
			params.require(:project).permit(:title, :pitch, :user_id)
		end
end
