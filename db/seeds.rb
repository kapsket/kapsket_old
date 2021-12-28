# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#
#
User.create(first_name: 'Romain' ,last_name: 'PODDEVIN' ,phone: '+33645293849', email: 'poddevin.romain@gmail.com', password: '42Mouss@k@pourmoa!' ,is_admin: true)
print("admin user created")
Product.create(name: 'Kapsket',price: '20',description: 'The original',stock: '10')
print("product created")