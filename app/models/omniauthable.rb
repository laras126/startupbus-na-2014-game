class Omniauthable < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :omniauthable, :trackable, :rememberable

  #validates_presence_of :email
  validates_uniqueness_of :email

  def email_required?
    false
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |omniauthable|
      omniauthable.provider = auth.provider
      omniauthable.uid = auth.uid
      omniauthable.name = auth.info.name
      omniauthable.email = auth.info.email
      omniauthable.save!
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def approved?
    approved_at.present?
  end

  def approve!(approved_by)
    self.approved_by = approved_by
    touch :approved_at
  end
end
