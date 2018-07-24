class WordSerializer < ActiveModel::Serializer
  attributes :id, :word, :def
  has_one :user
end
