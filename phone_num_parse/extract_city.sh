phone=$1
echo -n "$phone "
curl -s http://life.tenpay.com/cgi-bin/mobile/MobileQueryAttribution.cgi?chgmobile=$phone  | iconv -f gb2312 -t utf-8 | grep city | awk '{$0 = gensub(/<city>(.*)<\/city>/, "\\1", $0); print $0}'

