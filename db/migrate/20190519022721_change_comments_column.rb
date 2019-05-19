class ChangeCommentsColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :body, :text, null: false
    change_column :comments, :status, :string, null: false, default: "unapproved"
  end

  def down
    change_column :comments, :body, :text, null: true
    change_column :comments, :status, :string, null: true
  end
end
