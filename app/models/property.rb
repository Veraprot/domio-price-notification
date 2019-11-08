class Property < ApplicationRecord
  has_many :property_records
  belongs_to :property_type
  validates :uri_id, uniqueness: true
end
