class Run < ApplicationRecord
    def gems inGems = nil
      if inGems != nil then
        @gems = inGems
      end
      @gems
    end

    belongs_to :user
end
