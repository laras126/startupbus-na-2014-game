class Team < ActiveRecord::Base

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true
  validates :description, :presence => true

  has_many :users
  belongs_to :bus

  def self.sorted_by_score
    Team.all.sort_by {|team| team.ranking}
  end

  def pending_approvals
    User.where(:team_id => self.id, :team_status => "pending")
  end
end
