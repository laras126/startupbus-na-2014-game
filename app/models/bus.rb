class Bus < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :teams
end
