class PropertyRecord < ApplicationRecord
  belongs_to :property
  validates :uri_id, uniqueness: true
end
