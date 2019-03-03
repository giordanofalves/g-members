class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :url
      t.string :url_shortened
      t.belongs_to :member, index: true

      t.timestamps
    end
  end
end
