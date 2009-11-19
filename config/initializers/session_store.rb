# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_churro_tiendas_session',
  :secret      => '153be6fc5a59a011a8bd506497890c0d631ad02069cba9776d320d173ef3e835a0c23e33802a2ac53028b099bda13d599255dd961ee4e68246da79f0f1f528b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
