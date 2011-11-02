Factory.define :app do |a|
  a.sequence (:code){|n| "APP#{n}" }
  a.sequence (:name){|n| "Application #{n}" }
end

Factory.define :release do |r|
  r.sequence (:code){|n| "REL#{n}" }
  r.sequence (:name){|n| "Release #{n}" }
end

Factory.define :pcr do |p|
  p.sequence (:code){|n| "PCR#{n}" }
  p.summary {|x| "This is the summary of #{x.code}"}
  p.description {|x| "This is the description of #{x.code}"}
  p.association :app
  p.association :release
  p.status_id 1
  p.severity_id 1
end

#Factory.define :pcr_flat, :class => Pcr do |p|
#  p.sequence (:code){|n| "PCR#{n}" }
#  p.summary {|x| "This is the summary of #{x.code}"}
#  p.description {|x| "This is the description of #{x.code}"}
#  p.app_id 1
#  p.release_id 1
#  p.status_id 1
#  p.severity_id 1
#end

