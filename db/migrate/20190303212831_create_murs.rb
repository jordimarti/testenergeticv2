class CreateMurs < ActiveRecord::Migration[5.2]
  def change
    create_table :murs do |t|
      t.integer :edifici_id
      t.integer :entitat_id
      t.string :ambit
      t.string :nom
      t.text :descripcio
      t.decimal :superficie
      t.string :tipus_mur
      t.decimal :percentatge

      t.timestamps
    end
  end
end
