# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# AdminUser.destroy_all
# AdminUser.create!(email: 'admin@example.com', password: 'password',\
#                   password_confirmation: 'password')

OrderItem.destroy_all
Order.destroy_all
Payment.destroy_all
Product.destroy_all
Customer.destroy_all
Address.destroy_all
Province.destroy_all
OrderStatus.destroy_all
Category.destroy_all

Category.create! id: 1, description: 'Tops'
Category.create! id: 2, description: 'Bottoms'
Category.create! id: 3, description: 'Dresses'
Category.create! id: 4, description: 'Sleepwear'
Category.create! id: 5, description: 'Accessories'

OrderStatus.create! id: 1, description: 'In Progress'
OrderStatus.create! id: 2, description: 'Placed'
OrderStatus.create! id: 3, description: 'Shipped'
OrderStatus.create! id: 4, description: 'Cancelled'

Province.create! id: 1, name: 'Alberta', code: 'AB',
                 pst: 0, gst: 0.05, hst: 0
Province.create! id: 2, name: 'British Columbia', code: 'BC',
                 pst: 0.07, gst: 0.05, hst: 0
Province.create! id: 3, name: 'Manitoba', code: 'MB',
                 pst: 0.05, gst: 0.08, hst: 0
Province.create! id: 4, name: 'New Brunswick', code: 'NB',
                 pst: 0, gst: 0, hst: 0.13
Province.create! id: 5, name: 'Newfoundland and Labrador', code: 'NL',
                 pst: 0, gst: 0, hst: 0.13
Province.create! id: 6, name: 'Northwest Territories', code: 'NT',
                 pst: 0, gst: 0.05, hst: 0
Province.create! id: 7, name: 'Nova Scotia', code: 'NS',
                 pst: 0, gst: 0, hst: 0.15
Province.create! id: 8, name: 'Nunavut', code: 'NV',
                 pst: 0, gst: 0.05, hst: 0
Province.create! id: 9, name: 'Ontario', code: 'ON',
                 pst: 0, gst: 0, hst: 0.13
Province.create! id: 10, name: 'Prince Edward Island', code: 'PE',
                 pst: 0, gst: 0, hst: 0.14
Province.create! id: 11, name: 'Quebec', code: 'QC',
                 pst: 0.09975, gst: 0.05, hst: 0
Province.create! id: 12, name: 'Saskatchewan', code: 'SK',
                 pst: 0.5, gst: 0.05, hst: 0
Province.create! id: 13, name: 'Yukon', code: 'YT',
                 pst: 0, gst: 0.05, hst: 0

Address.create! id: 1, street_address: '123 Greene Ave', city: 'Winnipeg',
                postal_code: 'R2K 0L8', province_id: 3
Address.create! id: 2, street_address: '987 Rainbow Road', city: 'Valhalla',
                postal_code: 'R2K 0L8', province_id: 2

Customer.create! first_name: 'Felix', last_name: 'Haywood',
                 company: 'Threenagers Rock! inc', phone_number: '204-987-6543',
                 email: 'f.auberon@example.com', password: 'password',
                 address_id: 1
Customer.create! first_name: 'Charlemagne', last_name: 'Rabbit',
                 phone_number: '204-876-6543',
                 email: 'cmagne@example.com', password: 'password',
                 address_id: 2
Customer.create! first_name: 'Orpheus', last_name: 'Bunny',
                 company: 'Hay-Oats R Us', phone_number: '204-887-6543',
                 email: 'dark.lord@example.com', password: 'password',
                 address_id: 1

Product.create! id: 101, name: 'Rainbow Unicorn', description: 'Graphic Onesie',
                details: '100% Organic Cotton Jersey', price: 21.99, qty: 100,
                image: '/uploads/product/image/1/unicorn-rainbow-onesie.jpg',
                category_id: 1, active: true
Product.create! id: 103, name: 'Bananacorn', description: 'Printed Tee',
                details: '100% Organic Cotton Jersey', price: 23.99, qty: 100,
                image: '/uploads/product/image/3/top_bananacorn.png',
                category_id: 1, active: true
Product.create! id: 104, name: 'Art Thou Stylin', description: 'Printed Tank',
                details: '100% Organic Cotton Jersey', price: 22.99, qty: 100,
                image: '/uploads/product/image/4/tee-action-jackson.jpg',
                category_id: 1, active: true
Product.create! id: 105, name: 'Peppermint Pantsies',
                description: 'Printed Pants',
                details: '100% Organic Cotton Jersey', price: 28.99, qty: 100,
                image: '/uploads/product/image/5/bottoms-peppermint-pants.jpg',
                category_id: 2, active: true
Product.create! id: 106, name: 'Make a Splash', description: 'Printed Leggings',
                details: '100% Organic Cotton Jersey', price: 32.99, qty: 100,
                image: '/uploads/product/image/9/sleep-cherry-birds.jpg',
                category_id: 2, active: true
Product.create! id: 107, name: 'Jungle Jumper', description: 'Printed Dress',
                details: '100% Organic Cotton Jersey', price: 38.99, qty: 100,
                image: '/uploads/product/image/7/dress-jungle.jpg',
                category_id: 3, active: true
Product.create! id: 108, name: 'Seeing Stripes', description: 'Fashion Dress',
                details: '100% Organic Cotton Jersey', price: 39.99, qty: 100,
                image: '/uploads/product/image/8/dress-seeing-stripes.jpg',
                category_id: 3, active: true
Product.create! id: 109, name: 'Cherry Birds', description: 'Printed Sleeper',
                details: '100% Organic Cotton Jersey', price: 32.99, qty: 100,
                image: '/uploads/product/image/9/sleep-cherry-birds.jpg',
                category_id: 4, active: true
Product.create! id: 110, name: 'Ruler of All', description: 'Printed Sleeper',
                details: '100% Organic Cotton Jersey', price: 32.99, qty: 100,
                image: '/uploads/product/image/10/sleep-ruler-of-all.jpg',
                category_id: 4, active: true
Product.create! id: 111, name: 'Feathered Friend', description: 'Bandana Bib',
                details: '100% Organic Cotton Jersey', price: 14.99, qty: 100,
                image: '/uploads/product/image/11/acc-feathered-friend.jpg',
                category_id: 5, active: true
Product.create! id: 112, name: 'Electric Dreams', description: 'Bandana Bib',
                details: '100% Organic Cotton Jersey', price: 20.99, qty: 100,
                image: '/uploads/product/image/12/acc-electric-dreams.jpg',
                category_id: 5, active: true

Payment.create! payment_type: 'Mastercard', amount: 33.89,
                address_id: 1, order_id: 1

Order.create! id: 1, pst: 0.05, gst: 0.08, hst: 0, shipping: 8.00,
              subtotal: 21.99, address_id: 1, customer_id: 1,
              order_status_id: 2, payment_id: 1

OrderItem.create! price: 14.99, qty: 1,
                  order_id: 1, product_id: 111
