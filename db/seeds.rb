users_to_create = [{
  first_name: "Test",
  last_name: "1",
  email: "test1@email.com",
  password: "p",
  password_confirmation: "p"
}, {
  first_name: "Test 2",
  last_name: "Test 2",
  email: "test2@email.com",
  password: "p",
  password_confirmation: "p"
}]

users_to_create.each{ |user| User.create(user) }

posts_to_create = [{
  user_id: 1,
  title: "Test Title",
  body: "Test Body"
}, {
  user_id: 2,
  title: "Test Title 2",
  body: "Test Body 2"
}]

posts_to_create.each{ |post| Post.create(post) }

comments_to_create = [{
  post_id: 1,
  body: "Test body",
  title: "Test Title"
}, {
  post_id: 1,
  body: "Test body 2",
  title: "Test Title 2"
}, {
  post_id: 2,
  body: "Test body 3",
  title: "Test Title 3"
}, {
  post_id: 2,
  body: "Test body 4",
  title: "Test Title 4"
}]

comments_to_create.each{ |comment| Comment.create(comment) }