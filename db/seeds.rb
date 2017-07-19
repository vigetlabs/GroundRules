if (Rails.env != 'production')
  if (!AdminUser.exists?(email: 'admin@example.com'))
    AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end

  french_press = Device.find_or_create_by(name: 'French Press')
  chemex = Device.find_or_create_by(name: 'Chemex')
  keurig = Device.find_or_create_by(name: 'Keurig')

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
    description: 'Still a light roast, still really great'
  )
  Roast.find_or_create_by(
    name: 'Medium Roast',
    toggle_text: 'This is a medium roast, really great',
    description: 'Still a medium roast, still really great'
  )
  Roast.find_or_create_by(
    name: 'Dark Roast',
    toggle_text: 'This is a dark roast, really great',
    description: 'Still a dark roast, still really great'
  )
end
