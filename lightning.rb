class Lightning
  def self.execute
    Company.connection.execute("
          with link_counts as (
        select company_id,
               count(id) link_count
          from links
         where created_at between '#{Time.now.getutc.beginning_of_month - 1.month}' and '#{Time.now.getutc.end_of_month - 1.month}'
      group by company_id)
      update companies set
        link_count = link_counts.link_count
      from link_counts
      where companies.id = link_counts.company_id")
  end
end
