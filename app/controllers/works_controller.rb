class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
	before_action :collect_staffs, only: [:new,:create,:edit,:update]

  # GET /works
  # GET /works.json
  def index
		from = Time.now.at_beginning_of_day
		to = from + 1.day
		@workers = []
    Work.where(start_work: from..to).each do |w|
			if w.end_word.nil?
				@workers << w
			end
		end
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
		staff_code = @work.staff.staff_code
		
		if already_start_work(@work.staff)
			redirect_to :root,notice:"既に出勤していますよ(・∀・)！"
		else
			if work_params[:staff_code] == staff_code
				respond_to do |format|
    		  if @work.save
    		    format.html { redirect_to works_path, notice: '出勤処理が完了しました(・∀・)！' }
    		    format.json { render :show, status: :created, location: @work }
    		  else
    		    format.html { render :new }
    		    format.json { render json: @work.errors, status: :unprocessable_entity }
    		  end
    		end
			else
				redirect_to new_work_path, notice: "スタッフコードが一致しません(´・ω・`)`)"
			end
		end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
		@work.end_word = Time.now
		if @work.save
    	respond_to do |format|
    	  format.html { redirect_to works_url, notice: '退勤しました(・∀・)！お疲れ様でした(・∀・)！' }
    	  format.json { head :no_content }
    	end
		end
  end

  private
		
		#既に出勤していたらTrueをそうでなければFalseを返す
		#引数にはStaffモデルを取得する
		#これを受けたコードはTrueならなにもしない。
		#Falseならば出勤処理を実施する。
		def already_start_work(staff)
			last_work = staff.works.last
			if last_work.nil?
				return false
			else
				if last_work.end_word.nil?
					return true
				else
					return false
				end
			end
		end

		#その店舗に属するスタッフの一覧を取得する
		def collect_staffs
			@staffs = {}
			current_user.staffs.each do |staff|
				@staffs["#{staff.name}"] = staff.id
			end
		end

    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:user_id, :staff_id, :start_work, :end_word, :image,:staff_code)
    end
end
