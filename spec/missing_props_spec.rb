require 'spec_helper'

describe 'Browserino' do
  describe 'http header fallback' do
    it 'normalizes raw header names' do
      plain_headers = Browserino.normalize_header_keys({'Accept-Language' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'})

      expect(plain_headers.key?(:accept_language)).to be_truthy
    end

    it 'normalizes Rails header names' do
      rails_headers = Browserino.normalize_header_keys({'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'})

      expect(rails_headers.key?(:accept_language)).to be_truthy
    end

    it 'sorts HTTP_ACCEPT_LANGUAGE locales by quality' do
      client = Browserino.parse(
        'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36',
        {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.6,nl;q=0.7'}
      )

      expect(client.locales).to eq %i[en_us en nl nl_nl]
    end

    it 'can detect language from Accept-Language header when headers given' do
      client = Browserino.parse(
        'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36',
        {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'}
      )

      expect(client.locale).to eq :en_us
      expect(client.locales).to eq %i[en_us en nl_nl nl]
    end

    it 'cannot detect language from Accept-Language header when no headers given' do
      client = Browserino.parse 'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36'

      expect(client.locale).to be_nil
      expect(client.locales).to eq %i[]
    end

    it 'prefers http header locale over user agent when possible' do
      client = Browserino.parse(
        'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I it-IT) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36',
        {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'}
      )

      expect(client.locale).to eq :en_us
      expect(client.locales).to include :it_it
    end

    it 'adds locale to locales when locale is found in UA but no headers are given' do
      client = Browserino.parse 'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I it-IT) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36'

      expect(client.locale).to eq :it_it
      expect(client.locales).to include :it_it
    end

    it 'sets locale to locales.first when locale is found in headers but not in UA' do
      client = Browserino.parse(
        'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36',
        {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'}
      )

      expect(client.locale).to eq :en_us
      expect(client.locales).to include :en_us
    end
  end
end
