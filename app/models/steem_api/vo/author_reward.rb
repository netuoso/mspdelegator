class SteemApi::Vo::AuthorReward < SteemApi::SqlBase
  self.table_name = :VOAuthorRewards
end

# Structure
#
# SteemApi::Vo::AuthorReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   author: varchar,
#   permlink: varchar,
#   sdb_payout: money,
#   steem_payout: money,
#   vesting_payout: money
# )
