# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User
list_users = [
    ['Admin', 'Admin', 'admin@admin.com', '123456789', '$2a$10$8Ywp.F50Nr4F4mTdI3Z3ruwHTT2DELItKE9NMuzZAcEfslfhSpPqW', 'Argus']
]
list_users.each do |first_name, last_name, email, phone, password_digest, company|
  User.create(
          first_name: first_name,
          last_name: last_name,
          email: email,
          phone: phone,
          password_digest: password_digest,
          company: company
  )
end

# Admin
test_admin = User.find_by_email(list_users[0][2]).id
list_admin = [
    [test_admin, 'superadmin']
]
list_admin.each do |user_id, role|
  Administrator.create user_id: user_id, role: role
end

# type
list_type = [
    ['COC', 'COC', true]
]
list_type.each do |name, description, active|
  Type.create name: name, description: description, active: active
end

# brand
list_brand = [
    ['argus', 'self', true]
]
list_brand.each do |name, description, active|
  Brand.create name: name, description: description, active: active
end

# kind
list_kind = [
    ['administration COC', 'administration COC', true]
]
list_kind.each do |name, description, active|
  Kind.create name: name, description: description, active: active
end

# purveyors
list_purveyors = [
    ['argus', 'self', true]
]
list_purveyors.each do |name, description, active|
  Purveyor.create name: name, description: description, active: active
end

list_products = [
    [
        'PPK',
        10000,
        'ppk',
        'PPK',
        'best PPK',
        'power 20W',
        'b. PPK',
        'p. 20W',
        'photo.jpg',
        'passport.jpg',
        'certificate.jpg',
        Brand.find_by_name(list_brand[0][0]).id,
        Purveyor.find_by_name(list_purveyors[0][0]).id,
        Type.find_by_name(list_type[0][0]).id,
        Kind.find_by_name(list_kind[0][0]).id
    ],
]
list_products.each do |name, price, seo_words, seo_description, description, features, mini_description, mini_features, photo, passport, certificate, brand_id, purveyor_id, type_id, kind_id|
  Product.create(
             name: name,
             price: price,
             seo_words: seo_words,
             seo_description: seo_description,
             description: description,
             features: features,
             mini_description: mini_description,
             mini_features: mini_features,
             photo: photo,
             passport: passport,
             certificate: certificate,
             brand_id: brand_id,
             purveyor_id: purveyor_id,
             type_id: type_id,
             kind_id: kind_id
  )
end

# comments
list_comments = [
    [
        'it is good device',
        Product.find_by(name: list_products[0][0], price: list_products[0][1]).id,
        test_admin,
        true,
        false
    ]
]
list_comments.each do |note, product_id, user_id, active, new|
  Comment.create(
             note: note,
             product_id: product_id,
             user_id: user_id,
             active: active,
             new: new
  )
end