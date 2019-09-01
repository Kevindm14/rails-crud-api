class Article < ApplicationRecord
  has_many :comments
  validates_presence_of :name, :description
end
