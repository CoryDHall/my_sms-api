class AddErrorMessageToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :error_message, :string
  end
end
