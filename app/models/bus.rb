class Bus < ActiveRecord::Base
  validates :name, :uniqueness => true

  has_many :conductors, as: :attachable

  has_many :teams
  has_many :buspreneurs, through: :teams
end
