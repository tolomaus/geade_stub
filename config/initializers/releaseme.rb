RELEASEME_CONFIG = YAML::load(File.read(Rails.root.join('config/releaseme.yml')))[Rails.env]

RELEASEME_CONFIG['host'] = ENV['RELEASEME_HOST'] || RELEASEME_CONFIG['host']
RELEASEME_CONFIG['port'] = ENV['RELEASEME_PORT'] || RELEASEME_CONFIG['port']
RELEASEME_CONFIG['use_ssl'] = ENV['RELEASEME_USE_SSL'] || RELEASEME_CONFIG['use_ssl']