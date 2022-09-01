class MainController < ApplicationController
  def test
  end
  def test_post
    @sub1 = params[:sub1]
    @sub2 = params[:sub2]
    @sub3 = params[:sub3]
    @score1 = params[:score1].to_i
    @score2 = params[:score2].to_i
    @score3 = params[:score3].to_i
    @maxScore = @score1
    @maxSub = @sub1
    if(@score2 > @maxScore)
      @maxScore = @score2
      @maxSub = @sub2
    end
    if(@score3 > @maxScore)
      @maxScore = @score3
      @maxSub = @sub3
    end
    @sumScore = @score1 + @score2 + @score3
  end
end
