<html>
  <head>
    <title>Page</title>
    <link rel="stylesheet" href="static/css/style2.css" />
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="static/favicon/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="static/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="static/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="static/favicon/site.webmanifest" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lily+Script+One&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Andika:ital,wght@0,400;0,700;1,400;1,700&family=Bree+Serif&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <nav>
      <div class="brand-logo">
        <a href="./">Weraise</a>
      </div>
      <form action="search.html">
        <input type="text" name="search" id="" />
        <button><img src="static/icons/search.png" alt="" srcset="" /></button>
      </form>
      <ul class="subnav">
        <li>
          <a href="search.html">Campaigns</a>
        </li>
        <li>
          <a href="about.html">About Us</a>
        </li>
        <li>
          <a href="create.jsp" class="btn">Start a campaign</a>
        </li>
        <li>
          <% String username = (String) session.getAttribute("username");
                            if(username!=null){%>
                                <a href="">
                                  <img src="static/images/jn1ofic3tc03wf0imsaoldejaado.jpeg"
                                    style="border-radius: 50%;border: 2px solid lightgray;width50px;height:50px;" width="50px" height="50px" srcset="">
                                </a>
                            <%}else{%>
                                <a href="login.html" class="btn">Log In</a>
                                <%}%>
        </li>
      </ul>
    </nav>

    <div class="post-detail" style=display:flex;flex-direction-row;justify-content:space-between;">
      <div>
      <div class="post-preview">
        <video width="100%" height="100%" controls src="static/videos/Just a Kid   UNICEF.mp4" poster="static/images/y4udqAY2Bqc-HD.jpg"></video>
      </div>
      <div class="detail">
      <div class="detail-description">
        <p>
          Morbi dictum ornare mauris. Vivamus ullamcorper felis sed nisi
          efficitur, non maximus libero scelerisque. Quisque a ex pharetra,
          venenatis risus ultrices, ornare justo. Mauris egestas posuere
          malesuada. Etiam cursus diam non nunc dapibus euismod. Sed id maximus
          sapien, non hendrerit turpis. Morbi a magna bibendum, laoreet velit
          nec, vehicula sapien. Curabitur sed magna tincidunt erat malesuada
          consequat.<br /><br />

          Proin imperdiet sem quam, eu pharetra neque luctus vel. Suspendisse
          varius commodo velit, ut venenatis enim laoreet suscipit. Duis sem
          libero, fermentum at vehicula sed, placerat maximus nisl. Morbi
          venenatis, velit eget luctus convallis, tellus mi ultrices sapien,
          vitae consectetur turpis lacus eu est. Pellentesque habitant morbi
          tristique senectus et netus et malesuada fames ac turpis egestas.
          Nullam vehicula tellus consequat, gravida metus at, facilisis arcu.
          Nullam pharetra et metus a hendrerit. Aliquam facilisis, ante id
          tristique porta, quam risus sagittis ante, sollicitudin vehicula
          libero quam id lacus. Ut sapien mi, pretium et interdum at, cursus et
          enim. Phasellus ultricies porttitor felis. Vestibulum ultrices neque
          vitae elit aliquet, in molestie dolor blandit.
        </p>
      </div></div>
        <div class="post-description">
        <span>Fundig</span>
        <h2>Just a Kid - Unicef</h2>
          <div>
            <form method="post">
              <div class="pay-arrange">
                <label for="cname">Card Holder Name</label>
                <input type="text" name="cname" id="cname">
              </div>
              <div class="pay-arrange">
                <label for="cno">Card Number</label>
                <input type="text" name="cname" id="cno">
              </div>
              <div class="pay-arrange">
                <label for="amount">Amount</label>
                <input type="text" name="cname" id="amount">
              </div>
              <div class="pay-arrange">
                <label for="pin">CVV Code</label>
                <input type="text" name="cname" id="pin">
              </div>
            </form>
          </div>
        </div>
      </div>
</div>
  </body>
</html>