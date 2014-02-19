class ZombiesController < ApplicationController
  before_action :set_locale_with_gem, only: :index
  before_action :set_locale_with_no_gem, only: :show

  def set_locale_with_gem
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
  protected :set_locale_with_gem

  def set_locale_with_no_gem
    I18n.locale = request.headers['Accept-Language']
  end
  protected :set_locale_with_no_gem

  # GET /zombies
  # GET /zombies.json
  def index
    @zombies = Zombie.all
    respond_to do |format|
      format.json
      format.xml { render xml: @zombies }
    end
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
    @zombie = Zombie.first
    respond_to do |format|
      format.json
      format.xml
    end
  end

  # GET /zombies/new
  def new
    @zombie = Zombie.new
  end

  # GET /zombies/1/edit
  def edit
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @zombie }
      else
        format.html { render action: 'new' }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :age)
    end
end