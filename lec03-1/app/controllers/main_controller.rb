class MainController < ApplicationController
  def test1
    render plain: "hello"
  end

  def test2
    render html: "hello"
  end

  def test3
    # render body: "hello"
    @x1 = params[:abc]
    @x2 = params[:def]
  end

  def test4
    render raw: "hello"
  end

  def calculator
    @score = params[:grade].to_i
    @grade = "X"
    if @score < 50
      @grade = "F"
    elsif @score < 55
      @grade = "D"
    elsif @score < 60
      @grade = "D+"
    elsif @score < 65
      @grade = "C"
    elsif @score < 70
      @grade = "C+"
    elsif @score < 75
      @grade = "B"
    elsif @score < 80
      @grade = "B+"
    elsif @score >= 80
      @grade = "A"
    end
  end

end
