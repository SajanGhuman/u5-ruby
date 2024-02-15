require 'csv'
Product.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'products'")

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |row|
    category = row['category'].strip

  category = Category.find_or_create_by(name: category)

  Product.create(
    title: row['name'].strip,
    price: row['price'].to_f,
    stock_quantity: row['stock_quantity'].to_i,
    category: category
  ) 
end
