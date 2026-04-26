class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validate :single_super_admin, on: :create

  private

  def single_super_admin
    return unless User.exists?

    errors.add(:base, "Only one Super Admin account is allowed")
  end
end
