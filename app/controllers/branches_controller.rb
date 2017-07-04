class BranchesController < ApplicationController
  before_action :set_branch, only: [:get_service_categories, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]
  
  # GET /branches
  # GET /branches.json
  
  def index
    @branches = Branch.all
  end

  def get_service_categories
    @service_categories = @branch.service_categories
    return render partial: "service_categories", locals: { :@service_categories => @service_categories }
  end
  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @get_branches = Branch.all
    @branch = Branch.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to new_salon_path, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:salon_id, :salon_email, :area, :name)
    end
end
