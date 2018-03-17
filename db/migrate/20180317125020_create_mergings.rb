class CreateMergings < ActiveRecord::Migration[5.2]
  def change
    create_table :mergings do |t|
      t.references :template, foreign_key: true
      t.references :actor, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
