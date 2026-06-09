Table users {
  user_id int [primary key]
  email varchar(100)
  password varchar(100)
}

Table character {
  character_id int [primary key]
  user_id int
  name varchar(50)
  level int
  stats varchar(255)
  class varchar(50)
}

Table item {
  item_id int [primary key]
  name varchar(100)
  type varchar(50)
}

Table inventory {
  character_id int
  item_id int
  quantity int

  Indexes {
    (character_id, item_id) [pk]
  }
}

Ref: character.user_id > users.user_id
Ref: inventory.character_id > character.character_id
Ref: inventory.item_id > item.item_id