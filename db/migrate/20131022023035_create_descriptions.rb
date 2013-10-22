class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :skills
      t.string :looking_for
      t.string :my_idea

      t.timestamps
    end
  end
end
