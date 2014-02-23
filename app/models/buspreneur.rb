class Buspreneur < Omniauthable
  def approved?
    approved_at.present?
  end

  def approve!(approved_by)
    self.approved_by = approved_by
    touch :approved_at
  end
end
