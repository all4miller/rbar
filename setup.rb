class Setup
  def self.execute
    db_name = YAML.load_file('database.yml')['default']['database']

    ActiveRecord::Base.establish_connection(
      YAML.load_file('database.yml')['default'].slice!('database')
    )

    ActiveRecord::Base.connection.drop_database(db_name)
    ActiveRecord::Base.connection.create_database(db_name)

    ActiveRecord::Base.establish_connection(
      YAML.load_file('database.yml')['default']
    )

    ActiveRecord::Schema.define do
      create_table(:companies) do |t|
        t.string :value_field_1
        t.string :value_field_2
        t.string :value_field_3
        t.string :value_field_4
        t.string :value_field_5
        t.string :value_field_6
        t.string :value_field_7
        t.string :value_field_8
        t.string :value_field_9
        t.string :value_field_10
        t.string :value_field_11
        t.string :value_field_12
        t.string :value_field_13
        t.string :value_field_14
        t.string :value_field_15
        t.numeric :link_count
        t.jsonb :jsonb_field_1
        t.jsonb :jsonb_field_2
      end
    end

    ActiveRecord::Schema.define do
      create_table(:links) do |t|
        t.integer :company_id, index: true
        t.string :url
        t.timestamp :created_at, index: true
      end
    end

    ActiveRecord::Base.connection.execute(
      "with vals as (
        select md5(random()::text) str_val
      )
      insert into companies (
          value_field_1,  value_field_2,  value_field_3,
          value_field_4,  value_field_5,  value_field_6,
          value_field_7,  value_field_8,  value_field_9,
          value_field_10, value_field_11, value_field_12,
          value_field_13, value_field_14, value_field_15,
          jsonb_field_1,  jsonb_field_2)
      select
          vals.str_val, vals.str_val, vals.str_val,
          vals.str_val, vals.str_val, vals.str_val,
          vals.str_val, vals.str_val, vals.str_val,
          vals.str_val, vals.str_val, vals.str_val,
          vals.str_val, vals.str_val, vals.str_val,
          '#{JSON_STR}', '#{JSON_STR}'
      from generate_series(1, #{COMPANIES_COUNT}), vals")

    ActiveRecord::Base.connection.execute(
      "with vals as (
        select 'https://' || md5(random()::text) str_val
        from generate_series(1, 500)
      )
      insert into links (
          company_id,
          url,
          created_at)
      select
          companies.id,
          vals.str_val,
          timestamp '2021-01-01 00:00:00' +
            random() * (timestamp '2021-04-30 23:59:59' -
                        timestamp '2021-01-01 00:00:00')
      from companies, vals
     where companies.id < #{COMPANIES_COUNT * 0.80}")
  end
end
