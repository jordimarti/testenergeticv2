class CreateEdificis < ActiveRecord::Migration[5.2]
  def change
    create_table :edificis do |t|
      t.integer :user_id
      t.string :nom

      t.timestamps
    end
  end
end
