class CreateDollarCustomizations < ActiveRecord::Migration[6.1]
  def change
    create_table :dollar_customizations do |t|
      t.float :course
      t.datetime :active_to

      t.timestamps
    end
  end
end
