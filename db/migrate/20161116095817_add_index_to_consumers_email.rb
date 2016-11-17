class AddIndexToConsumersEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :consumers, :email,unique: true
  end
end
