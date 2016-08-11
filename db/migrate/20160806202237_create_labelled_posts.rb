class CreateLabelledPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :labelled_posts do |t|
      t.references :label, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
