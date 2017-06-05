class Api::V1::AddressesController < ApplicationController
  def states
    @states = State.all
  end

  def cities
    @state = State.includes(:cities).find(params[:id])
    @cities = @state.cities
  end
end
