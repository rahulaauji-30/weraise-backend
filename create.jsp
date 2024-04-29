<%@ page import="jakarta.servlet.http.HttpServletResponse" %>

<html>

<head>
  <title>Search</title>
  <link rel="stylesheet" href="static/css/styles4.css" />
  <link rel="apple-touch-icon" sizes="180x180" href="static/favicon/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="static/favicon/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="static/favicon/favicon-16x16.png" />
  <link rel="manifest" href="static/favicon/site.webmanifest" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Lily+Script+One&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet" />
  <link
    href="https://fonts.googleapis.com/css2?family=Andika:ital,wght@0,400;0,700;1,400;1,700&family=Bree+Serif&display=swap"
    rel="stylesheet" />
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
        <a href="./h">Campaigns</a>
      </li>
      <li>
        <a href="about.html">About Us</a>
      </li>
      <li>
        <a href="dashboard.jsp">Dashboard</a>
      </li>
      <li>
        <% String username = (String) session.getAttribute("username");
                            if(username!=null){%>
                                <a href="">
                                  <img src="static/images/profile.png"
                                    style="border-radius: 50%;border: 2px solid lightgray;width50px;height:50px;" width="50px" height="50px" srcset="">
                                </a>
                            <%}else{%>
                                <a href="login.html" class="btn">Log In</a>
                                <%}%>
      </li>
    </ul>
  </nav>
  <h1 align="center">Campaign Details</h1>
    <div class="edits">
      <form action="./addcampaigns" method="post">
      <% if(session.getAttribute("id")!=null){%>
        <input type="hidden" name="userid" value="<%=session.getAttribute("id")%>">
      <%}else{
        response.sendRedirect("./login.html");
        }%>
        <div class="form-group">
          <label class="form-control-label" for="title">Campaign Title</label>
          <input class="form-control" id="title" name="title" required type="text" value="">
        </div>
        <div class="form-group"><label class="form-control-label" for="bio">Campaign Tag Line</label>
          <input class="form-control" id="bio" name="bio" required type="text" value="">
        </div>

        <div class="form-group"><label class="form-control-label" for="img">Campaign Image</label>
          <input class="form-control" id="img" name="imgurl" required type="url" value="">
        </div>
        <div class="form-group"><label class="form-control-label" for="vid">Video URL</label>
          <input class="form-control" id="vid" name="yturl" required type="url" value="">
        </div>
        <div class="form-group"><label class="form-control-label" for="story">Story behind raising
            amount</label>
          <textarea class="form-control" id="story" name="story" required></textarea>
        </div>
        <div class="form-group">
          <label class="form-control-label" for="category">Select Category</label>
          <select class="form-control" id="category" name="category">
            <option value="Tech and Innovation">Tech and Innovation</option>
            <option value="Creative Works">Creative Works</option>
            <option value="Community Projects">Community Projects</option>
          </select>
        </div>
        <div class="form-group"><label class="form-control-label" for="amount">Amount to be raised</label>
          <input class="form-control" id="amount" name="amount" required type="text" value="">
        </div>
        <div class="form-group"><label class="form-control-label" for="end">End Date</label>
          <input class="form-control" id="end" name="end" required type="date" value="">
        </div>
        <input class="btn btn-primary btn-md" id="submit" name="submit" type="submit" value="Publish">
      </form>
    </div>
  </div>
</body>

</html>