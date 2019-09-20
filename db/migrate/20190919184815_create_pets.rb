class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :name
      t.string :breed
      t.string :size
      t.string :gender
      t.string :color
      t.string :age
      t.string :behavior

      t.timestamps
    end
  end
end
