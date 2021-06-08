class CreateForwardHooks < ActiveRecord::Migration[6.1]
  def change
    create_table :forward_hooks, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :forward, null: false, foreign_key: true, type: :uuid
      t.text :body
      t.text :head

      t.timestamps
    end
  end
end
