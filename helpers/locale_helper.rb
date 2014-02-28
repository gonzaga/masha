module LocaleHelper
  def current_locale
    FastGettext.locale
  end

  def locale_class(locale)
    FastGettext.locale == locale ? 'active' : ''
  end
end
