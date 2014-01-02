require "spec_helper"

describe "Teacher home" do
  let!(:teacher) { FactoryGirl.create(:teacher_with_courses) }
  before(:each) do
    login_as(teacher, scope: :user)
    visit root_path
  end

  subject { page }

  it_should_behave_like "a user's homepage" do
    let(:user) { teacher }
  end

  describe "courses" do
    describe "info" do
      it "should show course codes" do
        teacher.courses.each do |c|
          expect(page).to have_content(c.course_code)
        end
      end
    end

    describe "actions" do
      example "creating a new course" do
        expect {
          click_link "New Course"

          fill_in "Name", with: FactoryGirl.attributes_for(:course)[:name]
          click_button "Create Course"
        }.to change(Course, :count).by 1
      end

      example "editing a course" do
        expect {
          first(:link, "Edit").click

          fill_in "Name", with: FactoryGirl.attributes_for(:course)[:name]
          click_button "Update Course"

          teacher.courses.first.reload
        }.to change(teacher.courses.first, :name)
      end

      example "deleting a course" do
        expect {
          first(:link, "Delete").click
        }.to change(teacher.courses, :count).by -1
      end
    end
  end
end
