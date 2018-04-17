class Asin < ApplicationRecord
  belongs_to :composition
  has_many :keywords
end
