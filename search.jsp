<%@ page import="database.Campaign"%>
<%@ page import="java.util.*"%>

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


      <div class="results">
      <% List<Campaign> campaigns = (List<Campaign>) request.getAttribute("campaigns");
        if(campaigns!=null){
            for(Campaign campaign:campaigns){%>
             <div class="post">
                <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
                <div class="post-texts">
                    <span>Funding</span>
                    <h3><%=campaign.getTitle() %></h3>
                    <p><%=campaign.getBio()%></p>
                    <span><%= campaign.getCategory()%></span>
                    <div class="progress-bar">
                        <div class="progress-text">
                        <%float ramnt = campaign.getAmountRaised();
                                float amnt = campaign.getAmount(); // Assuming this is what you meant
                                float pamnt = (ramnt / amnt)*100;
                                pamnt = (float) Math.round(pamnt * 10) / 10;

                                float amntr = ramnt; // Declare amntr and initialize with ramnt
                                amntr = (float) Math.round(amntr * 10) / 10;
                                %>
                            <span class="amount-raised">$<%=campaign.getAmountRaised()%></span>
                            <span class="percent-raised"><%=pamnt%>%</span>
                        </div>
                        <input type="range" name="bar" id="" min="0" max="100" value="10">
                    </div>
                    <div class="read-more" style="text-align: center;margin-top: 10px;">
                                <form method="post" action="./post">
                                <input type="hidden" value="<%=campaign.getId()%>" name="id">
                                <input type="submit" style="background-color:green;width:100%;color:white;border-radius: 5px;padding: 5px;" value="See Campaign" >
                                </form>
                           </div>
                </div>
            </div>
        <%}
        }else{%>
            <h1>No result found!</h1>
         <%}%>
      </div>
    </div>
  </body>
</html>
