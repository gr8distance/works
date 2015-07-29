class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :staff

	mount_uploader :image, ImageUploader
	
	validates_presence_of :image,
		message: "顔写真を空欄にすることはできません(´・ω・｀)"

	class << self

		#労働時間を集計して勤務日ごとに表記するメソッド
		#引数はスタッフインスタンス
		#戻り値は日付と勤務時間の合計ごとにわけられたHASH
		def work_times_at_day_by(staff)
			works = []
			work_times = {}

			staff.works.by_month.each do |w|
				works << {
					day: w.start_work.strftime("%m/%d"),
					start: w.start_work,
					fin: w.end_word,
					all: (((w.end_word.nil?)? w.start_work : w.end_word) - w.start_work)/60
				}
			end
			works.each do |w|
				if work_times["#{w[:day]}"].nil?
					work_times["#{w[:day]}"] = 0
				else
					work_times["#{w[:day]}"] += w[:all]
				end
			end
			return work_times
		end

	end


end
