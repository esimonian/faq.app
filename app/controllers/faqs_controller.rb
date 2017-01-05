class FaqsController < ApplicationController
  def index
    @faqs = Faq.order('position')
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      redirect_to @faq, notice: "Successfully created FAQ."
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(faq_params)
        format.html {redirect_to @faq, notice: "Successfully updated FAQ."}
        format.json { respond_with_bip(@faq) }
      else
        format.html {render :edit }
        format.json { respond_with_bip(@faq) }
      end
    end
    
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to faqs_url, notice: "Successfully destroyed FAQ."
  end

  def sort
    params[:faq].each_with_index do |id, index|
      Faq.where(id: id).update_all({position: index+1})
    end
    head :no_content
  end

  private 
  def faq_params
    params.require(:faq).permit(:question, :answer, :position)
  end
end
