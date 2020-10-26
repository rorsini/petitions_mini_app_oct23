class PetitionsController < ApplicationController
  before_action :authenticate_admin_user!, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_petition, only: [:show, :edit, :update, :destroy, :signatures]

  # GET /petitions
  # GET /petitions.json
  def index
    @petitions = Petition.all
  end

  # GET /petitions/:id
  # GET /petitions/:id.json
  def show
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/:id/edit
  def edit
  end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(petition_params)

    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Petition was successfully created.' }
        format.json { render :show, status: :created, location: @petition }
      else
        format.html { render :new }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/:id
  # PATCH/PUT /petitions/:id.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: 'Petition was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/:id
  # DELETE /petitions/:id.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url, notice: 'Petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # POST /petitions/:id/signatures
  def signatures
    @petition.increment!(:signatures)
    redirect_to @petition, notice: "Thanks #{params[:name]}! Your signature has been recorded."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.friendly.find(params[:id] || params[:petition_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_params
      params.require(:petition).permit(:title, :body, :letter)
    end
end
