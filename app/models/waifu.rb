class Waifu < ApplicationRecord
  belongs_to :series
  has_and_belongs_to_many :users
  has_many :waifu_images
end
