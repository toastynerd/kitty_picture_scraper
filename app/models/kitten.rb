class Kitten < ActiveRecord::Base
  validates :link, :uniqueness => true
end
