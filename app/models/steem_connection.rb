class SteemConnection < SteemApi::SqlBase

  def self.msp_delegators(steem_per_vest=Settings.steem_per_mvests.to_f/1000000)
    self.connection.exec_query(self.canned_query(steem_per_vest))
  end

  def self.steem_per_mvests
    begin
      # SteemDollar.com (fastest)
      steemdollar_response = RestClient::Request.execute(method: :get, url: "https://www.steemdollar.com/vests.php", timeout: 3, open_timeout: 3).body
      Nokogiri::XML.parse(steemdollar_response).css('.text-intro')[2].text.match(/1\s*VESTS\s*=\s*(\d*\.\d*)/)[1]

      # Steemd.com
      # steemd_response = RestClient::Request.execute(method: :get, url: "https://steemd.com", timeout: 3, open_timeout: 3).body
      # Nokogiri::XML.parse(steemd_response).css('.hash3').first.text.match(/^steem_per_mvests(\d*.\d*)/)[1]
    rescue => e
      Rails.logger.error("Error: #{e}")
      Settings.steem_per_mvests
    end
  end

  private

  def self.canned_query(steem_per_vest)
    "SELECT delegatee AS Recipient, delegator AS Delegator, CONVERT(DECIMAL(15,2),vesting_shares / 1000000) AS MVests, CONVERT(DECIMAL(15,0),ROUND(vesting_shares * #{SteemConnection.steem_per_mvests}, 0)) AS SP, timestamp as 'Latest Time Stamp' FROM
    (SELECT delegator,
            delegatee,
            vesting_shares,
            timestamp,
            row_number() over (partition by delegator, delegatee ORDER BY timestamp DESC ) as rn
        FROM TxDelegateVestingShares
        WHERE delegatee IN ('minnowsupport','msp-lovebot','msp-creativebot','centerlink','msp-africa')
        AND timestamp IS Not Null
    ) tt
    WHERE tt.rn = 1 AND vesting_shares <> 0
    ORDER BY delegatee, SP DESC"
  end

end
