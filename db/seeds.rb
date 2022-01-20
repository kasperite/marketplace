# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Promotion.find_or_create_by(
  name: "20% off on total greater than $100",
  description: "Discount applied: 20% off on total greater than $100",
  discount_rate: 20,
  threshold: 10000
)

Promotion.find_or_create_by(
  name: "10% off on total greater than $20",
  description: "Discount applied: 10% off on total greater than $20",
  discount_rate: 10,
  threshold: 2000
)

Promotion.find_or_create_by(
  name: "15% off on total greater than $50",
  description: "Discount applied: 15% off on total greater than $50",
  discount_rate: 15,
  threshold: 5000
)