class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.references :publishable, polymorphic: true, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
