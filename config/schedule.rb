
#毎日12時になった時に退勤を忘れているスタッフの退勤時間を
#出勤時間に9.5時間プラスした時間として修正する
every 1.days, at: "12:00 am"  do
	Work.all.each do |w|
		if w.end_word.nil?
			w.end_word =  w.start_work + 9.5.hours
			w.save
		end
	end
end
