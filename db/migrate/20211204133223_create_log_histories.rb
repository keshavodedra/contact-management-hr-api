class CreateLogHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :log_histories do |t|
      t.references :elementable, polymorphic: true
      t.text :old_values
      t.text :new_values
      t.timestamps
    end
  end
end
