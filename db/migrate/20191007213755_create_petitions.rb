class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.text :letter
      t.integer :signatures, default: 0

      t.timestamps
    end
  end
end
