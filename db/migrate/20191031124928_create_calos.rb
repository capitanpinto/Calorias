class CreateCalos < ActiveRecord::Migration[6.0]
  def change
    create_table :calos do |t|
      t.text :coment
      t.float :ncal
      t.float :qcal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :calos, [:user_id, :created_at]
  end
end
