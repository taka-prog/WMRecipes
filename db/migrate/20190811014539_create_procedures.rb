class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|

      t.integer	:recipe_id, null: false
      t.integer	:no,		null: false
      t.string	:detail,	null: false
      t.string	:picture_id
      t.timestamps
    end
  end
end
