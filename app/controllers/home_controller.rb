class HomeController < ApplicationController
  layout "shell"

  def index; end

  def portal
    data = { "registration_total" => 2_367_910, "registration_table" => [{ "label" => "Today", "value" => "654", "change" => "2.2%", "up" => true }, { "label" => "Yesterday", "value" => "685", "change" => "-13.8%", "down" => true }, { "label" => "7 Days", "value" => "5,683", "change" => "13.7%", "up" => true }, { "label" => "30 Days", "value" => "21,494", "change" => "4.2%", "up" => true }, { "label" => "12 Months", "value" => "251,724", "change" => "-28.4%", "down" => true }, { "label" => "Year to Date", "value" => "215,940", "change" => "-26.5%", "down" => true }],
             "enrollment_total" => 4_092_309, "enrollment_table" => [{ "label" => "Today", "value" => "1,264", "change" => "-0.2%", "down" => true }, { "label" => "Yesterday", "value" => "1,310", "change" => "-17.7%", "down" => true }, { "label" => "7 Days", "value" => "10,856", "change" => "10.4%", "up" => true }, { "label" => "30 Days", "value" => "40,444", "change" => "-0.7%", "down" => true }, { "label" => "12 Months", "value" => "534,306", "change" => "-31.0%", "down" => true }, { "label" => "Year to Date", "value" => "451,408", "change" => "-30.9%", "down" => true }],
             "grade_total" => 11_089, "grade_table" => [{ "label" => "Today", "value" => "0", "change" => "0%", "equal" => true }, { "label" => "Yesterday", "value" => "0", "change" => "0%", "equal" => true }, { "label" => "7 Days", "value" => "0", "change" => "0%", "equal" => true }, { "label" => "30 Days", "value" => "0", "change" => "0%", "equal" => true }, { "label" => "12 Months", "value" => "0", "change" => "-100.0%", "down" => true }, { "label" => "Year to Date", "value" => "0", "change" => "-100.0%", "down" => true }],
             "certificate_total" => 1_343_423, "certificate_table" => [{ "label" => "Today", "value" => "410", "change" => "-19.3%", "down" => true }, { "label" => "Yesterday", "value" => "439", "change" => "-24.7%", "down" => true }, { "label" => "7 Days", "value" => "3,808", "change" => "1.7%", "up" => true }, { "label" => "30 Days", "value" => "14,528", "change" => "-7.4%", "down" => true }, { "label" => "12 Months", "value" => "191,732", "change" => "-31.0%", "down" => true }, { "label" => "Year to Date", "value" => "160,463", "change" => "-31.5%", "down" => true }],
             "managers" => ["danielrudn@gmail.com", "daniel.rudnitski@ibm.com", "leon@ca.ibm.com", "james.reeve@ibm.com", "cangiano@ca.ibm.com", "mroudnitski@ibm.com", "graceb@ca.ibm.com", "rsahuja@ca.ibm.com", "rohit.arora1@ibm.com", "rfchong@ca.ibm.com", "leon.katsnelson@gmail.com", "bs@ibm.com", "michael.presman@ibm.com", "richard.ye@ibm.com", "wilson.la@ibm.com", "chase.mcdougall@ibm.com", "ans.naeem@ibm.com", "rizwan.shahid@ibm.com"],
             "aggregated_data" => { "name" => "Cognitive Class", "slug" => "cognitiveclass", "domain" => "https://cognitiveclass.ai", "managers" => ["danielrudn@gmail.com", "daniel.rudnitski@ibm.com", "leon@ca.ibm.com", "james.reeve@ibm.com", "cangiano@ca.ibm.com", "mroudnitski@ibm.com", "graceb@ca.ibm.com", "rsahuja@ca.ibm.com", "rohit.arora1@ibm.com", "rfchong@ca.ibm.com", "leon.katsnelson@gmail.com", "bs@ibm.com", "michael.presman@ibm.com", "richard.ye@ibm.com", "wilson.la@ibm.com", "chase.mcdougall@ibm.com", "ans.naeem@ibm.com", "rizwan.shahid@ibm.com"],
                                    "total_learners" => 2_367_910, "total_enrollments" => 4_092_309, "total_completions" => 11_089, "total_certificates" => 1_343_423, "last_login_date" => "2022-11-15T20:38:21.855+00:00", "last_join_date" => "2022-11-15T20:38:21.520+00:00" } }

    @portal_name = data["aggregated_data"]["name"]
    @managers = ["chase.mcdougall@ibm.com", "chasemcdougall@hotmail.com"]
    @slug = data["aggregated_data"]["slug"]
    @domain = data["aggregated_data"]["domain"]
    @update_time = Time.now.utc # November 20, 2022, 17:52:00

    @registration_count = data["registration_total"]
    @registration_data = data["registration_table"]

    @enrollment_count = data["enrollment_total"]
    @enrollment_data = data["enrollment_table"]

    @grade_count = data["grade_total"]
    @grade_data = data["grade_table"]

    @certificate_count = data["certificate_total"]
    @certificate_data = data["certificate_table"]

    # name:               Portal.first.name,
    # slug:               Constants::PORTAL_SLUG,
    # domain:             Constants::PORTAL_URL,
    # managers:           result.managers,
    # total_learners:     result.registration_total,
    # total_enrollments:  result.enrollment_total,
    # total_completions:  result.grade_total,
    # total_certificates: result.certificate_total,
    # last_login_date:    Time.iso8601(cubejs_client.last_user_login),
    # last_join_date:     Time.iso8601(cubejs_client.last_user_join)
  end
end
