class SteemApi::SqlBase < ApplicationRecord
  establish_connection({
    adapter: "sqlserver",
    host: "sql.steemsql.com",
    username: "steemit",
    password: "steemit",
    timeout: 60
  })

  self.table_name = nil
  self.inheritance_column = nil

  def tx
    SteemApi::Transaction.find_by(tx_id: self.tx_id)
  end
end