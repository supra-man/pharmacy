class Customer < ApplicationRecord
  has_many :prescriptions, dependent: :destroy

  validates :name, :phone, :address, presence: true
end
