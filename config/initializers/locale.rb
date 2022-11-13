# custom locales load path
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]