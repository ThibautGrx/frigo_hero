Geocoder.configure(
  # Geocoding options
  timeout: 15, # geocoding service timeout (secs)
  lookup: :google, # name of geocoding service (symbol)
  ip_lookup: :ipinfo_io,
  use_https: true, # name of IP address geocoding service (symbol)
  # google: {
  #   api_key: Rails.application.credentials.geoloc[:GEO_KEY]
  # },
  # ipinfo_io: {
  #   api_key: Rails.application.credentials.geoloc[:GEO_KEY_IP]
  # }
  # language: :en,              # ISO-639 language code
  # use HTTPS for lookup requests? (if supported)
  # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  # api_key:  Rails.application.credentials.geoloc[:GEO_KEY], # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  # units: :mi,                 # :km for kilometers or :mi for miles
  # distances: :linear          # :spherical or :linear
)

if Rails.env.test?
  Geocoder.configure(lookup: :test)

  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        'latitude'     =>  48.866667,
        'longitude'    =>  2.333333,
      }
    ]
  )
end
