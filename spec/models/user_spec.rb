require 'spec_helper'

describe User do
  it "is invalid without a name, email and password" do
  	user = User.new(
  		name: 'Sandy',
  		email: 'sandy@bemonkey.net',
  		password: 'epicure97'
  	)
  	expect(user).to be_valid
  end
  it "is invalid without a name" do
  	expect(User.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an email" do
  	expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
  	expect(User.new(password: nil)).to have(1).errors_on(:password)
  end
end
