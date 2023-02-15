/*
	Assembly guidance tool
	Help people achieve a more accurate result 
	of laser focus, laser line alignment and camera focus.

*/

// Include files to use the pylon API.
#include <iostream>
#include <sstream>
#include <string>
#include <unistd.h>
#include <pylon/InstantCamera.h>
#include <pylon/PylonIncludes.h>
#include <GenApi/IEnumeration.h>
#include <pylon/EnumParameter.h>
#include <Base/GCString.h>
#include <opencv2/core/core.hpp>
#include <opencv2/core/utility.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <bits/stdc++.h>
#include <vector>
#include <opencv2/highgui/highgui.hpp>
#include "softwaretriggerconfiguration.h"
#include <time.h>
#include <stdio.h>
#include <ctime>

#ifdef PYLON_WIN_BUILD
#   include <pylon/PylonGUI.h>
#endif


// Namespace for using pylon objects.
using namespace Pylon;

// Namespace for using cout.
using namespace std;

// Namespace for CV objects
using namespace cv;

// Number of images to be grabbed.
static const uint32_t c_countOfImagesToGrab = 10;

// Limits the amount of cameras used for grabbing.
static const size_t c_maxCamerasToUse = 2;

//If camera features file is used
//const char Filename[] = "acA2440-75um_23663771.pfs";
using namespace GENAPI_NAMESPACE;

char window_name[] = "Laser Dot Finder";


