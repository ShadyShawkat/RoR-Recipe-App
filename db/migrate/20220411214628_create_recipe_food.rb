class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :Quantity
      t.add_reference :recipe, null: false, foreign_key: true
      t.add_reference :food, null: false, foreign_key: true
      t.timestamps
    end
  end
end
