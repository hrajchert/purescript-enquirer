module SelectExample where

import Prelude
import Enquirer (prompt, PromptOptions(..))
import Effect.Aff (launchAff_)
import Effect (Effect)

-- import Effect.Console (log)
-- import Effect.Class (liftEffect)
main :: Effect Unit
main =
  launchAff_ do
    prompt
      $ Select
          { name: "fruit", message: "What is your favourite fruit?", choices: [ "Banana", "Apple", "Oranges" ] }
