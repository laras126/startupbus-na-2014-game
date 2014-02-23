class Conductor < Omniauthable
  def approved?
    approved_at.present?
  end

  def approve!
    touch :approved_at
  end
end
