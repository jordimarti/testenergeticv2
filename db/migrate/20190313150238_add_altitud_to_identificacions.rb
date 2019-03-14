class AddAltitudToIdentificacions < ActiveRecord::Migration[5.2]
  def change
  	add_column :identificacions, :altitud_municipi, :integer
  end
end
