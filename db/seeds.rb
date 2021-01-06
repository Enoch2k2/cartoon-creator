user = User.first

user.cartoons.create(title: "Bob's Cartoon", description: "A description")
user.cartoons.create(title: "An even Better Bob's Cartoon", description: "An even better description")
user.cartoons.create(title: "This cartoon completely flopped", description: "Sad days")