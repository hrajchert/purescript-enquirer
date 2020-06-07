module ExampleCommons (parseResponse) where

import Prelude
import Simple.JSON (read, class ReadForeign)
import Foreign (Foreign)
import Control.Monad.Error.Class (throwError)
import Effect.Aff (Aff)
import Data.Either (Either(..))
import Effect.Exception (error)

parseResponse :: forall a. ReadForeign a => Foreign -> Aff a
parseResponse f = case read f of
  Right r -> pure r
  Left e -> throwError $ error "Could not interpret value"
