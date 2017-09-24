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

# Products
# 1
product = restaurant.products.create!(
  title: 'Pizza',
  description: 'Pizza boa',
  image: 'http://image.com',
  price: 20
)
ig = product.ingredient_groups.new(
  title: 'Queijo'
)
ig.ingredients.new([
    { name: 'Gorgonzola', price: 1.4 },
    { name: 'Muçarela', price: 0.5 }
  ]
)
ig.save!

# 2

product = restaurant.products.create!(
  title: 'Pizza Presunto',
  description: 'Pizza de preseunto',
  image: 'http://image.com',
  price: 30
)
ig = product.ingredient_groups.new(
  title: 'Queijo'
)
ig.ingredients.new([
    { name: 'Ingrediente adicional', price: 5 },
  ]
)
ig.save!

# Order

product = restaurant.products.first
order = restaurant.orders.create!(
  user_id: 'abc123',
  status: 'requested',
)

# Creating Product Orders and Ingredients Product Order

# 1
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

# 2
po = order.product_orders.create!(
  quantity: 1,
  product: product,
  total_price_cents: 10000,
)

po.ingredient_product_orders.create!(
  ingredient: Ingredient.first
)


# Restaurant 2
restaurant = Restaurant.find_or_create_by!(name: 'Outback')

# Products
# 1
product = restaurant.products.create!(
  title: 'Costela',
  description: 'Delicious',
  image: 'http://image.com',
  price: 100
)
ig = product.ingredient_groups.new(
  title: 'Molho'
)
ig.ingredients.new([
    { name: 'Branco', price: 1.4 },
    { name: 'Amarelo', price: 0.5 }
  ]
)
ig.save!