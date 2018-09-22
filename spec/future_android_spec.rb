require 'spec_helper'

describe 'Browserino future android versions' do
  (:p..:z).reduce 9 do |vnum, letter|
    it "defines methods for android '#{letter}'" do
      client = Browserino.parse "Mozilla/5.0 (Linux; Android #{vnum}.1.2; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36"

      expect(client.send("android_#{letter}?".to_sym)).to eq true
      expect(client.send("android_#{letter}?".to_sym, "#{vnum}.1.2")).to eq true
    end

    vnum + 1
  end
end
