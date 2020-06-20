module ConfirmExample where

import Prelude
import Enquirer (prompt, PromptOptions(..))
import Effect.Aff (Aff, launchAff_)
import Effect (Effect)
import Effect.Console (log)
import Effect.Class (liftEffect)
import ExampleCommons (parseResponse)

askConfirmation :: Aff { confirm :: Boolean }
askConfirmation =
  parseResponse
    =<< prompt
        ( Confirm
            { name: "confirm"
            , message: "Are you sure?"
            , initial: true
            }
        )

main :: Effect Unit
main =
  launchAff_ do
    confirm <- askConfirmation
    liftEffect $ log $ show confirm
