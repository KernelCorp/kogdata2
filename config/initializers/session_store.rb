# Be sure to restart your server when you modify this file.

Kogdata2::Application.config.session_store :active_record_store
ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
