class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.belongs_to :website, index: true
      t.string :content
      t.integer :heading_type

      t.timestamps
    end
  end
end
