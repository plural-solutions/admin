# Restaurant
puts "Inserting Restaurants.."
restaurant = Restaurant.find_or_create_by!(name: 'Bar do zé')

# Admin Users
puts "Inserting AdminUsers.."
restaurant.users.create!(
  email: 'admin@menyoo.com.br',
  password: '123456',
  role: 'admin'
)

restaurant.users.create!(
  email: 'chef@menyoo.com.br',
  password: '123456',
  role: 'chef'
)

# Product
product = restaurant.products.create!(
  title: 'Product 1',
  description: 'Anything',
  image: 'http://image.com',
  price: 1200
)

# Ingredient group
ig = product.ingredient_groups.new(
  title: 'group blablanha'
)

# Ingredient
ig.ingredients.new([
    { name: 'Ingredient 1', price: 1000 },
    { name: 'Ingredient 2', price: 5000 }
  ]
)
ig.save!

# Order

order = restaurant.orders.create!(
  user_id: 'abc123',
  status: 'requested',
)

# Creating Product Orders and Ingredients Product Order

# 1 Product into Order
po = order.product_orders.create!(
  quantity: 3,
  product: product,
  total_price_cents: 15000,
)
po.ingredient_product_orders.create!(
  [
    { ingredient: Ingredient.first },
    { ingredient: Ingredient.second }
  ]
)

# 2 Product into Order
po = order.product_orders.create!(
  quantity: 1,
  product: product,
  total_price_cents: 10000,
)

po.ingredient_product_orders.create!(
  ingredient: Ingredient.first
)