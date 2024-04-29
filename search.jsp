<html>
  <head>
    <title>Search</title>
    <link rel="stylesheet" href="static/css/style3.css" />
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
      <form action="">
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
    <div class="titles">
      <img
        src="static/images/hands-5216585_1920.jpg"
        width="100%"
        height="100%"
        alt=""
        srcset=""
      />
      <div class="title">
        <h1>Community Projects</h1>
        <p>Build a better Community</p>
      </div>
    </div>
    <div class="sidebar">
      <div class="fliters">
        <span>Filter Results</span>
        <div class="category">
          <span>Category</span>
          <div class="cate">
            <span>Community Projects</span>
            <svg
              width="15"
              height="10"
              viewBox="0 0 15 10"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M13.75 0L7.5 7.14286L1.25 0L0 1.42857L7.5 10L15 1.42857L13.75 0Z"
                fill="#008000"
              />
            </svg>
          </div>
          <div class="cate">
            <span>Creative Works</span>
            <svg
              width="15"
              height="10"
              viewBox="0 0 15 10"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M13.75 0L7.5 7.14286L1.25 0L0 1.42857L7.5 10L15 1.42857L13.75 0Z"
                fill="#008000"
              />
            </svg>
          </div>
          <div class="cate">
            <span>Tech & Innovation</span>
            <svg
              width="15"
              height="10"
              viewBox="0 0 15 10"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M13.75 0L7.5 7.14286L1.25 0L0 1.42857L7.5 10L15 1.42857L13.75 0Z"
                fill="#008000"
              />
            </svg>
          </div>
        </div>
      </div>
      <div class="column"></div>
      <div class="results">
        <div class="post">
            <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
            <div class="post-texts">
                <span>Funding</span>
                <h3>Gun Smith Child Care</h3>
                <p>We are raisng the fund for the children care and wellness.</p>
                <span>Health Care</span>
                <div class="progress-bar">
                    <div class="progress-text">
                        <span class="amount-raised">$250M</span>
                        <span class="percent-raised">100%</span>
                    </div>
                    <input type="range" name="bar" id="" min="0" max="100" value="10">
                </div>
            </div>
        </div>
        <div class="post">
            <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
            <div class="post-texts">
                <span>Funding</span>
                <h3>Gun Smith Child Care</h3>
                <p>We are raisng the fund for the children care and wellness.</p>
                <span>Health Care</span>
                <div class="progress-bar">
                    <div class="progress-text">
                        <span class="amount-raised">$250M</span>
                        <span class="percent-raised">100%</span>
                    </div>
                    <input type="range" name="bar" id="" min="0" max="100" value="10">
                </div>
            </div>
        </div>
        <div class="post">
            <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
            <div class="post-texts">
                <span>Funding</span>
                <h3>Gun Smith Child Care</h3>
                <p>We are raisng the fund for the children care and wellness.</p>
                <span>Health Care</span>
                <div class="progress-bar">
                    <div class="progress-text">
                        <span class="amount-raised">$250M</span>
                        <span class="percent-raised">100%</span>
                    </div>
                    <input type="range" name="bar" id="" min="0" max="100" value="10">
                </div>
            </div>
        </div>
        <div class="post">
            <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
            <div class="post-texts">
                <span>Funding</span>
                <h3>Gun Smith Child Care</h3>
                <p>We are raisng the fund for the children care and wellness.</p>
                <span>Health Care</span>
                <div class="progress-bar">
                    <div class="progress-text">
                        <span class="amount-raised">$250M</span>
                        <span class="percent-raised">100%</span>
                    </div>
                    <input type="range" name="bar" id="" min="0" max="100" value="10">
                </div>
            </div>
        </div>
        <div class="post">
            <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
            <div class="post-texts">
                <span>Funding</span>
                <h3>Gun Smith Child Care</h3>
                <p>We are raisng the fund for the children care and wellness.</p>
                <span>Health Care</span>
                <div class="progress-bar">
                    <div class="progress-text">
                        <span class="amount-raised">$250M</span>
                        <span class="percent-raised">100%</span>
                    </div>
                    <input type="range" name="bar" id="" min="0" max="100" value="10">
                </div>
            </div>
        </div>
      </div>
    </div>
  </body>
</html>
