class SurveysController < ApplicationController

  def index
    
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.populate_questions

    @survey.save
    redirect_to @survey
  end

  def show
    @survey = Survey.find_by_id(params[:id])
    @g = Gruff::Line.new
    @g.title = 'Wow!  Look at this!'
    @g.labels = { 0 => '5/6', 1 => '5/15', 2 => '5/24', 3 => '5/30', 4 => '6/4',
                 5 => '6/12', 6 => '6/21', 7 => '6/28' }
    @g.data :Jimmy, [25, 36, 86, 39, 25, 31, 79, 88]
    @g.data :Charles, [80, 54, 67, 54, 68, 70, 90, 95]
    @g.data :Julie, [22, 29, 35, 38, 36, 40, 46, 57]
    @g.data :Jane, [95, 95, 95, 90, 85, 80, 88, 100]
    @g.data :Philip, [90, 34, 23, 12, 78, 89, 98, 88]
    @g.data :Arthur, [5, 10, 13, 11, 6, 16, 22, 32]    
    @g.write('../assets/images/any.png')
  end

  def graph

    send_data(@g.to_blob, :filename => "any.png", :type => 'image/png', :disposition => 'inline')
  end
end
