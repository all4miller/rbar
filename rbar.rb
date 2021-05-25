class RBAR
  attr_reader :company

  def initialize(company)
    @company = company
  end

  def link_count
    @company.links.where(created_at: Time.now.getutc.beginning_of_month - 1.month..Time.now.getutc.end_of_month - 1.month).count
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
