# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.update_dependency([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.update_dependency(name: 'Emanuel', city: cities.first)
status = Status.find_or_create_by_code(:code => "CRE", :description => "Created")
status = Status.find_or_create_by_code(:code => "VRM", :description => "Validated by Release Management")
status = Status.find_or_create_by_code(:code => "DTI", :description => "Deployed to INTEGRATION")
status = Status.find_or_create_by_code(:code => "SON", :description => "Signed-off in INTEGRATION")
status = Status.find_or_create_by_code(:code => "DTU", :description => "Deployed to UAT")
status = Status.find_or_create_by_code(:code => "SOU", :description => "Signed-off in UAT")
status = Status.find_or_create_by_code(:code => "DTP", :description => "Deployed to PRODUCTION")

severity = Severity.find_or_create_by_code(:code => "NOR", :description => "Normal")
severity = Severity.find_or_create_by_code(:code => "EXC", :description => "Exception")
severity = Severity.find_or_create_by_code(:code => "EME", :description => "Emergency")

app = App.find_or_create_by_code(:code => "ISSR", :name => "Security Review")

release = Release.find_or_create_by_code(:code => "Q4.3-2011", :name => "Q4.3 December 2011")
release = Release.find_or_create_by_code(:code => "Q1.1-2012", :name => "Q1.1 January 2012")
release = Release.find_or_create_by_code(:code => "Q1.2-2012", :name => "Q1.2 February 2012")
release = Release.find_or_create_by_code(:code => "Q1.3-2012", :name => "Q1.3 March 2012")
release = Release.find_or_create_by_code(:code => "Q2.1-2012", :name => "Q2.1 April 2012")
release = Release.find_or_create_by_code(:code => "Q2.2-2012", :name => "Q2.1 May 2012")



