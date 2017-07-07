class SteemApi::Tx::Comment < SteemApi::SqlBase
	self.table_name = :TxComments
end

# Structure
#
# SteemApi::Tx::Comment(
#   ID: integer,
#   tx_id: integer,
#   author: varchar,
#   permlink: varchar,
#   parent_author: varchar,
#   parent_permlink: varchar,
#   title: text,
#   body: text,
#   json_metadata: varchar_max,
#   timestamp: datetime
# )
