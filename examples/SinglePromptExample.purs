module SinglePromptExample where

import Prelude
import Enquirer (singlePrompt)
import Effect.Aff (launchAff_)
import Effect (Effect)
import Effect.Console (log)
import Effect.Class (liftEffect)

main :: Effect Unit
main =
  launchAff_ do
    msg <- singlePrompt "What is your favourite color"
    liftEffect $ log $ show msg