int main(int argc, char* argv[])
{
    // The exit code of the sample application.
     int exitCode = 0;
     // Before using any pylon methods, the pylon runtime must be initialized.
     PylonInitialize();

     const char *err;
   
	try
	{		
		CDeviceInfo info0, info1;
		info0.SetSerialNumber("40113772"); //cam1, right
		//info1.SetSerialNumber("40172226"); //cam2, left
		

	    CInstantCamera camera0( CTlFactory::GetInstance().CreateDevice(info0));	

			
		camera0.RegisterConfiguration(new CSoftwareTriggerConfiguration,RegistrationMode_ReplaceAll, Cleanup_Delete);

		//Create a pylon image that will be used to create an opencv image
		CPylonImage pylonImage0, pylonImage1;

		Mat src, lft1_img, rgt0_img, rgt1_img, cam_frame_temp0, cam_frame_temp1;
		
		camera0.Open();
		
		Point max_point;
		Mat canny_edge, img_grey;

		// If camera features file is used
		//CFeaturePersistence::Load( Filename, &cameras[0].GetNodeMap(), true ); 

		
		// These allow us to convert from GrabResultPtr_t to cv::Mat
		CImageFormatConverter formatConverter;
		formatConverter.OutputPixelFormat = PixelType_BGR8packed;

        int min_radius = 100;
	 	int radius = 0;
		int radius_array[10] = {0};
		while(1)
		{
			int max_imgs0 = 50;   
			int imgs_taken0 =0;
			
			INodeMap& nodemap0 = camera0.GetNodeMap();

			CEnumerationPtr(nodemap0.GetNode("ExposureMode"))->FromString("Timed"); 
			CFloatPtr(nodemap0.GetNode("ExposureTime"))->SetValue(200.0);
						
			//double d = CFloatParameter(nodemap0, "SensorReadoutTime").GetValue();
			//cout << "readout   "  << d <<endl;

			CEnumParameter(nodemap0, "LineSelector").SetValue("Line3");
			CEnumParameter(nodemap0, "LineMode").SetValue("Output");
			CEnumParameter(nodemap0, "LineSource").SetValue("UserOutput2");

			CEnumParameter(nodemap0, "LineSelector").SetValue("Line4");
			CEnumParameter(nodemap0, "LineMode").SetValue("Output");
			CEnumParameter(nodemap0, "LineSource").SetValue("UserOutput3");

			CEnumParameter(nodemap0, "LineSelector").SetValue("Line3");
			CBooleanParameter(nodemap0, "LineInverter").SetValue(false);

			CEnumParameter(nodemap0, "LineSelector").SetValue("Line4");			
			CBooleanParameter(nodemap0, "LineInverter").SetValue(false);
			
			CEnumParameter(nodemap0, "LineSelector").SetValue("Line2");
			CEnumParameter(nodemap0, "LineSource").SetValue("ExposureActive");
			
			camera0.StartGrabbing(max_imgs0*1);

			while (imgs_taken0< max_imgs0) 
			{	

				CGrabResultPtr ptrGrabResult0;
				CGrabResultPtr ptrGrabResult1;
		
	         //----------Triggering laser and capturing image continously-----------------------------------------
				CEnumParameter(nodemap0, "LineSelector").SetValue("Line3");			
				CBooleanParameter(nodemap0, "LineInverter").SetValue(true);
				CEnumParameter(nodemap0, "LineSelector").SetValue("Line4");			
				CBooleanParameter(nodemap0, "LineInverter").SetValue(true);
					
				sleep(0.1);

				while(camera0.WaitForFrameTriggerReady(1000,TimeoutHandling_ThrowException)==0);			
				CCommandParameter(nodemap0, "TriggerSoftware").Execute();
				
				bool test0 = camera0.RetrieveResult(1000, ptrGrabResult0, TimeoutHandling_ThrowException);

				formatConverter.Convert(pylonImage0, ptrGrabResult0);
				
				cam_frame_temp0 = Mat(ptrGrabResult0->GetHeight(), ptrGrabResult0->GetWidth(), CV_8UC3, (uint8_t *) pylonImage0.GetBuffer());

				src = cam_frame_temp0.clone();

				cvtColor(src, img_grey, COLOR_BGR2GRAY);
				
	         //----------Use minMaxLoc to find the pixel which has the highest value
				/*GaussianBlur(src,src, Size(3, 3), 0, 0, BORDER_DEFAULT);
				double max_value;
				minMaxLoc(img_grey, 0, &max_value, 0, &max_point);
				cout<<max_point<<endl;
				cout<<max_value<<endl;
				int x_max = minMaxLoc(src)[3][0];
				int y_max = minMaxLoc(src)[3][1];
				Draw a circle around the max point
				circle( src, max_point,5, Scalar( 0, 0, 255 ),1,LINE_8 );*/

	         //----------Sobel edges
				/*Mat src_x, src_y;
				Mat abs_src_x, abs_src_y;
				Mat dst;
				Sobel edges
				Sobel(src, src_x, CV_64F, 2, 0, 5);
				Sobel(src, src_y, CV_64F, 0, 2, 5);
				convertScaleAbs(src_x, abs_src_x);
				convertScaleAbs(src_y, abs_src_y);
				addWeighted(abs_src_x, 0.5, abs_src_y, 0.5, 0, dst);*/			

	         //----------Use Canny to find the Canny edges of objects in image
				Canny(img_grey, canny_edge, 300, 320, 3, false);
				//GaussianBlur is very useful for finding contour
				GaussianBlur( canny_edge, canny_edge, Size(5, 5), 2, 2 );

	         //----------Find all contours in an image
				std::vector<std::vector<cv::Point>> contours; // vector of vector of points
				std::vector<cv::Vec4i> hierarchy;
				findContours(canny_edge,contours,hierarchy,cv::RETR_EXTERNAL,cv::CHAIN_APPROX_SIMPLE);
				//findContours(canny_edge,contours,hierarchy,cv::RETR_EXTERNAL,cv::CHAIN_APPROX_SIMPLE);
				//cout<<contours[0]<<endl;

			 //----------Draw contours on an empty image
				Mat mask = cv::Mat::zeros({img_grey.size()},CV_8UC3); // Create an empty Mat
				Mat mask_grey;
				for (int i=0; i < contours.size(); i++)
				{	
					//if(contours[i].size() > 15)
					{drawContours(mask,contours, i ,cv::Scalar(0,255,255),1);}
				}
			 //----------Find all circles on contours image, and output center and radious as feedback
				vector<Vec3f> circles;
				// Mat mask_canny = canny_edge.clone();
				// cvtColor(mask_canny,mask_grey, COLOR_BGR2GRAY);
				cvtColor(mask,mask_grey, COLOR_BGR2GRAY);
				int non_zero = countNonZero(mask_grey);
				//cout<<non_zero<<endl;
				// make the distance of the centers of circles extremely large to make sure only one circle will be detected
				HoughCircles(mask_grey, circles, HOUGH_GRADIENT,2, 1000,500,20,0,30);
				int circle_array[10];
				std::fill_n (circle_array, 10, cvRound(circles[0][2]));
				for (int i=0; i<10; i++)
				{cout<<circle_array[i]<<endl;}		
				//Draw all the circles found by HoughCircles
				Mat circle_area = cv::Mat::zeros({mask_grey.size()},CV_8UC3);
				if(non_zero != 0)
				{
					size_t i = 0;
					//for( size_t i = 0; i < circles.size(); i++ )
					//{
					Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
					radius = cvRound(circles[i][2]);
					

					sleep(0.1);
					cout<<"Circle center: "<<center<<" Circle radius: "<<radius<<endl;

					// draw the circle center
					circle( mask, center, 3, Scalar(0,255,0), -1, 8, 0 );
					circle( circle_area, center, 3, Scalar(0,255,0), -1, 8, 0 );
					// draw the circle outline
					circle( mask, center, radius, Scalar(0,0,255), 2, 8, 0 );
					circle( circle_area, center, radius, Scalar(0,0,255), 2, 8, 0 );
					//}
				}
				
				for(int i=9; i>0; i--)
				{
					radius_array[i] = radius_array[i-1];
				}
				radius_array[0] = radius;
				sleep(0.1);

				int radius_sum = 0;
				for(int i=0; i<10; i++)
				{
					radius_sum = radius_sum + radius_array[i];
				}
				int radius_avg = radius_sum/10;
				//cout << radius_avg << endl;

				sleep(0.1);
				if(radius_avg < min_radius && (min_radius-radius_avg <=2 || min_radius-radius > 50) && radius_array[9]>0)
				{
					min_radius = radius_avg;
				}

			 //----------Use minEnclosingCircle to detect area enclosed by a circle
				/*std::vector<Point>points(canny_edge.begin<Point>(), canny_edge.end<Point>());
				Point2f center;
				float radius = 0;
				minEnclosingCircle(circles[0], center, radius);
				cout<< center << endl;
				cout<< radius << endl;*/

			 //----------Print radius of the circle on image	
				std::string radius_print = "No value";
				std::string min_radius_print = "No value";
				if(non_zero != 0)		
				{
					radius_print = std::to_string(radius_avg);
					min_radius_print = std::to_string(min_radius);	
				}
				putText(mask, "Laser focus tool", Point(10, 20), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
				putText(mask, "Radius : "+radius_print, Point(10, 50), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
				putText(mask, "Min Radius : "+min_radius_print, Point(10, 80), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
				putText(mask, "Status : ", Point(10, 120), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
				
				if(radius_avg-min_radius <= 1)
				{
					circle( mask, Point(120,110), 20, Scalar(0,255,0), -1, 8, 0 );
				}
				else
				{
					circle( mask, Point(120,110), 20, Scalar(0,0,255), -1, 8, 0 );
				}			 //----------Show each image in specific window
				imshow(window_name, src);
				//imshow("Canny Edge", canny_edge);
				imshow("Contours",mask);
				//imshow("Circle Area",circle_area);
				//imshow("Sobel Edge", dst);
				waitKey( 10 );			
				sleep(0.1);  // Change the sleep to slower down the grab speed three more 
					
				// while(camera0.WaitForFrameTriggerReady(1000,TimeoutHandling_ThrowException)==0);			
				// CCommandParameter(nodemap0, "TriggerSoftware").Execute();
				
				// test0 = camera0.RetrieveResult(1000, ptrGrabResult1, TimeoutHandling_ThrowException);	

				imgs_taken0++;
			
			}
		}

	}

	catch (const GenericException &e)
	{
		// Error handling
		cerr << "An exception occurred." << endl
		<< e.GetDescription() << endl;
		exitCode = 1;
		
	}
	
	PylonTerminate();
   	return exitCode;
   
}