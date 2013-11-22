class ProjectsController < ApplicationController
	#before_filter :authenticate_user!
	respond_to :json, :html
	#------------------------------GET--------------------------------------
	def index
		@projects = Project.all
		respond_with @projects
	end

	def show
		@project = Project.find(params[:id])
		respond_with @project
	end

	def new
		@project = Project.new(params[:project])
		respond_with @project
	end

	#------------------------------POST--------------------------------------
	def create
		@project = Project.new(params[:project].permit(:title, :pitch))
		
		if @project.save
		    redirect_to @project
		else
		    render 'new'
		end
		
	end
	#------------------------------PATCH---------------------------------------
	def edit
		@project = Project.find(params[:id])

		if params.has_key?(:project)
			@project.update(params[:project].permit(:title, :pitch))
			redirect_to @project
		else
			render 'edit'
		end
	end
	def update
		@project = Project.find(params[:id])

		if @project.update(params[:project].permit(:title, :pitch))
			redirect_to @project
		else
			render 'edit'
		end
	end

	#------------------------------DESTROY--------------------------------------
	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	#------------------------------PRIVATE--------------------------------------
	private
		def project_params
			params.require(:project).permit(:title, :pitch)
		end
end
