# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

### モデル構成

__Userテーブル__

| カラム名    | データ型     | 制約 |
|:-----------|:------------|:-------------|
| nickname   | string      | presence:true|
| email      | string      | uniquences:true|
| passward   | string      |  length: { minimum: 8, maximum: 20 }  |

- has_many: groups, through: :group_user
- has_many: messages
- add_index :user, :nickname


__Groupテーブル__

|  カラム名  |  データ型  |  制約  |
|:-----------|:----------|:-------|
| name | strings   | presence: true |

has_mnany: group_users
has_many: users, through: :group_user
has_many: messages

__GroupUserテーブル__

|  カラム名  |  データ型  |  制約  |
|:-----------|:----------|:-------|
| group_id   | references | foreign_key: true |
| member_id  | references | foreign_key: true |

- belongs_to: user
- belongs_to: group

__Messageテーブル__

|  カラム名   |  データ型  |  制約  |
|:-----------|:-----------|:-------|
| group_id    | references | foreign_key: true |
| user_id　　　| references | foreign_key: true |
| body| strings    | presence: true    |

- belongs_to: user
- belongs_to: group

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
