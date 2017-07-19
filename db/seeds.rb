if (Rails.env != 'production')
  if (!AdminUser.exists?(email: 'admin@example.com'))
    AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end

  device_image = Photo.create(name: 'Device Image') do |photo|
    photo.image = File.open(Rails.root.join("assets/images/device.jpg"))
  end
  roast_image = Photo.create(name: 'Roast Image') do |photo|
    photo.image = File.open(Rails.root.join("assets/images/roast.jpg"))
  end

  french_press = Device.find_or_create_by(name: 'French Press')
  chemex = Device.find_or_create_by(name: 'Chemex')
  keurig = Device.find_or_create_by(name: 'Keurig')
  french_press.image = device_image
  chemex.image = device_image
  keurig.image = device_image

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

  light_roast = Roast.find_or_create_by(
    name: 'Light Roast',
    toggle_text: 'This is a light roast, really great',
    description: 'Still a light roast, still really great',
  )
  medium_roast = Roast.find_or_create_by(
    name: 'Medium Roast',
    toggle_text: 'This is a medium roast, really great',
    description: 'Still a medium roast, still really great',
  )
  dark_roast = Roast.find_or_create_by(
    name: 'Dark Roast',
    toggle_text: 'This is a dark roast, really great',
    description: 'Still a dark roast, still really great',
  )
  light_roast.toggle_image = roast_image
  medium_roast.toggle_image = roast_image
  dark_roast.toggle_image = roast_image
end
