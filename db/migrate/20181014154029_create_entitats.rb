class CreateEntitats < ActiveRecord::Migration[5.2]
  def change
    create_table :entitats do |t|
      t.integer :edifici_id
      t.string :nom
      t.text :descripcio
      t.decimal :superficie
      t.string :destinacio
      t.decimal :quota
      t.string :nom_propietari
      t.string :cognoms_propietari
      t.string :email_propietari
      t.string :telefon_propietari
      t.string :adreca_propietari
      t.string :codi_postal_propietari
      t.string :municipi_propietari

      t.timestamps
    end
  end
end
