class CreateComponentMurs < ActiveRecord::Migration[5.2]
  def change
    create_table :component_murs do |t|
      t.integer :mur_id
      t.string :nom
      t.decimal :conductivitat
      t.decimal :gruix
      t.decimal :resistencia_termica

      t.timestamps
    end
  end
end
