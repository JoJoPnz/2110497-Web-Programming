class MainController < ApplicationController
  def test
    @amount = params[:amount].to_i
    @line_empty = params[:lineEmpty]
  end

  def test2
  end

  def test3
    @line_empty = []
    @subject_array = params[:subject]
    @score_array = params[:score]
    for i in 1..@subject_array.length()
      if(@subject_array[i-1] == "" || @score_array[i-1] == "")
        @line_empty.push(i)
      end
    end

    # render plain: @line_empty
    # if empty line => redirect to fill table
    if(@line_empty.length() > 0)
      redirect_to("/main/test/?amount=#{@subject_array.length()}&lineEmpty=#{@line_empty}")
    end

    # calculate the answer
    @maxScore = @score_array[0].to_i
    @maxSub = @subject_array[0]
    @sumScore = 0
    for i in 0..@subject_array.length()-1
      @sumScore += @score_array[i].to_i
      if(@score_array[i].to_i > @maxScore)
        @maxScore = @score_array[i].to_i
        @maxSub = @subject_array[i]
      end
    end

  end
end
