class MemebershipsController < ApplicationController
  before_action :set_memebership, only: [:show, :edit, :update, :destroy]

  # GET /memeberships
  # GET /memeberships.json
  def index
    @memeberships = Memebership.all
  end

  # GET /memeberships/1
  # GET /memeberships/1.json
  def show
  end

  # GET /memeberships/new
  def new
    @memebership = Memebership.new
    @memeberships = Memebership.all
    @beerClubs = BeerClub.all
  end

  # GET /memeberships/1/edit
  def edit
  end

  # POST /memeberships
  # POST /memeberships.json
  def create
    @beerClubs = BeerClub.all
    @memebership = Memebership.new(memebership_params)

    respond_to do |format|
      if @memebership.save
        current_user.memeberships<<@memebership
        format.html { redirect_to @memebership, notice: 'Memebership was successfully created.' }
        format.json { render action: 'show', status: :created, location: @memebership }
      else
        format.html { render action: 'new' }
        format.json { render json: @memebership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memeberships/1
  # PATCH/PUT /memeberships/1.json
  def update
    respond_to do |format|
      if @memebership.update(memebership_params)
        format.html { redirect_to @memebership, notice: 'Memebership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @memebership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memeberships/1
  # DELETE /memeberships/1.json
  def destroy
    @memebership.destroy
    respond_to do |format|
      format.html { redirect_to memeberships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memebership
      @memebership = Memebership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memebership_params
      params.require(:memebership).permit(:user_id, :beer_club_id)
    end
end
