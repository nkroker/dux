class CreateForwards < ActiveRecord::Migration[6.1]
  def change
    create_table :forwards do |t|
      t.text :local_url
      t.text :global_url
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
