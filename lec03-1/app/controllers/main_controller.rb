class MainController < ApplicationController
  def test1
    render plain: "hello"
  end

  def test2
    render html: "hello"
  end

  def test3
    render body: "hello"
  end

  def test4
    render raw: "hello"
  end
end
