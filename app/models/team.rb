class Team < ActiveRecord::Base

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true
  validates :description, :presence => true

  has_many :users
  belongs_to :bus


end
