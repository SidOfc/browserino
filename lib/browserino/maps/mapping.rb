module Browserino
  module Mapping
    module_function

    def const?(const)
      constants(true).include?(const)
    end
  end
end
