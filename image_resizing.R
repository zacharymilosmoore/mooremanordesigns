#Code to Resize Images from Larger jpegs to Thumbnails

#Admin####
library(readxl)
library(imager)

#Vectors & Data####
  p<-read_excel("portfolio.xlsx",sheet="portfolio")
    p<-subset(p,Include=="Yes")
  
  images<-as.vector(interaction(levels(as.factor(p$Filename)),"jpg"))
    #Only updating those without existing thumbnails to save time
    images<-images[which(file.exists(paste("portfolio_thumb/",images,sep=""))==T)]
  
  input<-"portfolio_org/"
  output<-"portfolio_thumb/"
  output2<-"portfolio/"

#Loop Through Images
  
  for(i in images){
    input_name<-paste(input,i,sep="")
    output_name<-paste(output,i,sep="")
    output2_name<-paste(output2,i,sep="")

    im<-load.image(input_name)
      w<-width(im)
      h<-height(im)
      s<- if(h<1000) {1} else {10}  
      
    thmb<-resize(im,round(w/s),round(h/s))
    alt<-resize(im,round(0.99*w),round(0.99*h))
    
    save.image(thmb,output_name)
    save.image(alt,output2_name)
    
  }
  