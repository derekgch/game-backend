class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :word


  validates_uniqueness_of :word_id, :scope => :user_id
end
