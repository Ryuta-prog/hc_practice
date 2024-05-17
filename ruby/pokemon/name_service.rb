# frozen_string_literal: true

# 名前変更に関するモジュールです
module NameService
    attr_reader :name

    def change_name(new_name)
        # 不適切な名前はエラー
        if new_name == "うんこ"
            puts "不適切な名前です"
        else
          @name = new_name
        end
    end
end