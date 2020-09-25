module Enquirer
  ( module Enquirer.Internal
  , confirm
  , confirm'
  , select
  , singlePrompt
  ) where

import Prelude
import Effect.Aff (Aff)
import Enquirer.Internal (PromptOptions(..), prompt, promptMultiple)
import Foreign (unsafeFromForeign)

confirm' :: Boolean -> String -> Aff Boolean
confirm' initial message = do
  response <-
    prompt
      ( Confirm
          { name: "answer"
          , message
          , initial
          }
      )
  pure $ (_.answer <<< unsafeFromForeign) response

confirm :: String -> Aff Boolean
confirm = confirm' true

select :: String -> Array String -> Aff String
select message choices = do
  response <-
    prompt
      ( Select
          { name: "answer"
          , message
          , choices
          }
      )
  pure $ (_.answer <<< unsafeFromForeign) response

singlePrompt :: String -> Aff String
singlePrompt message = do
  response <-
    prompt
      ( SinglePrompt
          { name: "answer"
          , message
          }
      )
  pure $ (_.answer <<< unsafeFromForeign) response
