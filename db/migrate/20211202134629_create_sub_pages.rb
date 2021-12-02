class CreateSubPages < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_pages do |t|

      t.timestamps
    end
  end
end
