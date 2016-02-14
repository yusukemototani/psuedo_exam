class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :title
      t.string :comment
      t.timestamps null: false
    end
  end
end
