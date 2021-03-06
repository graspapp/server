class ConceptsController < ApplicationController
  before_action :find_and_authorize_concept, except: :create

  def create
    @unit = Unit.find(params[:concept][:unit_id])
    @concept = @unit.concepts.build(concept_params)
    authorize @concept
    if @concept.save
      redirect_to @unit
    else
      flash[:alert] = @concept.errors.full_messages.to_sentence
      redirect_to (request.referer.present? ? :back : @unit)
    end
  end

  def show
    
    @concept_progresses = @concept.concept_progresses.sorted 

    if current_user.is_a? Student
      enrollment = Enrollment.find_by(course: @concept.unit.course,
                                      student: current_user)
      
      if enrollment.concept_progresses.find_by(concept: @concept).nil?
        @concept_progress = ConceptProgress.new(enrollment: enrollment,
                                                concept: @concept)
        @concept_progress.save
      end
    end
  end

  def edit
  end

  def update
    if @concept.update_attributes(concept_params)
      flash[:success] = "Concept updated"
      redirect_to @concept.unit
    else
      render "edit"
    end
  end

  def destroy
    @unit = @concept.unit
    @concept.destroy
    flash[:success] = "Concept successfully deleted."
    redirect_to @unit
  end

  private

  def concept_params
    params.require(:concept).permit(:name, :description, :dok1_resources,
                                    :dok2_resources, :dok3_resources)
  end

  def find_and_authorize_concept
    @concept = Concept.find(params[:id])
    authorize @concept
  end
end
