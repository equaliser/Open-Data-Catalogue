# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_opendata_session',
  :secret      => '45a44469e769d0a91621ed9c5c0c70d867fd7d536f1945bd6512c807f51c3bc5e95b1e8c9c1dd57caa103c451aa80626da80fea0c3dd91b11db1916efdb10f17'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
