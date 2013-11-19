class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :pitch, :user
end
