class DailyUpdatesController < ApplicationController
  before_action :set_daily_update, only: %i[ show edit update destroy ]

  # GET /daily_updates or /daily_updates.json
  def index
    @daily_updates = DailyUpdate.all
  end

  # GET /daily_updates/1 or /daily_updates/1.json
  def show
  end

  # GET /daily_updates/new
  def new
    @daily_update = DailyUpdate.new
  end

  # GET /daily_updates/1/edit
  def edit
  end

  # POST /daily_updates or /daily_updates.json
  def create
    @daily_update = DailyUpdate.new(daily_update_params)

    respond_to do |format|
      if @daily_update.save
        format.html { redirect_to daily_update_url(@daily_update), notice: "Daily update was successfully created." }
        format.json { render :show, status: :created, location: @daily_update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_updates/1 or /daily_updates/1.json
  def update
    respond_to do |format|
      if @daily_update.update(daily_update_params)
        format.html { redirect_to daily_update_url(@daily_update), notice: "Daily update was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_updates/1 or /daily_updates/1.json
  def destroy
    @daily_update.destroy

    respond_to do |format|
      format.html { redirect_to daily_updates_url, notice: "Daily update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_update
      @daily_update = DailyUpdate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_update_params
      params.require(:daily_update).permit( :description, :start_time, :end_time, :project_name, :user_id, :organization_id).merge(user_id: current_user.id, organization_id: current_user.organization_id )
    end
end
