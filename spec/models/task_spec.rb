require 'spec_helper'

describe Task do
  it "is valid with a title body completed" do
  	project = create(:project)
  	task = create(:task, project: project)
  	expect(task).to be_valid
  end
  it "is invalid without a title" do
  	expect(build(:task, title: nil)).to have(1).errors_on(:title)
  end

  it "is invalid without an body" do
  	expect(build(:task, body: nil)).to have(1).errors_on(:body)
  end
end
