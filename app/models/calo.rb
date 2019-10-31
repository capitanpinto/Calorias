class Calo < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
#  validates :ncal && :qcal, numericality: true
#  validates :ncal || :qcal, presence: true
  validates :ncal, presence: true, unless: ->(calo){calo.qcal.present?}
  validates :coment, length: { maximum: 140 }
end
