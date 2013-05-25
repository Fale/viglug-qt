import QtQuick 2.0
import QtWebKit 3.0

Rectangle {
    width: 360
    height: 360
    WebView {
        id: webview
        url: "http://frafra.mooo.com:8000/mobile/topic/"
        width: parent.width
        height: parent.height
        onNavigationRequested: {
            // detect URL scheme prefix, most likely an external link
            var schemaRE = /^\w+:/;
            if (schemaRE.test(request.url)) {
                request.action = WebView.AcceptRequest;
            } else {
                request.action = WebView.IgnoreRequest;
                // delegate request.url here
            }
        }
    }
}
