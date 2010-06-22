# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lab9_session',
  :secret      => '07275656366db1b50cb7da3b194da04e87238d5a440fbd04529e4d26729980a2b2ca3b3ce4243247421d974fd6a76bed96a8b062fe340f8515314f7cb43f42dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
