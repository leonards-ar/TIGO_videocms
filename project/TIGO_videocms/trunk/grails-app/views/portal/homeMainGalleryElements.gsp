<%@ page import="com.tigo.videocms.HomeMainGalleryElement" %>
<?xml version="1.0"?>
<menu>
       <!-- main parameters group (other parameters may be available by editing the ReadMe layer of each main Movie Clip within the source .fla file 
            and also the scroll bar component parameters for the thumbs menu and the description box.

           - if you modify some parameter values in Flash you can remove / comment the respective parameters from xml, this way the default Flash values will not be overwritten with values given in the xml file.

           - to change the graphic elements / fonts etc you need to edit the file in Flash and adjust the respective symbols with your own custom graphcis


         NOTE: If you want to use FlashVars inside the html page(s) of your site where you want to insert the .swf object in order to use a different .xml 
               configuration file url or to find an answer to a common question please check the General Tips & Tricks for All Flashtuning Products tutorial
               available  on our site in the tutorials section at this location:

               http://www.flashtuning.net/tutorials/

         -->

  
        <object param="useAutoPlay" value="0" />	
        <object param="autoPlayDelay" value="2.5" /> <!-- a numeric value in seconds -->

	<object param="maxThumbWidth" value="100" /> <!-- when using mirror you can set the maxThumbHeight to be double your image height -->
	<object param="maxThumbHeight" value="70" />

	<object param="maxBannerWidth" value="490" />
	<object param="maxBannerHeight" value="300" />

  	<object param="itemsOffset" value="0" />
	<object param="bannersOffset" value="0" />

        <object param="itemsX" value="0" /> <!-- thumbs menu together with the auto play buttons clip position -->
        <object param="itemsY" value="0" />

   
        <object param="thumbsX" value="490" /> <!-- only scrolling thumbs menu clip position -->
        <object param="thumbsY" value="0" />

 
        <object param="useMenuRollOverScroll" value="1" />
        
        <object param="useThumbsFocusRect" value="1" />
	<object param="focusRectBorder" value="5" />
	<object param="focusRectColor" value="0xffffff" />
	<object param="focusRectAlpha" value="1" /> <!-- a numeric value between 0 and 1 -->

	<object param="overShadowAlpha" value=".35" /> <!-- over image rect transparency a numeric value between 0 and 1 -->


	<object param="showDescriptionBox" value="1" />  <!-- //show / hide the description box -->
        <object param="descriptionBoxX" value="0" />  
        <object param="descriptionBoxY" value="200" /> 
	
  
	<!-- THE FOLLOWING 5 params are NOT USED HERE  -->

        <object param="textScrollViewAreaHeight" value="75" /> <!-- visible area height of de description text -->
	<object param="textScrollUseMouseWheel" value="true" />
	<object param="textScrollMouseWheelSpeed" value="10" />
	<object param="textScrollAcceleration" value="0.25" />
	<object param="textScrollMode" value="scrollBar" /> <!-- can be full, scrollBar, buttons -->


	<object param="useMirror" value="-" />
	<object param="mirrorHeightGaign" value="0.3" /> <!-- percentage value between 0 and 1 to increase or decrease the mirror height -->
	<object param="mirrorOffset" value="0" /> <!-- the offset distance between image and mirror -->

	<object param="useRollOverColoring" value="1" />
	<object param="rollOverColorIntensity" value="25" />
	<object param="rollOutColorIntensity" value="-25" />
	<object param="coloringSpeed" value="5" />

	<object param="showThumbTitle" value="0" />
	<object param="titleXOffset" value="50" />
	<object param="titleYOffset" value="70" />

    <object param="thumbsScrollAlpha" value="0" /> <!-- a numeric value between 0 and 1 -->
    <object param="thumbsScrollViewAreaWidth" value="100" /> <!-- visible area width -->
	<object param="thumbsScrollViewAreaHeight" value="300" /> <!-- visible area height -->
	<object param="thumbsScrollAcceleration" value="0.2" />
	<object param="thumbsScrollMode" value="scrollBar" /> <!-- can be full, scrollBar, buttons -->

	
	<object param="centerSWFinHMTL" value="1" /> <!-- if set to 1, always center the application SWF in the HTML page -->


    <!-- images group parameters -->
	<g:each in="${homeMainGalleryElementInstanceList}" status="i" var="homeMainGalleryElementInstance">
	<g:if test="${homeMainGalleryElementInstance?.active}">
	   	<object smallimage="${homeMainGalleryElementInstance?.element?.thumbnailUrl}" bigimage="${homeMainGalleryElementInstance?.element?.url}" title="${homeMainGalleryElementInstance?.element?.title}" url="${homeMainGalleryElementInstance?.targetUrl}" window="${homeMainGalleryElementInstance?.target}"><![CDATA[${homeMainGalleryElementInstance?.text}]]></object>
    </g:if>
    </g:each>

</menu>