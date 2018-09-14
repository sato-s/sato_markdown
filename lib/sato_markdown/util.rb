module SatoMarkdown
  module Util
    BASE_DIR = File.join(__dir__, '../../')

    module_function
    def to_loadpath(path)
      File.join(BASE_DIR, path)
    end
  end
end
