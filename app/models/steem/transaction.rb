class Steem::Transaction < Steem::SqlBase
  self.table_name = 'Transactions'
  self.primary_key = :tx_id
  self.inheritance_column = nil
end