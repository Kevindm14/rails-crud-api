class Comment < ApplicationRecord
  validates_presence_of :description
  belongs_to :article
end
