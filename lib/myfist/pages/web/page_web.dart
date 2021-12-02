import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myflutterdemo/base/page_base.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatefulWidget {


  String title;

  String url;


  WebWidget(this.title, this.url);

  @override
  State<StatefulWidget> createState() {
    return WebWidgetState();
  }
}

class WebWidgetState extends BasePage<WebWidget> {

  var _controller ;

  @override
  void initState() {
    super.initState();
    showToast(widget.url);
  }

  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        break;
      case "share":

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /// 重写返回键
      onWillPop: () async {
        _controller.canGoBack().then((value) {
          if (value) {
            _controller.goBack();
          } else {
            return Navigator.pop(context);
          }
        });
        ///  返回true直接退出，返回false返回上一级，没有上一级直接退出
        return false;
      },
      child: Scaffold(
        appBar: AppBar(

          leading: IconButton(icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _controller.canGoBack().then((value) {
                if (value) {
                  _controller.goBack();
                } else {
                  return Navigator.pop(context);
                }
              });
            },
          ),
          title: Text(
            widget.title ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
                padding: const EdgeInsets.all(0.0),
                onSelected: _onPopSelected,
                icon: const Icon(Icons.add),
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      value: "browser",
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title:  Container(
                            alignment: Alignment.center,
                            child:  Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.language,
                                  color:Colors.grey,
                                  size: 22.0,
                                ),
                                Text(
                                  '浏览器打开',
                                )
                              ],
                            ),
                          ))),
                  PopupMenuItem<String>(
                      value: "share",
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title:  Container(
                            alignment: Alignment.center,
                            child:  Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.share,
                                  color:Colors.grey,
                                  size: 22.0,
                                ),
                                Text(
                                  '分享',
                                )
                              ],
                            ),
                          ))),
                ])
          ],
        ),
        body:  WebView(
            initialUrl: widget.url,

            ///JS执行模式 是否允许JS执行   unrestricted不受限制
            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (WebViewController webViewController) {
              _controller= webViewController;
            },

            navigationDelegate: (NavigationRequest request){
              print("navigationDelegate----------------");
              if(request.url.contains("volunteer-index")) {
                showToast("请去登录");
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },


            onProgress:(progress){
              if(progress>=100){
                dissmissLoading();
              }
              print("onProgress-----$progress");
            },

            onPageStarted: (url){
              showLoading();
            },
            onPageFinished: (url){
              print("onPageFinished-----$url");

              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  widget.title=result.toString().substring(1,result.toString().length-1);
                });
              });
            },

            gestureNavigationEnabled: true,

            javascriptChannels: <JavascriptChannel>{
              JavascriptChannel(
                  name: "gotoVolunteerCodeSignIn",
                  onMessageReceived: (JavascriptMessage message) {
                    showToast("打卡1"+message.message);
                  }
              ),
              JavascriptChannel(
                  name: "gotoVolunteerActivitySignIn",
                  onMessageReceived: (JavascriptMessage message) {
                    showToast("打卡1"+message.message);
                  }
              ),
            }

        ),
      ),
    );
  }


  @override
  void dispose(){
    super.dispose();
    _controller=null;
  }

}
