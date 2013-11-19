require 'spec_helper'

describe ProjectsController do
	it "has a valid factory" do
		user = create(:user)
		project = create(:project, user: user)
		expect(project).to be_valid
	end

	describe 'Get #index' do
		it "render the :new emplate" do
			user = create(:user)
			project = create(:project, user: user)
			get :index
			expect(assigns(:projects)).to match_array([project])
		end
	end

	describe 'Get #show' do
		it "render the :new emplate" do
			user = create(:user)
			project = create(:project, user: user)
			get :show, id: project
			expect(assigns(:project)).to eq project
		end
	end

	describe 'Get #new' do
		it "render the :new emplate" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		it "redirects to project#show" do
			post :create, project: attributes_for(:project)
			expect(response).to redirect_to projects_path(assigns[:project])
		end
	end
end
