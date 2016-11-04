== README

# ChatSpace

## Database design

### users table

| column | type | null |
|:------:|:----:|:----:|
|id      |integer|     |
|name    |string|false |
|email   |string|false |
|password|string|false |
|group_id|integer|     |

### groups table

| column | type | null |
|:------:|:----:|:----:|
|id      |integer|     |
|name    |string|false |

### messages table

| column | type | null |
|:------:|:----:|:----:|
|body    |text  |false |
|image   |string|      |
|created_at|datetime|  |
|user_id |integer|false|
|group_id|integer|false|


## association

# user

 - belongs_to :group
 - has_many :messages

# group

- has_many :users
- has_many :messages

# message

- belongs_to :user
- belongs_to :group



