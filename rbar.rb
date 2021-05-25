class RBAR
  attr_reader :company

  def initialize(company)
    @company = company
  end

  def link_count
    @company.links.where("created_at between '2021-04-01 00:00:00' and '2021-04-30 23:59:59'").count
  end

  def update_counts
    @company.link_count = link_count
    return if @company.link_count.zero?
    @company.save
  end

  def self.execute
    Company.all.each do |company|
      RBAR.new(company).update_counts
    end
  end
end
