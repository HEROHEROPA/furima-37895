# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

｜Column                | Type     |  Options                 |
｜----------------------| -------  |  ----------------------  | 
｜email                 | string   |  null: false, unique:true|       
｜encrypted_password    | string   |  null: false             |
｜name                  | string   |  null: false             |


### Association

- has_many :items
- has_many :shippings



## items テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -----------------------------    |
｜item_name             | string        |  null: false                      |
｜type                  | string        |  null: false                      |
｜price                 | string        |  null: false                      |
｜comment               | text          |  null: false                      |
｜user_id               | references    |  null: false ,foreign_key: true   |


### Association

- belongs_to :user
- has_one :shipping



## shippings テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -------------------------------- |
｜address               | text          |  null: false                      |
｜item_id               | references    |  null: false ,foreign_key: true   |
｜user_id               | references    |  null: false ,foreign_key: true   |


### Association

- belongs_to :user
- belongs_to :item
