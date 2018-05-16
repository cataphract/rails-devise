require 'mongo'

class TestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    cmd_res = system(params[:cmd])
    render plain: "Result: #{cmd_res}"
  end

  def put
    res = mongo_col.find({ name: params.require(:query) })
#    res = nil
    render json: params.merge(res: res)
  end

  def mongo_insert
    doc = { name: 'Steve', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] }
    res = mongo_col.insert_one doc
    render json: { result: res }
  end

  private

  # @return [Mongo::Collection]
  def mongo_col
    @mongo_client ||= Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'test')[:rails]
  end
end
