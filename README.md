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
｜nickname              | string   |  null: false             |
｜email                 | string   |  null: false, unique:true|       
｜encrypted_password    | string   |  null: false             |
｜last_name             | string   |  null: false             |
｜first_name            | string   |  null: false             |
｜last_name_k           | string   |  null: false             |
｜first_name_k          | string   |  null: false             |   
｜birth_date            | date     |  null: false             | 




### Association

- has_many :items
- has_many :shippings



## items テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -----------------------------    |
｜item_name             | string        |  null: false                      |
｜item_explaining       | text          |  null: false                      |
｜category_id           | integer       |  null: false                      |
｜item_state_id         | integer       |  null: false                      |
｜pay_for_shipping_id   | integer       |  null: false                      |
｜shipping_region_id    | integer       |  null: false                      |
｜shipping_day_id       | integer       |  null: false                      |
｜price                 | integer       |  null: false                      |
｜user                  | references    |  null: false ,foreign_key: true   |

### Association

- belongs_to :user
- has_one :shipping



## shippings テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -------------------------------- |
｜item                  | references    |  null: false ,foreign_key: true   |
｜user                  | references    |  null: false ,foreign_key: true   |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

｜Column                | Type          |  Options                          |
｜----------------------| ------------  |  -------------------------------- |
｜postal_code           | string        |  null: false                      |
｜shipping_region_id    | integer       |  null: false                      |
｜city                  | string        |  null: false                      |
｜house_number          | string        |  null: false                      |
｜house_name            | string        |                                   |
｜phone_number          | string        |  null: false                      |
｜shipping              | references    |  null: false , foreign_key: true  |

## Association
- belongs_to :shipping