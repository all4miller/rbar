class Lightning
  def self.execute
    Company.connection.execute("
          with link_counts as (
        select company_id,
               count(id) link_count
          from links
         where created_at between '2021-04-01 00:00:00' and '2021-04-30 23:59:59'
      group by company_id)
      update companies set
        link_count = link_counts.link_count
      from link_counts
      where companies.id = link_counts.company_id")
  end
end
