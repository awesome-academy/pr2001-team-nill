# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @dishes = Dish.all
  end

  def chefs
    @categories = Category.all
  end

  def menus; end

  def reviews
   
  end

  def book_table; end
end
