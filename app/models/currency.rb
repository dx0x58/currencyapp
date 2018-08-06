class Currency < ApplicationRecord
  validates :value, presence: true, numericality: true, format: { with: /\A\d{1,3}(\.\d{0,4})?\z/ }

  def self.active
    find_by(active: true)
  end

  def self.forced
    active if active.try(:expiration_date).present?
  end
end
