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
    if(!@score_array.nil?)
      @score_array = @score_array.map{ |e| e.to_i}
    end
    
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
      # save in database
      @allSubjects = Subject.where(name: @subject_array[i])
      if(@allSubjects.empty?)
        Subject.create(name: @subject_array[i], score: @score_array[i])
      else
        for s in @allSubjects
          s.update(score: @score_array[i])
        end
      end
    end
  end

  def showList
    @allSubjects = Subject.all
    @maxSubject = ""
    @maxScore = 0
    @sumScore = 0
    for s in @allSubjects
      @sumScore += s.score
      if(s.score >= @maxScore)
        @maxScore = s.score
        @maxSubject = s.name
      end
    end
  end

  def deleteSubject
    @id = params[:id].to_i
    s = Subject.find_by(id: @id)
    s.destroy
    redirect_to("/score/list")
  end

  def editSubject
    @id = params[:id].to_i
    @s = Subject.find_by(id: @id)
    @name = @s.name
    @score = @s.score
  end

  def saveSubject
    @id = params[:id].to_i
    @name = params[:name]
    @score = params[:score].to_i
    s = Subject.find_by(id: @id)
    s.update(name: @name, score: @score)
    redirect_to('/score/list')
  end

end
