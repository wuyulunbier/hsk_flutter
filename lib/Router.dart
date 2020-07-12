/*
 * @Author: your name
 * @Date: 2020-07-12 20:21:21
 * @LastEditTime: 2020-07-12 20:28:45
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/Router.dart
 */ 


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hsk_flutter/compoents/WebViewPage.dart';

class Router {

static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const playListPage = 'app://VideosPlayPage';
  static const searchPage = 'app://SearchPage';
  static const photoHero = 'app://PhotoHero';
  static const personDetailPage = 'app://PersonDetailPage';

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        // case detailPage:
        //   return DetailPage(params);
        // case homePage:
        //   return ContainerPage();
        // case playListPage:
        //   return VideoPlayPage(params);
        // case searchPage:
        //   return SearchPage(searchHintContent: params);
        // case photoHero:
        //   return PhotoHeroPage(
        //       photoUrl: params['photoUrl'], width: params['width']);
        // case personDetailPage:
        //   return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    }
    return null;
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }

  
}