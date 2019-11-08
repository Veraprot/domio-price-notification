class PropertyType < ApplicationRecord
  has_many :properties
  validates :name, uniqueness: true
end
