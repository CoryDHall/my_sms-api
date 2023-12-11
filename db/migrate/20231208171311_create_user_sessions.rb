class CreateUserSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :user_sessions do |t|
      t.string :session_key

      t.timestamps
    end
    add_index :user_sessions, :session_key, unique: true
  end
end
