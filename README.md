
# greynoise

Query ‘GreyNoise Intelligence ’API’

## Description

Tools are provided to query the ‘GreyNoise Intelligence ’API’.

GreyNoise has a web site but there’s nothing there at the moment:
<http://greynoise.io/>

## What’s Inside The Tin

  - `gn_list_tags`: List GreyNoise Intelligence Tags
  - `gn_query_by_ip`: Query all tags associated with a given IP address
  - `gn_query_by_tag`: Query all IPs that have a given tag

The following functions are implemented:

## Installation

``` r
devtools::install_github("hrbrmstr/greynoise")
```

## Usage

``` r
library(greynoise)
library(tidyverse)

# current verison
packageVersion("greynoise")
```

    ## [1] '0.1.0'

### List tags

``` r
gn_list_tags()
```

    ##   [1] "VNC_SCANNER_HIGH"                  "PING_SCANNER_LOW"                  "COBALT_STRIKE_SCANNER_HIGH"       
    ##   [4] "JBOSS_WORM"                        "NETIS_ROUTER_ADMIN_SCANNER_LOW"    "GOOGLEBOT"                        
    ##   [7] "SNMP_SCANNER_LOW"                  "PYCURL_HTTP_CLIENT"                "ROUTER_RPC_SCANNER_HIGH"          
    ##  [10] "TELNET_SCANNER_HIGH"               "MONGODB_SCANNER_HIGH"              "WEB_SCANNER_HIGH"                 
    ##  [13] "NTP_SCANNER_LOW"                   "ZMAP_CLIENT"                       "DNS_SCANNER_HIGH"                 
    ##  [16] "HTTP_ALT_SCANNER_HIGH"             "PINGDOM"                           "COUNTERSTRIKE_SERVER_SCANNER_LOW" 
    ##  [19] "IPIP"                              "MSSQL_SCANNER_LOW"                 "TELNET_WORM_LOW"                  
    ##  [22] "FTP_SCANNER_HIGH"                  "SSH_WORM_HIGH"                     "CASSANDRA_SCANNER_LOW"            
    ##  [25] "SMB_SCANNER_HIGH"                  "RABBITMQ_SCANNER_LOW"              "COUNTERSTRIKE_SERVER_SCANNER_HIGH"
    ##  [28] "SIEMENS_PLC_SCANNER_HIGH"          "PROJECT_SONAR"                     "YANDEX_SEARCH_ENGINE"             
    ##  [31] "ROUTER_RPC_SCANNER_LOW"            "SSDP_UPNP_SCANNER_LOW"             "HTTP_ALT_SCANNER_LOW"             
    ##  [34] "TOR"                               "BITCOIN_NODE_SCANNER_LOW"          "DNS_SCANNER_LOW"                  
    ##  [37] "MINECRAFT_SCANNER_LOW"             "WinRM_SCANNER_LOW"                 "TFTP_SCANNER_LOW"                 
    ##  [40] "TELNET_WORM_HIGH"                  "PHPMYADMIN_WORM"                   "UNKNOWN_LINUX_WORM"               
    ##  [43] "SMB_SCANNER_LOW"                   "SOCKS_PROXY_SCANNER_LOW"           "MYSQL_SCANNER_HIGH"               
    ##  [46] "PRIVOXY_PROXY_SCANNER_HIGH"        "CGI_SCRIPT_SCANNER"                "MONGODB_SCANNER_LOW"              
    ##  [49] "MSSQL_SCANNER_HIGH"                "WEB_SCANNER_LOW"                   "MIRAI"                            
    ##  [52] "CPANEL_SCANNER_HIGH"               "SOCKS_PROXY_SCANNER_HIGH"          "IOT_MQTT_SCANNER_HIGH"            
    ##  [55] "WINRM_SCANNER_LOW"                 "ELASTICSEARCH_SCANNER_LOW"         "POSTGRES_SCANNER_LOW"             
    ##  [58] "ETHEREUM_NODE_SCANNER_LOW"         "MEMCACHED_SCANNER_HIGH"            "SNMP_SCANNER_HIGH"                
    ##  [61] "ETHEREUM_NODE_SCANNER_HIGH"        "STRETCHOID"                        "SSH_SCANNER_LOW"                  
    ##  [64] "GO_HTTP_CLIENT"                    "PDRLABS"                           "RDP_SCANNER_HIGH"                 
    ##  [67] "SSH_WORM_LOW"                      "SMTP_SCANNER_LOW"                  "ELASTICSEARCH_SCANNER_HIGH"       
    ##  [70] "DOCKERD_SCANNER_HIGH"              "SHODAN"                            "RDP_SCANNER_LOW"                  
    ##  [73] "GOOGLE_CLOUD"                      "BAIDU_SPIDER"                      "PRINTER_SCANNER_HIGH"             
    ##  [76] "JAVA_HTTP_CLIENT"                  "TFTP_SCANNER_HIGH"                 "OPEN_PROXY_SCANNER"               
    ##  [79] "VOIP_SCANNER_HIGH"                 "NETIS_ROUTER_ADMIN_SCANNER_HIGH"   "VOIP_SCANNER_LOW"                 
    ##  [82] "MINECRAFT_SCANNER_HIGH"            "COBALT_STRIKE_SCANNER_LOW"         "DOCKERD_SCANNER_LOW"              
    ##  [85] "TELNET_SCANNER_LOW"                "RESIDENTIAL"                       "SMTP_SCANNER_HIGH"                
    ##  [88] "EMBEDDED_DEVICE_WORM"              "SQUID_PROXY_SCANNER_LOW"           "SSDP_UPNP_SCANNER_HIGH"           
    ##  [91] "CASSANDRA_SCANNER_HIGH"            "WORDPRESS_WORM"                    "IOT_MQTT_SCANNER_LOW"             
    ##  [94] "NTP_SCANNER_HIGH"                  "SQUID_PROXY_SCANNER_HIGH"          "PRINTER_SCANNER_LOW"              
    ##  [97] "POSTGRES_SCANNER_HIGH"             "FTP_SCANNER_LOW"                   "MYSQL_SCANNER_LOW"                
    ## [100] "PING_SCANNER_HIGH"                 "BINARYEDGE"                        "REDIS_SCANNER_LOW"                
    ## [103] "SIEMENS_PLC_SCANNER_LOW"           "CENSYS"                            "PRIVOXY_PROXY_SCANNER_LOW"        
    ## [106] "SSH_SCANNER_HIGH"                  "JORGEE_HTTP_SCANNER"               "ELASTICSEARCH_SCANNER"            
    ## [109] "MEMCACHED_SCANNER_LOW"             "ZMEU_WORM"                         "BITCOIN_NODE_SCANNER_HIGH"        
    ## [112] "VNC_SCANNER_LOW"                   "PYTHON_REQUESTS_CLIENT"            "CPANEL_SCANNER_LOW"               
    ## [115] "WINRM_SCANNER_HIGH"                "MASSCAN_CLIENT"                    "REDIS_SCANNER_HIGH"               
    ## [118] "RABBITMQ_SCANNER_HIGH"

