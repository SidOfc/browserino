module Browserino
  module Core
    module Questions
      def compat?
        invertable ie? && browser_version != browser_version(compat: true)
      end

      def known?
        invertable !browser_name.nil? || !bot_name.nil?
      end

      def mobile?
        invertable !ua.match(Core::PATTERNS[:operating_system][:mobile]).nil?
      end

      def x64?
        invertable system_architecture == 'x64'
      end

      def x32?
        invertable system_architecture == 'x32'
      end

      def osx?(*arg)
        macintosh?(*arg)
      end

      def win?(*arg)
        windows?(*arg)
      end

      def bb?(*arg)
        blackberry?(*arg)
      end

      def fb?(*arg)
        facebook?(*arg)
      end

      def ff?(*arg)
        firefox?(*arg)
      end

      def ddg?(*arg)
        duckduckgo?(*arg)
      end

      def bot?(name = nil)
        is_bot = ua.strip.empty? || !bot_name.nil?
        is_name = name.nil? || name.to_s.downcase.tr('_', ' ') == bot_name
        invertable is_bot && is_name
      end

      def console?(name = nil)
        arg = (name.nil? ? console_name : name).to_s.to_sym
        invertable Core::SUPPORTED[:consoles].include? arg
      end

      def search_engine?(name = nil)
        arg = (name.nil? ? search_engine_name : name).to_s.to_sym
        invertable Core::SUPPORTED[:search_engines].include? arg
      end

      def social_media?(name = nil)
        arg = (name.nil? ? bot_name : name).to_s.to_sym
        invertable Core::SUPPORTED[:social_media].include? arg
      end

      def platform?(name = nil, opts = {})
        arg = (name.nil? ? system_name : name).to_s.to_sym
        invertable Core::SUPPORTED[:operating_systems].include?(arg) &&
                   (opts[:version].nil? ? true : send("#{arg}?", opts[:version]))
      end

      def library?(name = nil, opts = {})
        arg = (name.nil? ? library_name : name).to_s.to_sym
        invertable Core::SUPPORTED[:libraries].include?(arg) &&
                   (opts[:version].nil? ? true : send("#{arg}?", opts[:version]))
      end

      def browser?(name = nil, opts = {})
        arg = (name.nil? ? browser_name.tr(' ', '_') : name).to_s.to_sym
        invertable Core::SUPPORTED[:browsers].include?(arg) &&
                   (opts[:version].nil? ? true : send("#{arg}?", opts[:version]))
      end
    end
  end
end
