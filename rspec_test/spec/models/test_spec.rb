require 'rails_helper'

# RSpec.describe '四則演算' do  # グループ化

#   it '1 + 1 は 2 になること' do
#     expect(1 + 1).to eq 2  # expect(X).to eq Y => 1 + 1 が 2 になることを期待する
#   end
#   it '10 - 1 は 9 になること' do
#     expect(10 - 1).to eq 9
#   end

#   it '全部できること' do  # ４つのどこでエラーが出たかわからないからあんまり使わない
#     expect(1 + 2).to eq 3
#     expect(10 - 1).to eq 9
#     expect(4 * 8).to eq 32
#     expect(40 / 5).to eq 8
#   end

# end

# RSpec.describe '四則演算' do
#   describe '足し算' do
#     it '1 + 1 は 2 になること' do
#       expect(1 + 1).to eq 2
#     end
#   end
#   describe '引き算' do
#     it '10 - 1 は 9 になること' do
#       expect(10 - 1).to eq 9
#     end
#   end
# end

#---テスト用クラス-------------------------------------#

# class User
#   def initialize(name:, age:)
#     @name = name
#     @age = age
#   end

#   def greet
#     if @age <= 12
#       "ぼくは#{@name}だよ。"
#     else
#       "僕は#{@name}です。"
#     end
#   end
# end

# #----メソットのテスト------------------------------------#

# RSpec.describe User do
#   describe '#greet' do  # greetメソットをテストする
#     it '12歳以下の場合、ひらがなで答えること' do
#       user = User.new(name: 'たろう', age: 12)
#       expect(user.greet).to eq 'ぼくはたろうだよ。'
#     end
#     it '13歳以下の場合、漢字で答えること' do
#       user = User.new(name: 'たろう', age: 13)
#       expect(user.greet).to eq '僕はたろうです。'
#     end
#   end
# end

# #----contextで条件分け------------------------------------#

# RSpec.describe User do
#   describe '#greet' do
#     context '12歳以下の場合' do  # contextで条件分けもできる
#       it 'ひらがなで答えること' do
#         user = User.new(name: 'たろう', age: 12)
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以下の場合' do
#       it '漢字で答えること' do
#         user = User.new(name: 'たろう', age: 13)
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----beforeでテストで使用する定数のようなものの宣言------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     before do
#       # テスト実行時のit(変数を使う場所)が別ブロックにあるため、ローカル変数ではなく、インスタンス変数を使用
#       @params = { name: 'たろう' }
#     end

#     context '12歳以下の場合' do
#       it 'ひらがなで答えること' do
#         user = User.new(@params.merge(age: 12))
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以下の場合' do
#       it '漢字で答えること' do
#         user = User.new(@params.merge(age: 13))
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----各ブロックで使用する定数のようなものの宣言------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     before do
#       @params = { name: 'たろう' }
#     end

#     context '12歳以下の場合' do

#       before do
#         @params.merge!(age: 12)
#       end

#       it 'ひらがなで答えること' do
#         user = User.new(@params)  #上でage: 12を宣言したので@paramsのみ記載
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以下の場合' do

#       before do
#         @params.merge!(age: 13)
#       end

#       it '漢字で答えること' do
#         user = User.new(@params)
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----インスタンス変数のかわりに let を使う------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     # let(:params) do
#     #   hash = {}
#     #   hash[:name] = 'たろう'
#     #   hash
#     # end  #下の１行にまとめられる

#     let(:params) {{ name: 'たろう'}}  # let(:foo) { ... } のように書くと、 { ... } の中の値が foo として参照できる

#     context '12歳以下の場合' do

#       before do
#         params.merge!(age: 12)
#       end

#       it 'ひらがなで答えること' do
#         user = User.new(params)
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以下の場合' do

#       before do
#         params.merge!(age: 13)
#       end

#       it '漢字で答えること' do
#         user = User.new(params)
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----userもlet を使う------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(params) }
#     let(:params) {{ name: 'たろう'}}

#     context '12歳以下の場合' do

#       before do
#         params.merge!(age: 12)
#       end

#       it 'ひらがなで答えること' do
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以下の場合' do

#       before do
#         params.merge!(age: 13)
#       end

#       it '漢字で答えること' do
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----ageもlet を使う------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(params) }
#     let(:params) {{ name: 'たろう', age: age }}

#     context '12歳以下の場合' do

#       let(:age) { 12 }

#       it 'ひらがなで答えること' do
#         expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '13歳以上の場合' do

#       let(:age) { 13 }

#       it '漢字で答えること' do
#         expect(user.greet).to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----subject を使ってテスト対象のオブジェクトを1箇所にまとめる------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(params) }
#     let(:params) {{ name: 'たろう', age: age }}
#     subject { user.greet }

