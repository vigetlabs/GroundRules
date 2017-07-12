if (Rails.env != 'production')
  if (!AdminUser.exists?(email: 'admin@example.com'))
    AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end

  french_press = Device.find_or_create_by(name: 'French Press', image_url: 'https://cdn.shopify.com/s/files/1/0219/5410/files/french_press_icon.jpg?1078')
  chemex = Device.find_or_create_by(name: 'Chemex', image_url: 'https://images-na.ssl-images-amazon.com/images/I/410XbJTPshL._SY355_.jpg')
  keurig = Device.find_or_create_by(name: 'Keurig', image_url: 'https://allaboutharts.files.wordpress.com/2015/04/keurig_logo_highres.jpg')

  create_block = -> (problem) { problem.content = { 'Problem' => 'Answer' } }
  DeviceProblem.find_or_create_by(statement: "I'm tired", device: keurig, &create_block)
  DeviceProblem.find_or_create_by(statement: "My pants ripped yesterday", device: keurig, &create_block)
  DeviceProblem.find_or_create_by(statement: "I don't have anything better than a keurig", device: keurig, &create_block)
  DeviceProblem.find_or_create_by(statement: "I'm tired", device: chemex, &create_block)
  DeviceProblem.find_or_create_by(statement: "My pants ripped yesterday", device: chemex, &create_block)
  DeviceProblem.find_or_create_by(statement: "I don't have anything better than a keurig", device: chemex, &create_block)
  DeviceProblem.find_or_create_by(statement: "I'm tired", device: french_press, &create_block)
  DeviceProblem.find_or_create_by(statement: "My pants ripped yesterday", device: french_press, &create_block)
  DeviceProblem.find_or_create_by(statement: "I don't have anything better than a keurig", device: french_press, &create_block)

  Roast.find_or_create_by(
    name: 'Light Roast',
    toggle_text: 'This is a light roast, really great',
    description: 'Still a light roast, still really great',
    toggle_image_url: 'http://legacy.sweetmarias.com/roastingprocess-many-sm/5.JPG'
  )
  Roast.find_or_create_by(
    name: 'Medium Roast',
    toggle_text: 'This is a medium roast, really great',
    description: 'Still a medium roast, still really great',
    toggle_image_url: 'http://oakcreekcoffeeroasters.com/assets/images/medium.jpg'
  )
  Roast.find_or_create_by(
    name: 'Dark Roast',
    toggle_text: 'This is a dark roast, really great',
    description: 'Still a dark roast, still really great',
    toggle_image_url: 'http://dlo9n43mpvj20faa12i3i3lh.wpengine.netdna-cdn.com/wp-content/uploads/2006/06/Dark-Beans-w-Scoop-300x199.jpg'
  )
end
