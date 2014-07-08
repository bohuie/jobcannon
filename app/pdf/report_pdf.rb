class ReportPdf < Prawn::Document
  def initialize(user, experience, reference, location)
    super()
    @user = user
    @experiences = experience
    @references = reference
    @location = location
    contact_info
    about_me
    education
    experiences
    references
  end
 
  def contact_info
    bounding_box([0, cursor], :width => 540, :height => 100)do
      text @user.fname + " " + @user.lname, size: 15, style: :bold, align: :center
      text @user.email, align: :center
      text ""
      text @location.city + " " + @location.province
      text @location.postalcode
    end
  end

  def about_me
    bounding_box([0, cursor], :width => 540, :height => 100)do
      text "About Me", size: 17, style: :bold
      stroke_horizontal_rule
      pad_top(10){
        text @user.info
      }
    end
  end

  def education
    bounding_box([0, cursor], :width => 540, :height => 100)do
      text "Education", size: 17, style: :bold
      stroke_horizontal_rule
      pad_top(10){
        text @location.education
      }
    end
  end

  def experiences
    bounding_box([0, cursor], :width => 540, :height => 20)do
      text "Experiences", size: 17, style: :bold
      stroke_horizontal_rule
    end
    @experiences.each do |e|
      bounding_box([0, cursor], :width => 540, :height => 80)do
      pad(10){
          @sdate = e.sdate
          @fdate = e.fdate
          text @sdate.strftime("%b - %Y") + " - " + @fdate.strftime("%b - %Y") + " - " + e.company_name, size: 14
          text e.title
          text e.description
          text "Supervisor: " + e.supervisor
        }
      end
    end
  end

  def references
    bounding_box([0, cursor], :width => 540, :height => 30)do
    pad_top(10){
      text "References", size: 17, style: :bold
    }
      stroke_horizontal_rule
    end
    @references.each do |r|
      bounding_box([0, cursor], :width => 540, :height => 40)do
        pad_top(10){
        text r.fname + " " + r.lname + " - " + r.relationship
        text "Phone: " + r.phone_number + "Email: " + r.email
        }
      end
    end
  end
 
  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50
 
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 300) do
      text "Lorem ipsum", size: 15, style: :bold
      text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
    end
 
    bounding_box([300, y_position], :width => 270, :height => 300) do
      text "Duis vel", size: 15, style: :bold
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
    end
 
  end
 
  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end
 
  def product_rows
    [['#', 'Name', 'Price']] +
      @products.map do |product|
      [product.id, product.name, product.price]
    end
  end
end