class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render new_cocktail_dose
    end
  end


# private
  # def dose_params
  #   raise
  #   params.require(:dose).permit()
  # end

end
