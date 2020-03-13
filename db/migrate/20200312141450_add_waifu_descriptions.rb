class AddWaifuDescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :waifus, :description, :text 
  end
end
