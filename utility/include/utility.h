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
#include <time.h>
#include <stdio.h>
#include <ctime>

namespace laserdot
{
int PixelCounter(Mat img, int count)
{
	Mat img_nominal;
	img.convertTo(img_nominal, CV_32F);
	for(int i=0; i<img_nominal.rows; i++)
	{
		for(int j=0; j<img_nominal.cols; j++)
		{
			if(img_nominal.at<float>(i,j)<=0.0)
			{
				count++;
				//cout<<img_nominal.at<float>(i,j)<<endl;
			}
		}
	}
	return count;
}

int SizeAverage (int count, int size_avg, int size_array[], int center_total)
{
	for(int i=9; i>0; i--)
	{
		size_array[i] = size_array[i-1];
	}
	size_array[0] = count;

	int size_sum = 0;
	for(int i=0; i<10; i++)
	{
		size_sum = size_sum + size_array[i];
	}

	if(size_array[9]!=0 && center_total > 50)
	{
		size_avg = size_sum/10;
		return size_avg;
	}
}

//---------Draw the desired laser line
void MyLine( Mat img, Point start, Point end )
{
  int thickness = 2;
  int lineType = LINE_8;

  line( img, start, end, Scalar( 0, 0, 255 ), thickness, lineType );
}

//----------Use Canny to find the Canny edges of objects in image
//Canny edge is a good way to count non-zero pixel
int NonZero(Mat img, int count)
{
	Mat canny_edge, canny_edge_blur;
	Canny(img, canny_edge, 100, 200, 5, false);
	GaussianBlur( canny_edge, canny_edge_blur, Size(5, 5), 2, 2 );
	count = countNonZero(canny_edge_blur);
	return count;
}

//----------Print information in window
void HMI(Mat img, int size, int min_size, int non_zero, int nom_distance, int center_distance)
{
	std::string size_print = "No value";
	std::string min_size_print = "No value";
	std::string nom_distance_print = "No value";
	std::string center_distance_print = "No value";
	if(non_zero >20)		
	{
		size_print = std::to_string(size);
		min_size_print = std::to_string(min_size);
		nom_distance_print = std::to_string(nom_distance);
		center_distance_print = std::to_string(center_distance);
	}
	putText(img, "Laser Focus:", Point(10, 20), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Laser Dot Size: "+size_print, Point(10, 50), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Last Dot Size: "+min_size_print, Point(10, 80), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Laser Focus Status: ", Point(10, 120), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);

	putText(img, "Laser Dot Location:", Point(500, 20), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Nominal Distance: "+nom_distance_print, Point(500, 50), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Distance from Center: "+center_distance_print, Point(500, 80), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);
	putText(img, "Dot Location Status: ", Point(500, 120), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(255, 255, 255),2);

}

void GreenLight(Mat img, int last, int current, int nom_distance, int center_distance)
{
	if(last-current > 0 || abs(last-current) < 5)
	{
		circle( img, Point(300,110), 20, Scalar(0,255,0), -1, 8, 0 );
	}
	else
	{
		circle( img, Point(300,110), 20, Scalar(0,0,255), -1, 8, 0 );
	}

	if(nom_distance < 50 && center_distance < 50)
	{
		circle( img, Point(800,110), 20, Scalar(0,255,0), -1, 8, 0 );
	}
	else
	{
		circle( img, Point(800,110), 20, Scalar(0,0,255), -1, 8, 0 );
	}
}

int ClearList(vector<cv::Point> center_list, int center_total, int size_array[], int min)
{
	int last_min = min;
	cout<<"last min size: "<<last_min<<endl;
	fill_n(size_array,10,0);
	center_total = 0;
	fill(center_list.begin(), center_list.end(), Point(0,0));
	return last_min;
}

std::pair<double,double> DotToLine(Mat img, Point start, Point end, Point center)
{
	LineIterator laserline(img, start, end, 8);
	vector<Vec3b> buf(laserline.count);
	vector<double> distance_list;
	vector<cv::Point> point_list;
	for(int i = 0; i < laserline.count; i++, ++laserline)
	{
		point_list.push_back(laserline.pos());
		double distance = norm(center-laserline.pos());
		distance_list.push_back(distance);
	}
	double min_distance = *min_element(distance_list.begin(), distance_list.end());
	vector<double>::iterator result = min_element(distance_list.begin(), distance_list.end());
	int num = distance(distance_list.begin(), result);

	line( img, center, point_list[num], Scalar( 255, 255, 0 ), 1, 8 );
	// dotLine.nom_distance = min_distance;
	// dotLine.center_distance = norm(point_list[num]-point_list[(laserline.count)/2]);
	std::pair<double,double>dist(min_distance,norm(point_list[num]-point_list[(laserline.count)/2])) ;
	Point laserline_center = point_list[(laserline.count)/2];
	circle( img, laserline_center, 5, Scalar(0,0,255), -1, 8, 0 );
    return dist;

	// cout << "min point at: " << point_list[num] <<endl;
	// cout<<"center of line: "<<laserline_center<<endl;
	// cout<<"nominal_distance: "<<nom_distance<<endl;
	// cout<<"distance from line center: "<<center_distance<<endl;
}
}