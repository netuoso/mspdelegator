class Steem < ActiveRecord::Base
  establish_connection({
    :adapter  => "sqlserver",
    :host     => "sql.steemsql.com",
    :username => "steemit",
    :password => "steemit",
  })

  def self.delegators(steem_per_vest=Settings.steem_per_mvests.to_f/1000000)
    self.connection.exec_query(self.canned_query(steem_per_vest))
  end

  def self.canned_query(steem_per_vest)
    "SELECT delegatee AS Recipient, delegator AS Delegator, CONVERT(DECIMAL(15,2),vesting_shares / 1000000) AS MVests, CONVERT(DECIMAL(15,0),ROUND(vesting_shares * #{steem_per_vest}, 0)) AS SP, timestamp as 'Latest Time Stamp' FROM
    (SELECT delegator,
            delegatee,
            vesting_shares,
            timestamp,
            row_number() over (partition by delegator, delegatee ORDER BY timestamp DESC ) as rn
        FROM TxDelegateVestingShares
        WHERE delegatee IN ('minnowsupport','msp-lovebot','msp-creativebot','centerlink')
        AND timestamp IS Not Null
    ) tt
    WHERE tt.rn = 1 AND vesting_shares <> 0
    ORDER BY delegatee, SP DESC"
  end
end