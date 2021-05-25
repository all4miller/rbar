require 'active_record'
require 'benchmark'
require_relative 'sample_json'
require_relative 'setup'
require_relative 'company'
require_relative 'link'
require_relative 'rbar'
require_relative 'lightning'

COMPANIES_COUNT = 1000

Setup.execute

Benchmark.bm do |benchmark|
  benchmark.report("rbar") do
    ActiveRecord::Base.transaction do
      RBAR.execute
      raise ActiveRecord::Rollback
    end
  end

  benchmark.report("lightning") do
    ActiveRecord::Base.transaction do
      Lightning.execute
      raise ActiveRecord::Rollback
    end
  end
end
