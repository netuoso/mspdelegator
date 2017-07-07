class Steem::SqlBase < ApplicationRecord
  establish_connection({
    adapter: "sqlserver",
    host: "sql.steemsql.com",
    username: "steemit",
    password: "steemit",
    timeout: 60
  })
end