class CreateUndercomments < ActiveRecord::Migration[5.1]
  def change
    create_table :undercomments do |t|
      t.string :content
      t.string :commenter
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
