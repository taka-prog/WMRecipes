class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string	:food_name, null: false
      t.integer	:recipe_id,	null: false
      t.string	:amount, null: false
    end
  end
end
