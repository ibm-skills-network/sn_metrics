module CustomInputs
  class BaseInput < SimpleForm::Inputs::StringInput
    def hint(wrapper_options = nil)
      super unless has_errors?
    end
  end
end
