library(shiny)
library(shinyWidgets) 
library(leaflet)
library(ggplot2)
library(plotly)
library(dplyr)
library(rsconnect)


# UI
ui <- fluidPage(
  titlePanel("Michelin-Starred Restaurants Analysis"),
  
  # Setting the fixed height for 1080p dashboard without scrolling
  tags$style(type = "text/css", "
    body { overflow: hidden; }
    .container-fluid { max-width: 1080px; }
  "),
  
  tabsetPanel(
    tabPanel("Geographic Distribution",
             leafletOutput("map", height = "400px"),  # Reduced map height for better text visibility
             sliderTextInput(
               inputId = "starSlider1",
               label = "Select Star Level:",
               choices = c("1", "2", "3"),
               selected = "1",
               grid = TRUE,
               animate = TRUE,
               width = "80%"
             ),
             conditionalPanel(
               condition = "input.starSlider1 == '1'",
               p("This visualization shows the geographic distribution of Michelin-starred restaurants across the world. The map highlights concentrations of these restaurants, with clusters of black dots marking the locations of Michelin-starred establishments. The darker and denser clusters in Europe, especially in France, indicate a high density of Michelin-rated restaurants, while other regions like the United States and parts of Asia also have notable but sparser distributions."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             ),
             conditionalPanel(
               condition = "input.starSlider1 == '2'",
               p("This map tells a story of culinary prestige distributed across specific global regions, with Michelin's influence stretching from its origins in Europe to the Americas and Asia. The dense clustering in Europe, and particularly in France, highlights the deep-rooted culinary traditions and the high density of Michelin-rated establishments, while the presence in Asia and North America signals a growing appreciation for and recognition of culinary excellence worldwide. The underrepresentation in other areas could point to potential growth opportunities for the Michelin Guide in expanding its reach and diversifying its selection across different cuisines and cultures."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             ),
             conditionalPanel(
               condition = "input.starSlider1 == '3'",
               p("The global distribution of Michelin-starred restaurants reveals significant insights into culinary landscapes. Europe, particularly France, remains the historical epicenter of fine dining, evidenced by the dense clustering of stars. Meanwhile, North America and parts of Asia are emerging culinary hubs, with cities like New York and Tokyo gaining Michelin’s attention. However, regions such as South America, Africa, and parts of the Middle East show a notable absence of Michelin-rated establishments, indicating untapped markets and potential growth opportunities. This selective recognition reflects Michelin’s focus on specific cities that meet its standards for quality and innovation, illustrating a dynamic interplay between tradition and modern culinary trends."),
               p("In conclusion, we can notice that the restaurants for all the star levels are situated is the touristy and densly populated destinations."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             )
    ),

    tabPanel("Cuisine Comparison",
             sliderTextInput(
               inputId = "starSlider2",
               label = "Select Star Level for Comparison:",
               choices = c("1", "2", "3"),
               selected = "1",
               grid = TRUE,
               animate = TRUE,
               width = "80%"
             ),
             plotlyOutput("cuisine_diverging_chart", height = "300px"),
             
             # Add conditional panel for 1-star level cuisine text
             conditionalPanel(
               condition = "input.starSlider2 == '1'",
               p("This visualization reveals that diners looking for a 1-star Michelin experience will most likely encounter Japanese or Cantonese options, as well as other Asian cuisines. It suggests that restaurants offering inventive, modern, or regionally inspired dishes have successfully carved out their niche at the 1-star level. For food enthusiasts, this may hint at where to start exploring Michelin-starred options, especially if they’re interested in experiencing popular, critically acclaimed cuisines."),
               p("In summary, the chart tells a story of how certain cuisines, particularly those that blend traditional techniques with innovation, dominate the Michelin 1-star landscape. This balance of popularity and exclusivity highlights the diverse culinary landscape Michelin curates at this level, offering food lovers a rich tapestry of flavors and techniques to explore."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             ),
             
             # Add conditional panel for 2-star level cuisine text
             conditionalPanel(
               condition = "input.starSlider2 == '2'",
               p("The visualization reveals a strong preference for Cantonese, Contemporary, and French Contemporary cuisine at the 2-star level, suggesting that these cuisines have found a sweet spot in blending tradition with modern innovation, likely a quality Michelin values highly. The fact that Traditional British and other traditional or region-specific cuisines appear in the Bottom 10 might suggest that Michelin places a premium on innovation and complexity as one progresses through the star levels, making it harder for more straightforward or traditional cuisines to maintain their standing."),
               p("In summary, the graph tells a story of refined tastes and the growing importance of innovation in the Michelin star journey, especially as restaurants move from 1 to 2 stars. For aspiring 2-star chefs and restaurateurs, it offers insights into the types of cuisines and culinary qualities that Michelin values, possibly encouraging more innovation and finesse in the presentation and preparation of these traditional and niche cuisines."),
               p("For the 1 and 2 star restaurants we can notice that the cuisine and the country where they're situated is not really connected. It's irrespective of the cuisine native to the country."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             ),
             
             # Add conditional panel for 3-star level cuisine text
             conditionalPanel(
               condition = "input.starSlider2 == '3'",
               p("In the top 10, we see a clear standout: Contemporary cuisine dominates, with the highest count of three-star restaurants. Following it, Korean and Cantonese cuisines also hold a strong position among the top three, though with notably fewer restaurants than Contemporary. Sushi and Seafood also make the top 10, though they’re less frequent than the leading cuisines."),
               p("On the other end, the bottom 10 includes French contemporary, Classic French, and Chinese cuisines, each with fewer three-star establishments. Interestingly, some globally popular cuisines, like Italian and Japanese, also appear in the bottom 10, indicating that they may be less common among Michelin three-star establishments than expected.This visualization suggests that three-star Michelin restaurants are most likely to offer Contemporary cuisine, with other modern and specific regional styles like Korean and Cantonese also having a notable presence. Traditional styles such as Classic French and Italian appear less frequently, perhaps reflecting a shift in Michelin's focus toward modern and innovative dining experiences."),
               p("In the 3 - star restaurants, we can observe that restaurants are mostly of that cuisine which is native to that country and the restaurant is also situated over there."),
               style = "max-height: 300px; overflow-y: auto;" # Ensures text visibility
             )
    ),
    
    tabPanel("Distribution & Prices",
             fluidRow(
               column(6, 
                      plotlyOutput("trend_bar_plot", height = "350px"),
                      div(
                        p("Dominance of 1-Star Restaurants: The count for 1-star restaurants is significantly higher than for the other categories, especially in 2019. This suggests that achieving 2 or 3 stars is rare, which aligns with the Michelin Guide’s rigorous standards."),
                        p("Growth or Stability: As this data represents only two years, it’s a little challenging to identify a long-term trend, but it does suggest some stability in the number of Michelin restaurants between these years. Also, here we can analyze that the sudden rise of 1 star restaurants because of the increased awareness and the population, the number of  1 starred restaurants is growing or if the guide has a consistent approach in awarding stars yearly.")
                      )
               ),
               column(6, 
                      plotlyOutput("price_boxplot", height = "400px"),
                      div(
                        p("The data highlights the stratified nature of Michelin-starred dining. While there are more 1-star restaurants, they vary widely in pricing, making this level accessible to a broader audience. However, as the star level increases, so does the price consistency and exclusivity, reflecting the Michelin Guide's criteria for higher stars, which often emphasize not just food quality but also ambiance, service, and an overall refined dining experience."),
                        p("This analysis tells a story of accessibility at the entry level (1 star), progressing to rarity and luxury at the top level (3 stars).")
                      )
               )
             ),
             textOutput("summary_stats")
    ),
    tags$p("JackyWang. (2019). Michelin Restaurants. Kaggle.com. https://www.kaggle.com/datasets/jackywang529/michelin-restaurants/data")
    
  )
)

# Server
server <- function(input, output, session) {
  # Tab 1: Geographic Distribution Map
  output$map <- renderLeaflet({
    filtered_data <- data %>% filter(starLevel == as.numeric(input$starSlider1))
    
    leaflet(filtered_data) %>%
      addTiles() %>%
      addCircleMarkers(~longitude, ~latitude, color = ~starLevel, radius = 4,
                       label = ~paste(name, "(", cuisine, ")"))
  })
  
  # Tab 2: Diverging Bar Chart for Top and Bottom 10 Cuisines with City in Tooltip
  output$cuisine_diverging_chart <- renderPlotly({
    cuisine_data <- data %>% 
      filter(starLevel == input$starSlider2) %>% 
      group_by(cuisine, city) %>% 
      summarise(count = n()) %>%
      ungroup() %>%
      arrange(desc(count))
    
    top_10 <- head(cuisine_data, 10)
    bottom_10 <- tail(cuisine_data, 10)
    diverging_data <- rbind(top_10, bottom_10)
    diverging_data$rank <- c(rep("Top 10", 10), rep("Bottom 10", 10))
    
    p <- ggplot(diverging_data, aes(x = reorder(cuisine, count), 
                                    y = ifelse(rank == "Top 10", count, -count), 
                                    fill = rank, 
                                    text = paste("Cuisine:", cuisine, "<br>City:", city, "<br>Count:", count))) +
      geom_bar(stat = "identity", color = "gray70", size = 0.3) +
      coord_flip() +
      labs(title = paste("Top and Bottom 10 Cuisines for", input$starSlider2, "Star Restaurants"),
           x = "Cuisine", y = "Count") +
      scale_y_continuous(labels = abs) +
      scale_fill_manual(values = c("Top 10" = "#ffbfea", "Bottom 10" = "#aa829b")) +
      theme_minimal() +
      theme(axis.text.y = element_text(size = 10))
    
    ggplotly(p, tooltip = "text")
  })
  
  # Tab 3: Bar Chart for Trends Over Time with Custom Colors and Outline
  output$trend_bar_plot <- renderPlotly({
    trend_data <- data %>% 
      group_by(starLevel, year) %>% 
      summarise(count = n()) %>%
      ungroup()
    
    p <- ggplot(trend_data, aes(x = as.factor(year), y = count, fill = as.factor(starLevel))) +
      geom_bar(stat = "identity", position = "dodge", color = "black", size = 0.3) +  # Outline added
      labs(x = "Year", y = "Count", fill = "Star Level") +
      scale_fill_manual(values = c("#ffbfea", "#ff99c1", "#ff5b9a")) +
      theme_minimal()
    
    ggplotly(p)
  })
  
  
  # Tab 3: Boxplot for Price Analysis with Custom Colors
  output$price_boxplot <- renderPlotly({
    price_data <- data %>% 
      filter(!is.na(price)) %>% 
      mutate(starLevel = as.factor(starLevel))
    
    p <- ggplot(price_data, aes(x = starLevel, y = price, fill = starLevel)) +
      geom_boxplot() +
      scale_fill_manual(values = c("#ffbfea", "#ff99c1", "#ff5b9a")) +
      labs(x = "Star Level", y = "Price") +
      theme_minimal()
    
    ggplotly(p)
  })
  
  # Summary Statistics for Tab 3
  output$summary_stats <- renderText({
    paste("Total 1-Star Restaurants:", sum(data$starLevel == 1),
          "Total 2-Star Restaurants:", sum(data$starLevel == 2),
          "Total 3-Star Restaurants:", sum(data$starLevel == 3))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

