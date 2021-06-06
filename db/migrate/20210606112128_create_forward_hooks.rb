class CreateForwardHooks < ActiveRecord::Migration[6.1]
  def change
    create_table :forward_hooks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :forward, null: false, foreign_key: true
      t.text :body
      t.text :head

      t.timestamps
    end
  end
end
