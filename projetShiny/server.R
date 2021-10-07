
source('fonctions.R')
source('./services/description_service.R')
source('./services/univariate_service.R')
source('./services/bivariate_service.R')
source('./services/classification_service.R')

server <- function(input, output) {
 
 description(input,output)
 univariate(input,output)
 bivariate(input,output)
 classification(input,output)
 
}

