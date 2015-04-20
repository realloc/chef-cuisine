# Just testing if chef-vault works

vault = ChefVault::Item.load("ssl", "ryoko")

file "/tmp/teh_secret.pem" do
  content vault['file-content']
end
