#Code to Resize Images from Larger jpegs to Thumbnails

#Admin####
library(readxl)
library(imager)

#Vectors & Data####
  p<-read_excel("portfolio.xlsx",sheet="portfolio")
    p<-subset(p,Include=="Yes")
  
  images<-as.vector(interaction(levels(as.factor(p$Filename)),"jpg"))
    
  input<-"portfolio/"
  output<-"portfolio_thumb/"

#Loop Through Images
  
  for(i in images){
    input_name<-paste(input,i,sep="")
    output_name<-paste(output,i,sep="")
    
    im<-load.image(input_name)
      w<-width(im)
      h<-height(im)
    thmb<-resize(im,round(w/10),round(h/10))

    save.image(thmb,output_name)
  }
  