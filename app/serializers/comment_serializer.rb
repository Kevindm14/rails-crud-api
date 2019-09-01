class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :article_id
  belongs_to :article
end
