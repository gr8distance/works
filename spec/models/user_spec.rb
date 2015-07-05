#coding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
	
	it "とりあえず通常通りなら保存できること" do
		user= User.new({
			name: "Yuuji",
			email: "yuuji@aimerthyst.co",
			password: "password",
			password_confirmation: "password"
		})
		expect(user.save).to eq true
	end

	it "名前がない場合は保存できないことを確認する" do
		u = User.new({email: "yuuji@m.com",password: "password",password_confirmation: "password"})
		u.valid?
		expect(!u.save).to eq true
		expect(u.errors[:name]).to include("名前の重複は認められていません")
	end

	it "メールアドレスが無ければ保存できないこと" do
		u = User.new({name: "yuuji",password: "password",password_confirmation: "password"})
		u.valid?
		expect(!u.save).to eq true
		expect(u.errors[:email]).to include("can't be blank")
	end
	
	it "メールアドレスが無ければ保存できないこと" do
		u = User.new({name: "yuuji",email: "ug@mail.com"})
		u.valid?
		expect(!u.save).to eq true
		expect(u.errors[:password]).to include("can't be blank")
	end

	it "重複したアドレスなら保存できないこと" do
		user = {
			name: "Yuuji",
			email: "yuuji@aimerthyst.co",
			password: "password",
			password_confirmation: "password"
		}
		u1 = User.create(user)
		u2 = User.new(user)
		
		u2.valid?
		expect(u2.save).to eq false
		expect(u2.errors[:email]).to include("has already been taken")
	end

	it "パスワードが一致しないと保存できないこと" do
		user = {
			name: "Yuuji",
			email: "yuuji@aimerthyst.co",
			password: "password1",
			password_confirmation: "password2"
		}
		u = User.new(user)
		expect(u.save).to eq false
	end

	it "パスワードの長さが8文字以上ないと保存できないこと" do
		user = {
			name: "Yuuji",
			email: "yuuji@aimerthyst.co",
			password: "pas",
			password_confirmation: "pas"
		}
		u = User.new user
		u.valid?
		expect(u.save).to eq false
		expect(u.errors[:password]).to include("is too short (minimum is 8 characters)")
	end
	
	#it "呼び出されたモデルはUSERモデルという名前でACTIVERECORDを継承していること" do
	#	user = User.new({
	#		name: "yuuji",
	#		email: "y@mail.com",
	#		password: "password",
	#		password_confirmation: "password"
	#	})

	#	expect(user.save).to eq true
	#	u = User.last.class
	#	expect(u).to eq "User"
	#end


end
