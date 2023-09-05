# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "féfé",
            email: "fefe@gmail.com",
            password: "azerty",
            password_confirmation: "azerty",)

User.create(username: "charlydac",
            email: "charlydac@gmail.com",
            password: "azerty",
            password_confirmation: "azerty",)

User.create(username: "tibogrx",
            email: "thibautgoriouxc@gmail.com",
            password: "azerty",
            password_confirmation: "azerty",
            confirmed_at: "2018-03-27 20:30:00 +0100")

Item.create(description: "Barquette de fraise",
            date: "2019-03-27 20:30:00 +0100",
            address: "1 rue rivoli, paris",
            category: "smallfridge",
            user_id: 1,)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/1.jpg"), filename: '1.jpg')

Item.create(description: "Reste frigo : legumes + produits laitiers",
            date: "2019-03-27 21:30:00 +0100",
            address: "10 rue beaurepaire, paris",
            category: "largefridge",
            user_id: 2)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/2.jpg"), filename: '2.jpg')

Item.create(description: "Gateau d'anniversaire",
            date: "2019-03-27 21:30:00 +0100",
            address: "19 rue faubourg saint denis, paris",
            category: "mediumfridge",
            user_id: 2)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/3.jpeg"), filename: '3.jpeg')

Item.create(description: "Panier de légumes frais",
            date: "2019-03-27 21:30:00 +0100",
            address: "3 rue du temple, paris",
            category: "largefridge",
            user_id: 1)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/4.jpg"), filename: '4.jpg')

Item.create(description: "Reste de viande d'agneau",
            date: "2019-03-27 19:30:00 +0100",
            address: "3 boulevard bonne nouvelle, paris",
            category: "mediumfridge",
            user_id: 2)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/5.jpg"), filename: '5.jpg')

Item.create(description: "Pommes et poires",
            date: "2019-03-27 22:30:00 +0100",
            address: "3 boulevard des capucines, paris",
            category: "mediumfridge",
            user_id: 1,)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/6.jpg"), filename: '6.jpg')

Item.create(description: "6 pommes",
            date: "2019-03-27 22:30:00 +0100",
            address: "15 rue oberkampf , paris",
            category: "smallfridge",
            user_id: 1,)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/7.jpg"), filename: '7.jpg')

Item.create(description: "Restes divers",
            date: "2019-03-27 22:30:00 +0100",
            address: "4 rue de lappe , paris",
            category: "mediumfridge",
            user_id: 2,)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/8.jpg"), filename: '8.jpg')

Item.create(description: "Restes divers",
            date: "2019-03-27 22:30:00 +0100",
            address: "4 boulevard voltaire , paris",
            category: "mediumfridge",
            user_id: 2,)
Item.last.image.attach(io: File.open(Rails.root + "db/seed_images/9.jpg"), filename: '9.jpg')
