module Browserino
  module Core
    module Questions
      SOCIAL_MEDIA = [:facebook, :fb, :twitter, :linkedin,
                      :instagram, :pinterest, :tumblr].freeze

      SEARCH_ENGINES = [:google, :bing, :yahoo_slurp,
                        :baiduspider, :duckduckgo, :ddg].freeze

      BROWSERS = (Core::PATTERNS[:browser].keys + [:ff]).freeze

      OPERATING_SYSTEMS = (Browserino::Mapping
                            .constants(:true)
                            .map(&:downcase) + [:osx, :bb, :win]).freeze

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

      def search_engine?(name = nil)
        arg = (name.nil? ? search_engine_name : name).to_s.to_sym
        invertable SEARCH_ENGINES.include?(arg)
      end

      def social_media?(name = nil)
        arg = (name.nil? ? bot_name : name).to_s.to_sym
        invertable SOCIAL_MEDIA.include?(arg.to_s.to_sym)
      end

      def platform?(name = nil, opts = {})
        arg = (name.nil? ? system_name : name).to_s.to_sym
        invertable OPERATING_SYSTEMS.include?(arg) &&
                   (opts[:version].nil? ? true : send("#{name}?", opts[:version]))
      end

      def browser?(name = nil, opts = {})
        arg = (name.nil? ? browser_name.tr(' ', '_') : name).to_s.to_sym
        invertable BROWSERS.include?(arg) &&
                   (opts[:version].nil? ? true : send("#{name}?", opts[:version]))
      end
    end
  end
end
