AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

french_press = Device.create!(name: 'French Press', image_url: 'https://cdn.shopify.com/s/files/1/0219/5410/files/french_press_icon.jpg?1078')
chemex = Device.create!(name: 'Chemex', image_url: 'https://images-na.ssl-images-amazon.com/images/I/410XbJTPshL._SY355_.jpg')
keurig = Device.create!(name: 'Keurig', image_url: 'https://allaboutharts.files.wordpress.com/2015/04/keurig_logo_highres.jpg')

DeviceProblem.create!(statement: "I'm tired", content: {'Problem' => 'Answer'}, device: keurig)
DeviceProblem.create!(statement: "My pants ripped yesterday", content: {'Problem' => 'Answer'}, device: keurig)
DeviceProblem.create!(statement: "I don't have anything better than a keurig", content: {'Problem' => 'Answer'}, device: keurig)
DeviceProblem.create!(statement: "I'm tired", content: {'Problem' => 'Answer'}, device: chemex)
DeviceProblem.create!(statement: "My pants ripped yesterday", content: {'Problem' => 'Answer'}, device: chemex)
DeviceProblem.create!(statement: "I don't have anything better than a keurig", content: {'Problem' => 'Answer'}, device: chemex)
DeviceProblem.create!(statement: "I'm tired", content: {'Problem' => 'Answer'}, device: french_press)
DeviceProblem.create!(statement: "My pants ripped yesterday", content: {'Problem' => 'Answer'}, device: french_press)
DeviceProblem.create!(statement: "I don't have anything better than a keurig", content: {'Problem' => 'Answer'}, device: french_press)

Roast.create!(
  name: 'Light Roast',
  toggle_text: 'This is a light roast, really great',
  description: 'Still a light roast, still really great',
  toggle_image_url: 'http://legacy.sweetmarias.com/roastingprocess-many-sm/5.JPG'
)
Roast.create!(
  name: 'Medium Roast',
  toggle_text: 'This is a medium roast, really great',
  description: 'Still a medium roast, still really great',
  toggle_image_url: 'http://oakcreekcoffeeroasters.com/assets/images/medium.jpg'
)
Roast.create!(
  name: 'Dark Roast',
  toggle_text: 'This is a dark roast, really great',
  description: 'Still a dark roast, still really great',
  toggle_image_url: 'http://dlo9n43mpvj20faa12i3i3lh.wpengine.netdna-cdn.com/wp-content/uploads/2006/06/Dark-Beans-w-Scoop-300x199.jpg'
)
