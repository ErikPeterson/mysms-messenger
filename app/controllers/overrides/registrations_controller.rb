module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    wrap_parameters false
  end
end