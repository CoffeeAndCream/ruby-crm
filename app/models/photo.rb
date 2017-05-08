class Photo < ApplicationRecord
  dragonfly_accessor :image
  belongs_to :lead

end
