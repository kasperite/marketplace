namespace :products do
  desc "import products from json file"
  task import: :environment do
    puts "Importing products..."
    JSON.parse(File.read(File.join(Rails.root, "products.json"))).each do |product|
      Product.create!(id: product["uuid"], name: product["name"], price: ((product["price"].to_f * 100)).to_i)
    end
  end
end