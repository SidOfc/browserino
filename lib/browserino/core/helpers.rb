module Browserino
  module Core
    module Helpers
      def browser_name
        name_strict(:browsers)
      end

      def bot_name
        name_strict(:bots)
      end

      def search_engine_name
        name_strict(:search_engines)
      end

      def social_media_name
        name_strict(:social_media)
      end

      private

      def post_process(h)
        case h[:name]
        when 'edge'
          h[:engine_name] = 'edgehtml'
          h[:engine_version] = h[:browser_version].to_s.split('.').shift.to_s
        when 'ie'
          h[:engine_name] = 'trident'
        end
        h
      end

      def name_strict(cat)
        name if category? cat
      end

      def hash_for_to_s
        out = to_h.each_with_object({}) do |a, h|
          h[a[0]] = a[1].to_s.gsub(/[\s_]/, '-')
        end
        [:locale, :system_version].each { |k| out.delete(k) }
        out
      end

      def invertable(res)
        if @not
          @not = false
          !res
        else
          res
        end
      end

      def compare_versions(a, b)
        b = b.to_s.split('.')
        !a.to_s.split('.').map { |v| v == b.shift }.include?(false)
      end

      def compare_sys_name_variations_with(name, version = nil)
        v = version.to_s.tr(' ', '_').downcase
        n = system_name(full: true).join.downcase.tr(' ', '_')
        [n, n.gsub(/[\d\.\s_]+$/, '')].include?((name + v))
      end

      def correct_system?(name, version = nil)
        sys_name = name.to_s.tr(' ', '_').downcase
        if compare_sys_name_variations_with(sys_name, version) ||
           (sys_name == system_name.tr(' ', '_') &&
           compare_versions(version, system_version)) ||
           (!version && sys_name == system_name.tr(' ', '_'))
          true
        else
          false
        end
      end

      def correct_agent?(name, version = nil)
        name = name.tr('_', ' ')
        browser_equal = (name == browser_name || name == bot_name)
        if version
          browser_equal && compare_versions(version, browser_version)
        else
          browser_equal
        end
      end

      def correct_console?(name)
        name == console_name
      end

      def category?(cat)
        n = name.to_s.gsub(/[\s-]/, '_').to_sym
        SUPPORTED.each { |t, s| return true if s.include?(n) && t == cat }
        nil
      end

      def type_id(method_sym)
        name = method_sym.to_s.downcase.tr('?', '').to_sym
        return :console if SUPPORTED[:consoles].include?(name)
        return :system if SUPPORTED[:operating_systems].include?(name)
        return :agent if SUPPORTED[:browsers].concat(SUPPORTED[:bots]).include?(name)
        nil
      end

      def fetch_system_version_name(name)
        const = name.to_s.tr(' ', '_').upcase.to_sym
        version = internal_sys_version(const)
        if version && Mapping.const?(const)
          res = Mapping.const_get(const)
                       .select { |_, v| true if v.include?(version) }.keys.first
          res || system_version.split('.').first(2).join('.').downcase
        end
      end

      def internal_sys_version(name)
        if system_version
          if name =~ /mac|blackberry/i
            system_version.split('.').first(2).join.to_i
          elsif name =~ /win|android/i
            system_version.tr('.', '').to_i
          else
            system_version.to_i
          end
        end
      end
    end
  end
end
