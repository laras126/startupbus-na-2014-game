class Investment < ActiveRecord::Base
  belongs_to :investor
  belongs_to :team

  validates :amount, presence: true
end
