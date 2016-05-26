module Browserino
  module Core
    module Questions
      SOCIAL_MEDIA = [:facebook, :twitter, :linkedin,
                      :instagram, :pinterest, :tumblr].freeze

      SEARCH_ENGINES = [:google, :bing, :yahoo_slurp,
                        :baiduspider, :duckduckgo].freeze

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
        if name
          invertable send("#{name}?")
        else
          invertable SEARCH_ENGINES.include?(search_engine_name.to_s.to_sym)
        end
      end

      def social_media?(name = nil)
        if name
          invertable send("#{name}?")
        else
          invertable SOCIAL_MEDIA.include?(bot_name.to_s.to_sym)
        end
      end

      def platform?(name = nil, opts = {})
        invertable name ? send("#{name}?", opts[:version]) : !system_name.nil?
      end

      def browser?(name = nil, opts = {})
        invertable name ? send("#{name}?", opts[:version]) : !browser_name.nil?
      end
    end
  end
end
