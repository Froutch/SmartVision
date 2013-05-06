#include "static_content.hh"
#include <string>
using namespace std;
extern "C" {
extern char _binary_anyterm_html_start[];
extern char _binary_anyterm_html_end[];
extern char _binary_anyterm_js_start[];
extern char _binary_anyterm_js_end[];
extern char _binary_anyterm_css_start[];
extern char _binary_anyterm_css_end[];
extern char _binary_copy_png_start[];
extern char _binary_copy_png_end[];
extern char _binary_paste_png_start[];
extern char _binary_paste_png_end[];
extern char _binary_copy_gif_start[];
extern char _binary_copy_gif_end[];
extern char _binary_paste_gif_start[];
extern char _binary_paste_gif_end[];
};
bool get_static_content(string fn, string& mime_type, string& body) {
  if (fn=="/anyterm.html") {
    mime_type="text/html";
    body=string(_binary_anyterm_html_start,  _binary_anyterm_html_end);
    return true;
  };
  if (fn=="/anyterm.js") {
    mime_type="application/javascript";
    body=string(_binary_anyterm_js_start,  _binary_anyterm_js_end);
    return true;
  };
  if (fn=="/anyterm.css") {
    mime_type="text/css";
    body=string(_binary_anyterm_css_start,  _binary_anyterm_css_end);
    return true;
  };
  if (fn=="/copy.png") {
    mime_type="image/png";
    body=string(_binary_copy_png_start,  _binary_copy_png_end);
    return true;
  };
  if (fn=="/paste.png") {
    mime_type="image/png";
    body=string(_binary_paste_png_start,  _binary_paste_png_end);
    return true;
  };
  if (fn=="/copy.gif") {
    mime_type="image/gif";
    body=string(_binary_copy_gif_start,  _binary_copy_gif_end);
    return true;
  };
  if (fn=="/paste.gif") {
    mime_type="image/gif";
    body=string(_binary_paste_gif_start,  _binary_paste_gif_end);
    return true;
  };
  return false;
}
