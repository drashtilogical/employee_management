class LeavesController < ApplicationController
  before_action :set_leafe, only: %i[ show edit update destroy ]

  # GET /leaves or /leaves.json
  def index
    @leaves =  if current_user.is_admin? 
                 Leave.all.page params[:page]
               else
                Leave.where(user_id: current_user.id).page params[:page]
               end
  end

  # GET /leaves/1 or /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leafe = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves or /leaves.json
  def create
    @leafe = Leave.new(leafe_params)
    if @leafe.save
      redirect_to leaves_url, notice: "Leave was successfully created."
    else
      render new
    end
  end
  

  # PATCH/PUT /leaves/1 or /leaves/1.json
  def update
    respond_to do |format|
      if @leafe.update(leafe_params)
        format.html { redirect_to leaves_url(@leafe), notice: "Leave was successfully updated." }
        format.json { render :show, status: :ok, location: @leafe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @leafe = Leave.find(params[:id])
    if params[:commit] == "Approve"
      @leafe.status = :approved
    elsif params[:commit] == "Reject"
      @leafe.status = :rejected
    end
    if @leafe.save
      redirect_to leafe_url(@leafe), notice: "#{@leafe.user&.name} Leave updated"
    else
      redirect_to leafe_url(@leafe), alert: "Failed to update leave status."
    end
  end

  # DELETE /leaves/1 or /leaves/1.json
  def destroy
    @leafe.destroy

    respond_to do |format|
      format.html { redirect_to leaves_url, notice: "Leave was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leafe
      @leafe = Leave.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leafe_params
      params.require(:leave).permit(:leave_type, :description, :from_date, :to_date, :status, :user_id, :organization_id).merge(user_id: current_user.id, organization_id: current_user.organization_id )
    end
end
