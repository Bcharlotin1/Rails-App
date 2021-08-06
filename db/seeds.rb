# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Nentendo')
Category.create(name: 'EA')
Category.create(name: 'Capcom')

User.create(username: "superstar", email: "superstar@gmail.com", password: "Superstar", age: 24, about: "Lover of all games caus eim good at them")
User.create(username: "novamax", email: "novamax@gmail.com", password: "Novamax", age: 27, about: "Lover of all Sims games")

zelda = Game.find_or_create_by(title: 'The Legend of Zelda: The Wind Waker', image: 'https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/gamecube_12/SI_GCN_TheLegendOfZeldaTheWindWaker_image1600w.jpg',
description: 'The Legend of Zelda: The Wind Waker is an action-adventure game developed and published by Nintendo for the GameCube home video game console. The tenth installment in The Legend of Zelda series.',
category_id: 1)

Game.create(title: 'Animal Crossing: New Horizons', image: 'https://animal-crossing.com/new-horizons/assets/img/share-fb.jpg',
description: 'Animal Crossing: New Horizons is a 2020 life simulation game developed and published by Nintendo for the Nintendo Switch; it is the fifth main game in the Animal Crossing series.',
category_id: 1)

Game.create(title: 'The Sims 4', image: 'https://cdn.akamai.steamstatic.com/steam/apps/1222670/capsule_616x353.jpg?t=1614944793',
description: 'The Sims 4 is a 2014 life simulation video game developed by the Redwood Shores studio of Maxis and published by Electronic Arts. It is the fourth major title in The Sims series and was originally announced on May 6, 2013.',
category_id: 2)

Game.create(title: 'Mario Kart', image: 'https://i.ytimg.com/vi/1V6XecP27wE/maxresdefault.jpg',
description: 'Mario Kart is a series of go-kart racing video games developed and published by Nintendo, as a spin-off from its flagship Super Mario series. Its characters include those from the Mario, The Legend of Zelda, and Animal Crossing series, competing in races while using various items to gain advantage.',
category_id: 1)

Game.create(title: 'Street Fighter', image: 'https://cdn.vox-cdn.com/thumbor/9jW22YNSi3WZMD2fYOfcI6dm6Wg=/0x0:745x419/1200x800/filters:focal(314x151:432x269)/cdn.vox-cdn.com/uploads/chorus_image/image/53481161/S40alK5SjFqwKQbqNNOCgnH8Ou08wKxZ.0.jpg',
description: 'Street Fighter, commonly abbreviated as SF or スト, is a Japanese competitive fighting video game franchise developed and published by Capcom. The first game in the series was released in 1987, followed by five other main series games, various spin-offs and crossovers, and numerous appearances in other media.',
category_id: 3)



Review.create(content: 'Love this! Zelda one of favorite games when the Gamecube came out!', user_id: 1, game: zelda)
#iam able to use game instead of game_id: is apart of  the beelongs_to macro method 
#that gives you other methods to use :game