#     context '12歳以下の場合' do
#       let(:age) { 12 }
#       it 'ひらがなで答えること' do
#         is_expected.to eq 'ぼくはたろうだよ。'  #  上でuser.greetをsubjectで宣言したので、ここではis_expectedとする
#       end
#     end

#     context '13歳以上の場合' do

#       let(:age) { 13 }

#       it '漢字で答えること' do
#         is_expected.to eq '僕はたろうです。'
#       end
#     end
#   end
# end

# #----itに渡す文字列の省略------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(params) }
#     let(:params) {{ name: 'たろう', age: age }}
#     subject { user.greet }

#     context '12歳以下の場合' do
#       let(:age) { 12 }
#       it { is_expected.to eq 'ぼくはたろうだよ。'}
#     end

#     context '13歳以上の場合' do

#       let(:age) { 13 }

#       it { is_expected.to eq '僕はたろうです。'}
#     end
#   end
# end

# #----リファクタリング------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(name: 'たろう', age: age) }
#     subject { user.greet }

#     context '12歳以下の場合' do
#       let(:age) { 12 }
#       it { is_expected.to eq 'ぼくはたろうだよ。'}
#     end

#     context '13歳以上の場合' do

#       let(:age) { 13 }

#       it { is_expected.to eq '僕はたろうです。'}
#     end
#   end
# end

# #----specifyとexample------------------------------------#

# RSpec.describe User do
#   it '1 + 1 は 2 になること' do
#     expect(1 + 1).to eq 2
#   end

#   specify '1 + 1 は 2 になること' do #英文の時、自然な英文になるようにspecifyとexampleがある→機能はitと同じ
#     expect(1 + 1).to eq 2
#   end

#   example '1 + 1 は 2 になること' do
#     expect(1 + 1).to eq 2
#   end
# end

# #----shared_examples と it_behaves_like------------------------------------#

# RSpec.describe User do
#   describe '#greet' do

#     let(:user) { User.new(name: 'たろう', age: age) }
#     subject { user.greet }

#     shared_examples '子供のあいさつ' do
#       it { is_expected.to eq 'ぼくはたろうだよ。' }
#     end

#     context '0歳の場合' do
#       let(:age) { 0 }
#       it_behaves_like '子供のあいさつ'
#     end

#     context '12歳の場合' do
#       let(:age) { 12 }
#       it_behaves_like '子供のあいさつ'
#     end

#     shared_examples '大人のあいさつ' do
#       it { is_expected.to eq '僕はたろうです。' }
#     end

#     context '13歳の場合' do
#       let(:age) { 13 }
#       it_behaves_like '大人のあいさつ'
#     end
#     context '100歳の場合' do
#       let(:age) { 100 }
#       it_behaves_like '大人のあいさつ'
#     end

#   end
# end

#----context の再利用: shared_context と include_context------------------------------------#

# class User
#   def initialize(name:, age:)
#     @name = name
#     @age = age
#   end

#   def greet
#     if child?
#       "ぼくは#{@name}だよ。"
#     else
#       "僕は#{@name}です。"
#     end
#   end

#   def child?
#     @age <= 12
#   end
# end

# RSpec.describe User do
#   describe '#greet' do
#     let(:user) { User.new(name: 'たろう', age: age) }
#     subject { user.greet }
#     context '12歳以下の場合' do
#       let(:age) { 12 }
#       it { is_expected.to eq 'ぼくはたろうだよ。' }
#     end
#     context '13歳以上の場合' do
#       let(:age) { 13 }
#       it { is_expected.to eq '僕はたろうです。' }
#     end
#   end

#   describe '#child?' do
#     let(:user) { User.new(name: 'たろう', age: age) }
#     subject { user.child? }
#     context '12歳以下の場合' do
#       let(:age) { 12 }
#       it { is_expected.to eq true }
#     end
#     context '13歳以上の場合' do
#       let(:age) { 13 }
#       it { is_expected.to eq false }
#     end
#   end
# end

#----遅延評価される let と事前に実行される let------------------------------------#

RSpec.describe Blog do
  let(:blog) { Blog.create(title: 'RSpec必勝法', content: 'あとで書く') }
  before do
    blog # ここでデータベースにレコードを保存する
  end
  it 'ブログの取得ができること' do
    expect(Blog.first).to eq blog
  end
end

RSpec.describe Blog do
  let!(:blog) { Blog.create(title: 'RSpec必勝法', content: 'あとで書く') }
  it 'ブログの取得ができること' do
    expect(Blog.first).to eq blog
  end
end

