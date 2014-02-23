class Conductor < Omniauthable
  belongs_to :bus, polymorphic: true

  def approved?
    approved_at.present?
  end

  def approve!
    touch :approved_at
  end
end
