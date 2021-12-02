class CreateSubSubPages < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_sub_pages do |t|

      t.timestamps
    end
  end
end
