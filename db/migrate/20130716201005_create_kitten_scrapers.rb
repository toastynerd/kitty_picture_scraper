class CreateKittenScrapers < ActiveRecord::Migration
  def change
    create_table :kitten_scrapers do |t|

      t.timestamps
    end
  end
end
