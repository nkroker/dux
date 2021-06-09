class CreateForwards < ActiveRecord::Migration[6.1]
  def change
    create_table :forwards, id: :uuid do |t|
      t.text :local_url
      t.text :global_url
      t.boolean :active
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
