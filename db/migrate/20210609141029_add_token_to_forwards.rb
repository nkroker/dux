class AddTokenToForwards < ActiveRecord::Migration[6.1]
  def change
    add_column :forwards, :url_token, :string
  end
end
