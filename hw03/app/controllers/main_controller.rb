class MainController < ApplicationController
  def test
    @amount = params[:amount].to_i
    @subject_array = params[:subject]
    @score_array = params[:score]
    @line_empty = params[:lineEmpty]
    if(!@line_empty.nil?)
      @line_empty = @line_empty.map{ |e| e.to_i}
    end
  end

  def test2
  end

  def test3
    @line_empty = []
    @subject_array = params[:subject]
    @score_array = params[:score]
    @subject_array_query = ""
    @score_array_query = ""
    @line_empty_query = ""
    for i in 1..@subject_array.length()
      if(@subject_array[i-1].blank? || @score_array[i-1] == "")
        @line_empty.push(i)
        @line_empty_query += "&lineEmpty[]=#{i}"
      end
      @subject_array_query += "&subject[]=#{@subject_array[i-1]}"
      @score_array_query += "&score[]=#{@score_array[i-1]}"
    end
    # if empty line => redirect to fill table
    if(@line_empty.length() > 0)
      # create query params array for lineEmpty var.
      redirect_to("/main/test/?amount=#{@subject_array.length()}" + @subject_array_query + @score_array_query + @line_empty_query)
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
