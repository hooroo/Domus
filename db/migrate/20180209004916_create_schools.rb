class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :responsible_name, null: false
      t.string :responsible_contact, null: false
      t.text :notes
      t.timestamps
    end
  end
end
