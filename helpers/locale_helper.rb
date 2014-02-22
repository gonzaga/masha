module LocaleHelper
  def current_locale
  end

  def locale_class(locale)
    FastGettext.locale == locale ? 'active' : ''
  end
end
