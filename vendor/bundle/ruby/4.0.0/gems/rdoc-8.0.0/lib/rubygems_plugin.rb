# frozen_string_literal: true

# If this file is exist, RDoc generates and removes documents by rubygems plugins.
#
# In follwing cases,
# RubyGems directly exectute RDoc::RubygemsHook.generation_hook and RDoc::RubygemsHook#remove to generate and remove documents.
#
# - RDoc is used as a default gem.
# - RDoc is a old version that doesn't have rubygems_plugin.rb.

require_relative 'rdoc/rubygems_hook'

Gem.done_installing(&RDoc::RubyGemsHook.method(:generate))
Gem.pre_uninstall(&RDoc::RubyGemsHook.method(:remove))
