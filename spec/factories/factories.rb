Factory.define :pcr do |p|
  p.sequence (:code){|n| "PCR#{n}" }
  p.summary {|a| "This is the summary of #{a.code}"}
  p.description {|a| "This is the description of #{a.code}"}
  p.app_id 1
  p.release_id 1
end

