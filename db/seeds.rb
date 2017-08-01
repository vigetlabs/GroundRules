if (Rails.env != 'production')
  if (!AdminUser.exists?(email: 'admin@example.com'))
    AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end

  device_image = Photo.find_or_create_by(name: 'Device Image') do |photo|
    photo.image = File.open(Rails.root.join("assets/images/device.jpg"))
  end
  roast_image = Photo.find_or_create_by(name: 'Roast Image') do |photo|
    photo.image = File.open(Rails.root.join("assets/images/roast.jpg"))
  end

  french_press = Device.find_or_create_by(name: 'French Press')
  chemex = Device.find_or_create_by(name: 'Chemex')
  keurig = Device.find_or_create_by(name: 'Keurig')
  french_press.image = device_image
  chemex.image = device_image
  chemex.save
  keurig.image = device_image
  keurig.save

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
    description: 'This is a light roast, really great',
    sub_description: 'Clearly the best, all around'
  )
  medium_roast = Roast.find_or_create_by(
    name: 'Medium Roast',
    description: 'This is a medium roast, really great',
    sub_description: 'Hmnnnn, maybe this is my favorite'
  )
  dark_roast = Roast.find_or_create_by(
    name: 'Dark Roast',
    description: 'This is a dark roast, really great',
    sub_description: "I don't know anymore!! They're all just too good"
  )
  light_roast.image = roast_image
  light_roast.save
  medium_roast.image = roast_image
  medium_roast.save
  dark_roast.image = roast_image
  dark_roast.save

  light_brand = light_roast.roast_brands.find_or_create_by(brand_name: "Peet's Coffee", roast_name: 'Colombia Luminosa')
  light_brand.image = roast_image
  light_brand.save

  medium_brand = medium_roast.roast_brands.find_or_create_by(brand_name: "Dunkin Donuts", roast_name: 'Original Blend')
  medium_brand.image = roast_image
  medium_brand.save

  dark_brand = dark_roast.roast_brands.find_or_create_by(brand_name: "Caribou Coffee", roast_name: 'Sumatra Lintong Region')
  dark_brand.image = roast_image
  dark_brand.save
end
