FactoryBot.define do
  factory :portal do
    name { Faker::App.name }
    slug { Faker::Internet.unique.slug }
    domain { Faker::Internet.url }
    managers { [Faker::Internet.email, Faker::Internet.email] }
    total_learners { Faker::Number.within(range: 1..10_000) }
    learners_data do
      [{ "label" => "Today", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "Yesterday", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "7 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "30 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "12 Months", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "Year to Date", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true }]
    end
    total_enrollments { Faker::Number.within(range: 1..10_000) }
    enrollments_data do
      [{ "label" => "Today", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "Yesterday", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "7 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "30 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "12 Months", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "Year to Date", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true }]
    end
    total_completions { Faker::Number.within(range: 1..10_000) }
    completions_data do
      [{ "label" => "Today", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "Yesterday", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "7 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "30 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "12 Months", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "Year to Date", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true }]
    end
    total_certificates { Faker::Number.within(range: 1..10_000) }
    certificates_data do
      [{ "label" => "Today", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "Yesterday", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "7 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "30 Days", "value" => Faker::Number.within(range: 1..10_000), "change" => "#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "up" => true },
       { "label" => "12 Months", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true },
       { "label" => "Year to Date", "value" => Faker::Number.within(range: 1..10_000), "change" => "-#{Faker::Number.decimal(l_digits: 2, r_digits: 1)}%", "down" => true }]
    end
    last_login { Faker::Time.between(from: DateTime.now - 5.years, to: DateTime.now, format: :default) }
    last_join { Faker::Time.between(from: DateTime.now - 5.years, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 5.years, to: DateTime.now, format: :default) }
    installed_catalog_items { Faker::Number.within(range: 1..10_000) }
    installed_non_catalog_items { Faker::Number.within(range: 1..10_000) }
    outdated_catalog_items { Faker::Number.within(range: 1..10_000) }
  end
end
