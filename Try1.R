#GET" request to the API to pull raw data


http://api.thenmap.net/v2/us-4/data/2019-10-01?language=en&data_props=name|capital|is_in|etc...

<div id="map"></div>
  <script src="//drvkoaf101245.cloudfront.net/thenmap-2.0.0.min.js"></script>
    var settings = {
      dataKey: "",
      dataset: "us-4",
      date: "2019-10-01"
      language: "en",
      projection: "albersUsa",
      width:900,
      height:900
    };
    Thenmap.init("map", settings);
    r <- GET("http://api.thenmap.net/v2/us-4/geo/2019-10-01")
    r
    