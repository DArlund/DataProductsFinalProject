library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("BMI Measurement and Weight Loss Goals"),
  sidebarPanel(
    numericInput('id1', 'Weight (lbs)', 200, min = 100, max = 500),
    numericInput('id2', 'Height (ft)', 6, min = 1, max = 7),
    numericInput('id3', 'Height (in)', 0, min = 0, max = 11),
    sliderInput('BMI', "What is your desired BMI?",value=25,min=16,max=30,step=.5),
    numericInput('id4', 'How soon do you wish to be at your desired BMI? (in weeks)', 12, min = 1, max = 104),
    submitButton('Submit')
  ),
  mainPanel(      tabsetPanel(
    tabPanel(
      h4('Help Tab'),
      h4('Welcome to my app! This app allows you to calculate your BMI, as well as a weekly weight loss goal based on your ideal BMI'),
      h4('To begin, simply input your weight (in pounds) and height (in feet and inches), then hit Submit.'),
      h4('Once you do that, you can switch to the other tab to veiw your BMI, both as a number, and on a chart 
         compared to the classifications of the BMI. The white line on the chart is your current BMI.'),
      h4('Next, you can set a goal for yourself of a target BMI, and how many weeks you would like to take to 
         reach that goal. This goal BMI is the orange line. The line beneath the chart will tell you how 
         many pounds per week you would need to lose to reach your target BMI in that period of time. Good Luck!')
      ), 
    tabPanel(
      h4('Results Tab'),
      h4('Your BMI is'),
      verbatimTextOutput('oid1'),
      plotOutput('newChart'),
      verbatimTextOutput('oid3'))
  )

  )
))