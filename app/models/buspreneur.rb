class Buspreneur < Omniauthable
  belongs_to :attachable, polymorphic: true
  delegate :bus, to: :team

  def approved?
    approved_at.present?
  end

  def approve!(approved_by)
    self.approved_by = approved_by
    touch :approved_at
  end

  def team
    attachable
  end
end
