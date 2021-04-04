class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text    :text
      t.integer :contents,       null: false
      t.integer :time_id,        null: false
      t.integer :progress_id,    null: false
      t.integer :information_id, null: false
      t.integer :people_id,      null: false

      t.timestamps
    end
  end
end
