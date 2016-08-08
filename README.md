# Importing test files and using them in popHealth

- make sure current installation is not using opml mode (use_provider_opml = false, in config)
- remove all providers, records, practices
- mongo import v3_providers, v3_practices, v3_records

## rails console

rake admin:create_admin_account RAILS_ENV=production

user = User.first

user.provider_id = Provider.where(given_name: "Primary Care Office of the Future - Admin").first.id

user.save

Provider.where(given_name: "Administrator").delete
