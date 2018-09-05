# frozen_string_literal: true
require 'rotp'
require 'erb'

class RotpService
  APP_NAME = "Avegen"
  def initialize()
    @google_url = { url: %{https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=%s}.strip }
  end

  def get_qr_code_details(email)
  	secret = ROTP::Base32.random_base32
  	uri = ROTP::TOTP.new(secret, issuer: APP_NAME).provisioning_uri(email)
  	url = @google_url[:url] % ERB::Util.url_encode(uri)
  	{ secret: secret, qr: uri, google_url: url }
  end
end
