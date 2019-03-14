class AddPosicioToComponentMurs < ActiveRecord::Migration[5.2]
  def change
  	add_column :component_murs, :posicio, :integer
  end
end
