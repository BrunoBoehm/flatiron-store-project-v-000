class CreateLineItems < ActiveRecord::Migration
  def change
  	create_table :line_items do |t|
  		t.belongs_to :cart
  		t.belongs_to :item
  		t.integer :quantity, default: 1
  	end
  end
end