### Query by a specific tag

Let’s look for who scans for DNS endpoints

``` r
(dns <- gn_query_by_tag("DNS_SCANNER_HIGH"))
```

    ## # A tibble: 500 x 16
    ##                ip             name               first_seen             last_updated confidence intention category
    ##  *          <chr>            <chr>                    <chr>                    <chr>      <chr>     <chr>    <chr>
    ##  1  185.107.94.80 DNS_SCANNER_HIGH 2017-11-08T21:38:51.116Z 2017-11-13T12:35:30.422Z       high           activity
    ##  2    74.82.47.10 DNS_SCANNER_HIGH  2017-11-01T01:58:10.19Z 2017-11-13T12:35:30.422Z       high           activity
    ##  3 212.83.152.146 DNS_SCANNER_HIGH 2017-11-12T21:52:24.924Z 2017-11-13T12:35:28.052Z       high           activity
    ##  4    71.6.216.61 DNS_SCANNER_HIGH 2017-11-08T21:38:29.665Z 2017-11-13T12:35:28.052Z       high           activity
    ##  5    71.6.216.40 DNS_SCANNER_HIGH 2017-11-08T21:38:22.214Z 2017-11-13T12:35:28.052Z       high           activity
    ##  6 185.165.29.199 DNS_SCANNER_HIGH 2017-11-13T12:20:59.871Z 2017-11-13T12:35:28.052Z       high           activity
    ##  7  139.162.65.55 DNS_SCANNER_HIGH 2017-10-30T19:13:29.656Z 2017-11-13T12:35:28.052Z       high           activity
    ##  8    71.6.216.37 DNS_SCANNER_HIGH 2017-11-08T21:38:21.717Z 2017-11-13T12:35:28.052Z       high           activity
    ##  9  93.174.95.106 DNS_SCANNER_HIGH 2017-11-09T20:59:10.993Z 2017-11-13T12:35:28.052Z       high           activity
    ## 10  52.73.169.169 DNS_SCANNER_HIGH 2017-11-13T12:20:59.871Z 2017-11-13T12:35:28.052Z       high           activity
    ## # ... with 490 more rows, and 9 more variables: metadata.org <chr>, metadata.rdns <chr>, metadata.rdns_parent <chr>,
    ## #   metadata.datacenter <chr>, metadata.asn <chr>, metadata.os <chr>, metadata.link <chr>, metadata.tor <lgl>,
    ## #   tag <chr>

