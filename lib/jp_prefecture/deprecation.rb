# frozen_string_literal: true

module JpPrefecture
  # 非推奨機能の告知
  module Deprecation
    PREFIX = '[jp_prefecture] DEPRECATION WARNING:'

    # 非推奨の警告を標準エラー出力に出す
    #
    # Kernel#warn は $VERBOSE が nil のとき (ruby -W0, RUBYOPT=-W0) 何も出力しない。
    # 破壊的変更の告知が届かなくなるため $stderr へ直接書き出す
    #
    # @param message [String] 警告の本文
    # @return [void]
    def self.warn(message)
      $stderr.puts "#{PREFIX} #{message}" # rubocop:disable Style/StderrPuts
    end
  end
end
