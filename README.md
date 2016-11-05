== README

# ChatSpace

## Database design

### users table

| column | type | null |
|:------:|:----:|:----:|
|name    |string|false |
|email   |string|false |
|password|string|false |
|group_id|integer|     |

### groups table

| column | type | null |
|:------:|:----:|:----:|
|name    |string|false |

### messages table

| column | type | null |
|:------:|:----:|:----:|
|body    |text  |false |
|image   |string|      |
|created_at|datetime|  |
|user_id |integer|false|
|group_id|integer|false|

## groups_users table

| column | type | null |
|:------:|:----:|:----:|
|user_id |references|false|
|group_id |references|false|



## association

# user

 - has_many :groups, through: :groups_users
 - has_many :messages

# group

- has_many :users, through: :groups_users
- has_many :messages

# message

- belongs_to :user
- belongs_to :group



