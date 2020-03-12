class Waifu < ApplicationRecord
  belongs_to :series
  has_and_belongs_to_many :users
  attr_accessor :level
  has_many :waifu_images
end
