require "gettext/tools/task"
require 'gettext/tools/xgettext'
require './lib/haml_parser'

namespace :gettext do
  def locale_path
    path = FastGettext.translation_repositories[text_domain].instance_variable_get(:@options)[:path] rescue nil
    path || File.join("locales")
  end

  def text_domain
    # if your textdomain is not 'app': require the environment before calling e.g. gettext:find OR add TEXTDOMAIN=my_domain
    ENV['TEXTDOMAIN'] || (FastGettext.text_domain rescue nil) || "app"
  end

  def files_to_translate
    Dir.glob("views/*.{rb,erb,haml,slim}")
  end

  def gettext_default_options
    %w[--sort-by-msgid --no-location --no-wrap]
  end

  def gettext_msgmerge_options
    gettext_default_options
  end

  def gettext_xgettext_options
    gettext_default_options
  end

  $LOAD_PATH << File.join(File.dirname(__FILE__),'..','..','lib') # needed when installed as plugin

  task :setup do
    GetText::Tools::XGetText.add_parser(HamlParser)
    GetText::Tools::Task.define do |task|
      task.package_name = text_domain
      task.package_version = "1.0.0"
      task.domain = text_domain
      task.po_base_directory = locale_path
      task.mo_base_directory = locale_path
      task.files = files_to_translate
      task.enable_description = false
      task.msgmerge_options = gettext_msgmerge_options
      task.xgettext_options = gettext_xgettext_options
    end
  end

  desc "Create mo-files"
  task :pack => [:setup] do
    Rake::Task["gettext:mo:update"].invoke
  end

  desc "Update pot/po files"
  task :find => [:setup] do
    Rake::Task["gettext:po:update"].invoke
  end

  desc "add a new language"
  task :add_language, [:language] do |_, args|
    language = args.language || ENV["LANGUAGE"]

    language_path = File.join(locale_path, language)
    mkdir_p(language_path)
    ruby($0, "gettext:find")
  end
end
