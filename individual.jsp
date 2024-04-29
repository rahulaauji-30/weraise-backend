<%@ page import="java.util.*" %>
<%@ page import="database.Campaign" %>
<%@ page import="database.User" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
    <html>
    <head>
      <title>Page</title>
      <link rel="stylesheet" href="static/css/style2.css" />
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
          <a href="./h">Weraise</a>
        </div>
        <form action="./search" method="post" class="search">
                    <input type="text" name="search"/>
                    <button type="submit"><img src="static/icons/search.png"></button>
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
            <% String username=(String) session.getAttribute("username"); if(username!=null){%>
              <a href="">
                <img src="static/images/profile.png"
                  style="border-radius: 50%;border: 2px solid lightgray;width50px;height:50px;" width="50px"
                  height="50px" srcset="">
              </a>
              <%}else{%>
                <a href="login.html" class="btn">Log In</a>
                <%}%>
          </li>
        </ul>
      </nav>

      <% List<Campaign> campaigns = (List<Campaign>) request.getAttribute("campaigns");
         List<User> users  = (List<User>) request.getAttribute("users");
          if(campaigns!=null){
          for(Campaign campaign:campaigns){
            if(campaign.getId() == (Integer) request.getAttribute("cid")){%>
            <div class="post-detail" style="justify-content:center;">
            <div class="post-preview" style="margin-top:50px;">
              <iframe width="560" height="315" src="<%= campaign.getYturl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
            <div class="post-description">
              <span>Fundig</span>
              <h2><%=campaign.getTitle()%></h2>
              <p>
                <%=campaign.getBio()%>
              </p>
              <div class="profile">
                <%if(users != null){
                    for(User user:users){
                        if(campaign.getUserId() == user.getId()){%>
                        <img src="<%=campaign.getImgurl()%>" alt="" width="70px" height="70px" />
                        <div class="texted-detail">
                          <b><%=user.getName()%></b>
                          <span><%=user.getLocation()%></span>
                        </div>
                    <%}
                    }
                   }
                   %>
              </div>
              <div class="raise-detail">
                <span>$<%=campaign.getAmountRaised()%></span>
                <span>100 Backers</span>
              </div>
              <input type="range" name="" id="" />
              <%
                float amnt = campaign.getAmount();
                float ramnt = campaign.getAmountRaised();
                float pamnt = (ramnt/amnt)*100;
              %>
              <div class="raise-detail">
                <span><%=pamnt%>% of $<%=amnt%></span>
                <span>10 Days left</span>
              </div>
              <div class="end-description">
                <form method="post" action="./donate.jsp">
                <input type="hidden" name="pid" value="<%=campaign.getId()%>">
                <input type="hidden" name="title" value="<%=campaign.getTitle()%>">
                <input type="hidden" name="bio" value="<%=campaign.getBio()%>">
                <input type="hidden" name="story" value="<%=campaign.getStory()%>">
                <input type="hidden" name="yturl" value="<%=campaign.getYturl()%>">
                <input type="submit" id="donate"value="Donate">
                </form>
                <div class="icons">
                  <svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M41.6667 20.8333C41.6667 9.33333 32.3333 0 20.8333 0C9.33333 0 0 9.33333 0 20.8333C0 30.9167 7.16667 39.3125 16.6667 41.25V27.0833H12.5V20.8333H16.6667V15.625C16.6667 11.6042 19.9375 8.33333 23.9583 8.33333H29.1667V14.5833H25C23.8542 14.5833 22.9167 15.5208 22.9167 16.6667V20.8333H29.1667V27.0833H22.9167V41.5625C33.4375 40.5208 41.6667 31.6458 41.6667 20.8333Z"
                      fill="#008000" />
                  </svg>
                  <svg width="44" height="36" viewBox="0 0 44 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M43.7916 4.50001C42.1874 5.22918 40.4582 5.70834 38.6666 5.93751C40.4999 4.83334 41.9166 3.08334 42.5833 0.979177C40.8541 2.02084 38.9374 2.75001 36.9166 3.16668C35.2707 1.37501 32.9583 0.333344 30.3333 0.333344C25.4374 0.333344 21.4374 4.33334 21.4374 9.27084C21.4374 9.97918 21.5208 10.6667 21.6666 11.3125C14.2499 10.9375 7.64575 7.37501 3.24992 1.97918C2.47909 3.29168 2.04159 4.83334 2.04159 6.45834C2.04159 9.56251 3.60409 12.3125 6.02075 13.875C4.54159 13.875 3.16659 13.4583 1.95825 12.8333V12.8958C1.95825 17.2292 5.04159 20.8542 9.12492 21.6667C7.81393 22.0254 6.43762 22.0754 5.10409 21.8125C5.66993 23.5885 6.77812 25.1425 8.27287 26.2561C9.76762 27.3697 11.5738 27.9869 13.4374 28.0208C10.2783 30.5218 6.36241 31.8736 2.33325 31.8542C1.62492 31.8542 0.916585 31.8125 0.208252 31.7292C4.16659 34.2708 8.87492 35.75 13.9166 35.75C30.3333 35.75 39.3541 22.125 39.3541 10.3125C39.3541 9.91668 39.3541 9.54168 39.3332 9.14584C41.0832 7.89584 42.5832 6.31251 43.7916 4.50001Z"
                      fill="#008000" />
                  </svg>

                  <svg width="38" height="7" viewBox="0 0 38 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M3.125 0C1.40625 0 0 1.40625 0 3.125C0 4.84375 1.40625 6.25 3.125 6.25C4.84375 6.25 6.25 4.84375 6.25 3.125C6.25 1.40625 4.84375 0 3.125 0ZM34.375 0C32.6562 0 31.25 1.40625 31.25 3.125C31.25 4.84375 32.6562 6.25 34.375 6.25C36.0938 6.25 37.5 4.84375 37.5 3.125C37.5 1.40625 36.0938 0 34.375 0ZM18.75 0C17.0312 0 15.625 1.40625 15.625 3.125C15.625 4.84375 17.0312 6.25 18.75 6.25C20.4688 6.25 21.875 4.84375 21.875 3.125C21.875 1.40625 20.4688 0 18.75 0Z"
                      fill="#008000" />
                  </svg>
                </div>
              </div>
            </div>
          </div>
          <hr />
          <div class="detail">
              <div class="sub-menu">
                <a href="" class="active">Story</a>
              </div>
              <div style="display: flex;justify-content: space-between;">
              <div class="detail-description">
                <p>
                  <%=campaign.getStory()%>
                </p>
              </div>
            <% }
            }
            }%>
            <div class="ads">
              <div class="ad1">
                <img src="static/images/fold5_ooh_iris_x_samsung-1.webp" alt="" />
              </div>
              <div class="ad1">
                <img src="static/images/greatestprintads_cocacola.jpg" alt="" />
              </div>
            </div>
            </div>
          </div>
          <div class="postss">
            <div class="posts">
              <%if(campaigns!=null){
                for(Campaign campaign:campaigns){
                    if(campaign.getId() != (Integer) request.getAttribute("cid")){%>
                        <div class="post">
                        <img src="<%=campaign.getImgurl()%>" alt="">
                        <div class="post-texts">
                            <span>Funding</span>
                            <h3><%=campaign.getTitle()%></h3>
                            <p><%=campaign.getBio()%></p>
                            <span><%=campaign.getCategory()%></span>
                            <div class="progress-bar">
                                <div class="progress-text">
                                    <span class="amount-raised">$<%=campaign.getAmountRaised()%></span>
                                    <%
                                        float amnt = campaign.getAmount();
                                        float ramnt = campaign.getAmountRaised();
                                        float pamnt = (ramnt / amnt)*100;
                                    %>
                                    <span class="percent-raised"><%= pamnt %>%</span>
                                </div>
                                <input type="range" name="bar" id="" min="0" max="100" value="<%=pamnt%>">
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
                }
            }%>
            <div class="navigations">
              <button>
                <svg width="26" height="45" viewBox="0 0 26 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M0 22.5L22.5 45L26 41.25L7.5 22.5L26 3.75L22.5 0L0 22.5Z" fill="#008000" />
                </svg>
              </button>
              <button>
                <svg width="26" height="45" viewBox="0 0 26 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M3.5 0L0 3.75L18.5 22.5L0 41.25L3.5 45L26 22.5L3.5 0Z" fill="#008000" />
                </svg>
              </button>
            </div>
          </div>
    </body>

    </html>