file "/tmp/buzz" do
  action :delete
end

new_content = node['flurb']['foop']['buzz']

file "/tmp/buzz again!" do
  path "/tmp/buzz"
  content "#{new_content}"
end