``` r
glimpse(dns)
```

    ## Observations: 500
    ## Variables: 16
    ## $ ip                   <chr> "185.107.94.80", "74.82.47.10", "212.83.152.146", "71.6.216.61", "71.6.216.40", "185.1...
    ## $ name                 <chr> "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_S...
    ## $ first_seen           <chr> "2017-11-08T21:38:51.116Z", "2017-11-01T01:58:10.19Z", "2017-11-12T21:52:24.924Z", "20...
    ## $ last_updated         <chr> "2017-11-13T12:35:30.422Z", "2017-11-13T12:35:30.422Z", "2017-11-13T12:35:28.052Z", "2...
    ## $ confidence           <chr> "high", "high", "high", "high", "high", "high", "high", "high", "high", "high", "high"...
    ## $ intention            <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""...
    ## $ category             <chr> "activity", "activity", "activity", "activity", "activity", "activity", "activity", "a...
    ## $ metadata.org         <chr> "NForce Entertainment B.V.", "Hurricane Electric, Inc.", "ONLINE S.A.S.", "CariNet, In...
    ## $ metadata.rdns        <chr> "", "scan-09b.shadowserver.org", "game2.consortium.so", "scanner2.labs.rapid7.com", "s...
    ## $ metadata.rdns_parent <chr> "", "shadowserver.org", "consortium.so", "rapid7.com", "rapid7.com", "", "ipip.net", "...
    ## $ metadata.datacenter  <chr> "", "Hurricane Electric", "Online.net Iliad", "cari.net", "cari.net", "", "", "cari.ne...
    ## $ metadata.asn         <chr> "AS43350", "AS6939", "AS12876", "AS10439", "AS10439", "AS44679", "AS63949", "AS10439",...
    ## $ metadata.os          <chr> "", "", "", "", "", "", "", "", "Linux 3.11+", "", "", "", "", "Linux 2.2-3.x", "", ""...
    ## $ metadata.link        <chr> "", "", "", "", "", "", "", "", "Ethernet or modem", "", "", "", "", "Ethernet or mode...
    ## $ metadata.tor         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FA...
    ## $ tag                  <chr> "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_S...

### Query by IP

We’ll use fie first 5 IP addresses found in the previous query results.

