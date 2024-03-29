//
//  Constants.swift
//  NYNewsApp
//
//  Created by Manpreet Kaur on 19/06/19.
//  Copyright © 2019 Manpreet Kaur. All rights reserved.
//
import Foundation
import UIKit

//API response keys
let kServerDataJSONKeyTitle:String  = "title"
let kServerDataJSONKeyByLine:String  = "byline"
let kServerDataJSONKeyPublishedDate:String  = "published_date"
let kServerDataJSONKeyMedia:String  = "media"
let kServerDataJSONKeyResult:String  = "results"
let kServerDataJSONKeyAbstract:String  = "abstract"
let kServerDataJSONKeyMediaMetaData:String  = "media-metadata"
let kServerDataJSONKeyImageURL:String  = "url"
//54e5496eb75443aea29abca3eda6dbf6
// API URLS
let APIKey = "gU6WrAg91HfGlqyUDAWo0N4lp0NF6z3p"
let kAPIPeriods:Int = 7
let kAPISections = "all-sections"
let API_BASE_URL: String = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
let NEWS_API_URL = API_BASE_URL + "/\(kAPISections)" + "/\(kAPIPeriods)" + ".json?api-key=\(APIKey)"

//Storyboard ID's
let kArticleCellID = "ArticleCellID"
let kNewDetailSegue = "newsDetailsSegue"


// Color constants
let kPrimaryTextColor = UIColor.darkGray
let kSecondryTextColor = UIColor.darkGray
let kPrimaryBackGroundColor = UIColor.lightGray

//String constants
let kNewsTitleString = "NY Times Most Popular"
let kOkButtonTitle = "OK"
let kNoNetworkErrorMessgae = "Internet is not availble. please check your internet setting and try again."
let kNetworkErrorMessgae = "Network error occurred!. Please check your internet and try again."
let kAPIParseErrorMessgae = "An error occurred while processing response!. Please check your internet setting and try again later"
