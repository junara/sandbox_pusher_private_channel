# frozen_string_literal: true

User.delete_all
Chat.delete_all

User.create(id: 1, name: 'hoge')
User.create(id: 2, name: 'fuga')
User.create(id: 3, name: 'puyo')
