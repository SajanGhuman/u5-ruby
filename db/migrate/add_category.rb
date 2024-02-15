class add_category < ActiveRecord::Migration[7.1]
    def change
      add_reference :products, :categories, foreign_key: true
    end
  end
  