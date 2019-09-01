class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
