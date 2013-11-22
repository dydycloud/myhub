require 'spec_helper'

describe ProjectsController do

	before(:each) do
		@user = create(:user) 
		@project = create(:project, user: @user)
	end
	it "has a valid factory" do
		expect(@project).to be_valid
	end

	describe 'GET#index' do
		it "Return an array of projects" do
			get :index
			expect(assigns(:projects)).to match_array([@project])
		end
	end

	describe 'GET#show' do
		it "located the requested @project" do
			get :show, id: @project
			expect(assigns(:project)).to eq @project
		end
	end

	describe 'GET#new' do
		it "Assign a new Project to @project" do
			get :new
			expect(assigns(:project)).to be_a_new(Project)
		end
	end

	describe 'GET#edit' do
		it "located the requested @project" do
			get :edit, id: @project
			expect(assigns(:project)).to eq @project
		end
	end

	describe "POST#create" do
		it "Add a new project in bdd" do
			expect{
				post :create, project: attributes_for(:project)
			}.to change(Project, :count).by(1)
		end
	end

	describe 'PATCH#update' do
		it "located the requested @project" do
			patch :update, id: @project, project: attributes_for(:project)
			expect(assigns(:project)).to eq @project
		end
		it "Updated the requested project" do
			patch :update, id: @project, project: attributes_for(:project, title: "EmmoProject")
			@project.reload
			expect(@project.title).to eq("EmmoProject")
		end
	end

	describe 'DELETE#destroy' do
		it "delete the project" do
			expect{
				delete :destroy, id: @project
			}.to change(Project,:count).by(-1)
		end
	end
end
