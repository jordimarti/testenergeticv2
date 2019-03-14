class AddColorToComponentMurs < ActiveRecord::Migration[5.2]
  def change
  	add_column :component_murs, :color, :string
  end
end
