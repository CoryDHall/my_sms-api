class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :phone, null: false, index: true

      t.string :status
      t.string :sid, index: true
      t.references :user_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