``` r
(what_else <- map_df(dns$ip[1:5], gn_query_by_ip))
```

    ## # A tibble: 154 x 15
    ##                      name               first_seen             last_updated confidence intention category
    ##                     <chr>                    <chr>                    <chr>      <chr>     <chr>    <chr>
    ##  1       WEB_SCANNER_HIGH 2017-11-12T12:11:28.644Z 2017-11-13T14:22:20.963Z       high           activity
    ##  2       DNS_SCANNER_HIGH 2017-11-08T21:38:51.116Z 2017-11-13T12:35:30.422Z       high           activity
    ##  3        DNS_SCANNER_LOW 2017-10-08T12:46:39.233Z 2017-10-11T11:48:00.053Z        low           activity
    ##  4 SSDP_UPNP_SCANNER_HIGH 2017-09-27T19:11:41.323Z 2017-10-01T15:54:16.701Z       high           activity
    ##  5      SNMP_SCANNER_HIGH 2017-09-29T09:32:22.024Z 2017-10-01T10:28:45.062Z       high           activity
    ##  6       NTP_SCANNER_HIGH 2017-09-29T08:11:55.385Z 2017-10-01T09:47:53.604Z       high           activity
    ##  7      TFTP_SCANNER_HIGH 2017-09-29T06:59:06.788Z 2017-10-01T07:25:08.617Z       high           activity
    ##  8       DNS_SCANNER_HIGH 2017-09-27T12:44:30.076Z 2017-10-01T06:42:03.647Z       high           activity
    ##  9       WEB_SCANNER_HIGH 2017-09-29T02:20:36.803Z 2017-10-01T01:30:43.166Z       high           activity
    ## 10       WEB_SCANNER_HIGH   2017-11-09T12:02:13.6Z 2017-11-13T14:22:50.273Z       high           activity
    ## # ... with 144 more rows, and 9 more variables: metadata.org <chr>, metadata.rdns <chr>, metadata.rdns_parent <chr>,
    ## #   metadata.datacenter <chr>, metadata.asn <chr>, metadata.os <chr>, metadata.link <chr>, metadata.tor <lgl>, ip <chr>

``` r
glimpse(what_else)
```

    ## Observations: 154
    ## Variables: 15
    ## $ name                 <chr> "WEB_SCANNER_HIGH", "DNS_SCANNER_HIGH", "DNS_SCANNER_LOW", "SSDP_UPNP_SCANNER_HIGH", "...
    ## $ first_seen           <chr> "2017-11-12T12:11:28.644Z", "2017-11-08T21:38:51.116Z", "2017-10-08T12:46:39.233Z", "2...
    ## $ last_updated         <chr> "2017-11-13T14:22:20.963Z", "2017-11-13T12:35:30.422Z", "2017-10-11T11:48:00.053Z", "2...
    ## $ confidence           <chr> "high", "high", "low", "high", "high", "high", "high", "high", "high", "high", "low", ...
    ## $ intention            <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""...
    ## $ category             <chr> "activity", "activity", "activity", "activity", "activity", "activity", "activity", "a...
    ## $ metadata.org         <chr> "NForce Entertainment B.V.", "NForce Entertainment B.V.", "NForce Entertainment B.V.",...
    ## $ metadata.rdns        <chr> "", "", "", "", "", "", "", "", "", "scan-09b.shadowserver.org", "scan-09b.shadowserve...
    ## $ metadata.rdns_parent <chr> "", "", "", "", "", "", "", "", "", "shadowserver.org", "shadowserver.org", "shadowser...
    ## $ metadata.datacenter  <chr> "", "", "", "", "", "", "", "", "", "Hurricane Electric", "Hurricane Electric", "Hurri...
    ## $ metadata.asn         <chr> "AS43350", "AS43350", "AS43350", "AS43350", "AS43350", "AS43350", "AS43350", "AS43350"...
    ## $ metadata.os          <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""...
    ## $ metadata.link        <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""...
    ## $ metadata.tor         <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FA...
    ## $ ip                   <chr> "185.107.94.80", "185.107.94.80", "185.107.94.80", "185.107.94.80", "185.107.94.80", "...
