import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utlis/navigator_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  WebPage(this.title, this.url);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 16.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.favorite),
          PopupMenuButton(
            onSelected: _onSelected,
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Home',
                    child: ListTile(
                        leading: Icon(Icons.open_in_browser),
                        title: Text('Home')),
                  ),
                  PopupMenuItem(
                    value: 'Love',
                    child: ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Home')),
                  ),
                ],
          )
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) {},
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _onSelected(String value) {
    switch (value) {
      case "Home":
        NavigatorUtils.launchURL(widget.url);
        break;
      case "collection":
        break;
      default:
        break;
    }
  }
}
