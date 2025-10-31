import Config

config :nostrum,
  token: System.get_env("NOSTRUN_TOKEN"),
  gateway_intents: :all,
  ffmpeg: false
