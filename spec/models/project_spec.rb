require 'spec_helper'

describe Project do
  it "is valid with a title, a pitch" do
  	user = create(:user)
  	project = create(:project, user: user)
  	expect(project).to be_valid
  end
  it "is invalid without a title" do
  	expect(build(:project, title: nil)).to have(1).errors_on(:title)
  end

  it "is invalid without an pitch" do
  	expect(build(:project, pitch: nil)).to have(1).errors_on(:pitch)
  end
end
