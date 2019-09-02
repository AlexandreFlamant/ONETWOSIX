# encoding : utf-8

Money.locale_backend = :currency

MoneyRails.configure do |config|
  config.default_currency = :gbp  # or :gbp, :usd, etc.
  # [...]
end
