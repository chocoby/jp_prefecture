# frozen_string_literal: true

require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.find' do
    context '対応していない項目を指定' do
      it '未知の項目で、項目名・対応している項目の一覧・2.0.0 での ArgumentError 化を含む警告が出ること' do
        message = '[jp_prefecture] DEPRECATION WARNING: unsupported field: :foo ' \
                  '(supported: name, name_e, name_r, name_h, name_k, code, zip, all_fields). ' \
                  "This will raise ArgumentError in jp_prefecture 2.0.0.\n"

        expect { JpPrefecture::Prefecture.find(foo: 'x') }.to output(message).to_stderr
      end

      it 'タイポした項目で警告が出ること' do
        expect { JpPrefecture::Prefecture.find(name_j: '山') }
          .to output(/DEPRECATION WARNING: unsupported field: :name_j/).to_stderr
      end

      it '戻り値は nil のままであること' do
        allow(JpPrefecture::Deprecation).to receive(:warn)
        expect(JpPrefecture::Prefecture.find(foo: 'x')).to be_nil
      end
    end

    context 'nil の項目を指定' do
      it '移行先を示す警告が出ること' do
        message = '[jp_prefecture] DEPRECATION WARNING: the nil key is deprecated; ' \
                  'use find(code) or find(code: code) instead. ' \
                  "This will raise ArgumentError in jp_prefecture 2.0.0.\n"

        expect { JpPrefecture::Prefecture.find(nil => 1) }.to output(message).to_stderr
      end

      it '戻り値は従来どおり都道府県を返すこと' do
        allow(JpPrefecture::Deprecation).to receive(:warn)
        expect(JpPrefecture::Prefecture.find(nil => 1).name).to eq('北海道')
      end
    end

    context '項目を複数指定' do
      it '警告が出ること' do
        expect { JpPrefecture::Prefecture.find(name: '山', code: 1) }
          .to output(/DEPRECATION WARNING: expected a Hash with exactly one key/).to_stderr
      end

      it '戻り値は従来どおり最初の項目の検索結果であること' do
        allow(JpPrefecture::Deprecation).to receive(:warn)
        expect(JpPrefecture::Prefecture.find(name: '山', code: 1).name).to eq('山形県')
      end

      it '警告に値が含まれず、キーだけが含まれること' do
        expect { JpPrefecture::Prefecture.find(name: '山', code: 1) }
          .to output(/got: \[:name, :code\]\./).to_stderr
      end

      it '警告に値が含まれないこと' do
        expect { JpPrefecture::Prefecture.find(name: '山', code: 1) }
          .not_to output(/山/).to_stderr
      end
    end

    context '空の Hash を指定' do
      it '警告が出ること' do
        expect { JpPrefecture::Prefecture.find({}) }
          .to output(/DEPRECATION WARNING: expected a Hash with exactly one key/).to_stderr
      end

      it '警告が 1 行だけであること' do
        expect { JpPrefecture::Prefecture.find({}) }
          .to output(/\A\[jp_prefecture\] DEPRECATION WARNING: [^\n]+\n\z/).to_stderr
      end

      it '戻り値は nil のままであること' do
        allow(JpPrefecture::Deprecation).to receive(:warn)
        expect(JpPrefecture::Prefecture.find({})).to be_nil
      end
    end

    context '対応している項目を指定' do
      it { expect { JpPrefecture::Prefecture.find(code: 1) }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(zip: 10_000) }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(name: '東京都') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(name_e: 'tokyo') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(name_r: 'tōkyō') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(name_h: 'とうきょうと') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(name_k: 'トウキョウト') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(all_fields: '東京') }.not_to output.to_stderr }
    end

    context '警告の対象外' do
      it { expect { JpPrefecture::Prefecture.find(1) }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find('01') }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(nil) }.not_to output.to_stderr }
      it { expect { JpPrefecture::Prefecture.find(['山']) }.not_to output.to_stderr }

      it '値が見つからないだけの場合は警告を出さないこと' do
        expect { JpPrefecture::Prefecture.find(name: '饂飩') }.not_to output.to_stderr
      end
    end

    context '警告が抑制されている環境' do
      around do |example|
        original = $VERBOSE
        $VERBOSE = nil
        example.run
        $VERBOSE = original
      end

      it '$VERBOSE が nil でも警告が出ること' do
        expect { JpPrefecture::Prefecture.find(foo: 'x') }
          .to output(/DEPRECATION WARNING: unsupported field: :foo/).to_stderr
      end
    end
  end
end
