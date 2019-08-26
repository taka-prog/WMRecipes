class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string	:recipe_name, null: false
      t.string	:cooking_image_id
      t.integer	:user_id,		null: false
      t.text	:author_comment
      t.timestamps
    end
  end
end
