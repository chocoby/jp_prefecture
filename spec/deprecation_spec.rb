# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::Deprecation do
  describe '.warn' do
    it '接頭辞を付けて標準エラー出力に 1 行で出すこと' do
      expect { described_class.warn('something is deprecated') }
        .to output("[jp_prefecture] DEPRECATION WARNING: something is deprecated\n").to_stderr
    end

    context '$VERBOSE が nil のとき' do
      around do |example|
        original = $VERBOSE
        $VERBOSE = nil
        example.run
        $VERBOSE = original
      end

      it '警告が抑制されないこと' do
        expect { described_class.warn('something is deprecated') }
          .to output(/DEPRECATION WARNING: something is deprecated/).to_stderr
      end
    end
  end
end
