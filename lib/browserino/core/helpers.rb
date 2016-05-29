module Browserino
  module Core
    module Helpers
      private

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
        Core::Questions::CONSOLES.include?(name.to_sym)
      end

      def type_id(method_sym)
        name = method_sym.to_s.tr('?', '')
        supported = Core::PATTERNS[:browser].merge(Core::PATTERNS[:bot]).keys
        if supported.include?(name.to_sym)
          :agent
        elsif Mapping.const?(name.upcase.to_sym)
          :system
        elsif name == 'console'
          :console
        end
      end

      def fetch_system_version_name(name)
        const = to_const_sym(name)
        version = parse_system_version(const)
        if version && Mapping.const?(const)
          res = Mapping.const_get(const)
                       .select { |_, v| true if v.include?(version) }.keys.first
          res || system_version.split('.').first(2).join('.').downcase
        end
      end

      def parse_system_version(name)
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

      def to_const_sym(s)
        s.to_s.tr(' ', '_').upcase.to_sym
      end
    end
  end
end
