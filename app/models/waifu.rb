class Waifu < ApplicationRecord
  belongs_to :series
  has_and_belongs_to_many :users
  
  def level inLevel = nil
    if inLevel != nil then
      @level = inLevel
    end
    @level
  end
end
