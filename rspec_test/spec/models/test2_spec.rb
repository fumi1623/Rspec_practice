require 'rails_helper'

# RSpec.describe 'matcher' do
#   it '1 + 1 は 2 になること' do
#     expect(1 + 1).to eq 2        #ここではeqがマッチャー(to,not_toはマッチャーではなくRSpecのメソット)
#     expect(1 + 3).to eq 4        #~であることにはto
#     expect(1 + 3).not_to eq 2    #~でないことにはnot_to
#     expect(1 + 1).to eq 2        #eq:期待値と実際の値が等しい
#     expect(1 + 2).to be >= 3     #be:値の大小を検証するときによく使う
#   end
#   it '配列' do
#     expect([1, 2, 3]).to include 2  #ここではincludeがマッチャー
#   end
#   it 'be or eq' do
#     message = 'Hello'
#     message_1 = 'Hello'
#     message_2 = 'Hello'
#     expect([message].first).to be message          # [message].first.equal? message を検証している
#     expect([message_1].first).to be message_2      # message_1 と message_2 は異なるインスタンスなのでテストが失敗する
#     expect([message_1].first).to eq message_2      # message_1 == message_2 の結果は真になるのでテストはパスする
#     expect(true).to be true                        # true / false / nil はいつでも同じインスタンス
#     expect(false).to be false
#     expect(nil).to be nil
#     expect(1 + 1).to be 2                          # 整数値やシンボルは、同じ値はいつでも同じインスタンス
#     expect(:foo).to be :foo
#   end
# end

#---empty?-------------------------------------#

# RSpec.describe 'be_XXX' do
  # it 'empty?' do
  #   expect([]).to be_empty
  #   expect([].empty?).to be true
  #   expect([].empty?).to eq true
  # end

  # it 'varidate' do
  #   user = User.new(name: 'Tom', email: 'tom@example.com')
  #   expect(user).to be_valid # user.valid? が true になればパスする
  # end

  # it 'be_truthy and be_falsey' do
  #   user = User.new
  #   expect(user.save).to be_falsey  # 必須項目が入力されていないので保存できない（結果はfalse）

  #   user.name = 'Tom'
  #   user.email = 'tom@example.com'
  #   expect(user.save).to be_truthy  # 必須項目が入力されているので保存できる（結果はtrue）
  # end

  # it 'be_true and be_false' do
  #   expect(1).to be_truthy        #どちらもOK
  #   expect(nil).to be_falsy

  #   expect(1).to be true          #どちらもNG
  #   expect(nil).to be false       #true/falseは厳密にtrue/falseの値でないとエラーが出る

  #   expect(1).to eq true          #どちらもNG
  #   expect(nil).to eq false
  # end

# end


#---change + from / to / by-------------------------------------#

RSpec.describe 'change' do

  it 'from/to' do
    x = [1, 2, 3]
    # expect(x.size).to eq 3
    # x.pop
    # expect(x.size).to eq 2
    #expect{ X }.to change{ Y }.from(A).to(B) ＝ 「X すると Y が A から B に変わることを期待する」
    # expect{ x.pop }.to change{ x.size }.from(3).to(2)
    expect{ x.push(10) }.to change{ x.size }.by(1)
  end

end
