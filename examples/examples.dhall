let conf = ../spago.dhall
in conf //
  { dependencies =
      conf.dependencies #
        [ "console"
        , "psci-support"
        , "simple-json"
        ]
  , sources =
      conf.sources #
        [ "examples/**/*.purs"
        ]
  }