class Currency < ApplicationRecord
  validates :value, presence: true, numericality: true, format: { with: /\A\d{1,3}(\.\d{0,4})?\z/ }
end
