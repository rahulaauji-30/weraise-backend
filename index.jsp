<%@ page import="java.util.List" %>
<%@ page import="database.Campaign" %>
<html>
  <head>
    <title>Weraise</title>
    <link rel="stylesheet" href="static/css/style.css" />
    <link rel="apple-touch-icon" sizes="180x180" href="static/favicon/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="static/favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="static/favicon/favicon-16x16.png" />
    <link rel="manifest" href="static/favicon/site.webmanifest" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lily+Script+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Andika:ital,wght@0,400;0,700;1,400;1,700&family=Bree+Serif&display=swap" rel="stylesheet">
</head>
  <body>
    <div class="carousel">
        <nav>
            <div class="brand-logo">
                <a href="./">Weraise</a>
            </div>
                <form action="search.html">
                    <input type="text" name="search"/>
                    <button><img src="static/icons/search.png" alt="" srcset=""></button>
                </form>
                <ul class="subnav">
                    <li>
                        <a href="search.html">Campaigns</a>
                    </li>
                    <li>
                        <a href="about.html">About Us</a>
                    </li>
                    <li>
                        <form action="./authenticate" method="POST">
                            <input type="hidden" name="value" value="create">
                            <button type="submit" class="btn">Start a campaign</button>
                        </form>
                    </li>

                    <li>
                        <a href="login.html" class="btn">Log In</a>
                    </li>
                </ul>
        </nav>
        <img src="static/images/y4udqAY2Bqc-HD.jpg" id="carousel" alt="" srcset="">
        <div class="carousel-nav">
            <button onclick="pre()">
                <svg width="17" height="28" viewBox="0 0 17 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0.552246 13.697L13.9851 27.3333L16.0746 25.0606L5.02986 13.697L16.0746 2.33334L13.9851 0.0606079L0.552246 13.697Z" fill="#008000"/>
                    </svg>
            </button>
            <button onclick="next()">
                <svg width="16" height="28" viewBox="0 0 16 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M2.20894 0.0606079L0.119385 2.33334L11.1642 13.697L0.119385 25.0606L2.20894 27.3333L15.6418 13.697L2.20894 0.0606079Z" fill="#008000"/>
                    </svg>
            </button>
        </div>
        <div class="texts">
            <h1>Support Child Rights</h1>
            <a href="./post/4">See Campaign</a>
        </div>
    </div>
    <div class="postss">
        <div class="posts">
            <%
            List<Campaign> campaigns = (List<Campaign>) request.getAttribute("campaigns");
            System.out.println("Campaigns list received:");
            if(campaigns!=null){
                for(Campaign campaign:campaigns){%>
                    <div class="post">
                        <img src="static/images/Gemini_Generated_Image (1).jpeg" alt="">
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
                        </div>
                    </div>
                <%}
            }%>
        </div>
        <div class="navigations">
            <button><svg width="26" height="45" viewBox="0 0 26 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 22.5L22.5 45L26 41.25L7.5 22.5L26 3.75L22.5 0L0 22.5Z" fill="#008000"/>
                </svg>
                </button>
            <button>
                <svg width="26" height="45" viewBox="0 0 26 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3.5 0L0 3.75L18.5 22.5L0 41.25L3.5 45L26 22.5L3.5 0Z" fill="#008000"/>
                    </svg>
            </button>
        </div>
    </div>
    <div class="category-big">
        <div class="category">
            <img src="static/images/Fun.jpeg" alt="">
            <a href="" style="left: 30%;">Fun & Games</a>
        </div>
        <div class="category">
            <img src="static/images/Urban Farming.jpeg" alt="">
            <a href="" style="left: 30%;">Urban Farming</a>
        </div>
        <div class="category">
            <img src="static/images/Green.jpeg" alt="">
            <a href="">Green Tech Innovations</a>
        </div>
        <div class="category">
            <img src="static/images/Mental.jpeg" alt="">
            <a href="" >Mental Health Solutions</a>
        </div>
    </div>
    <div class="bottom-design">
        <div class="text">
            <p style="left: 2%;top: 6%;">Be the part of the fundraiser with over</p>
            <span>217,506+</span>
            <p style="left: 10%;bottom: -8%;">People from arround the wolrd</p>
        </div>
        <div class="btns">
            <button id="Sign">Sign Up</button>
            <button id="learn" >Learn more</button>
        </div>
        <img style="position: absolute;left: 3%;top: 0; border-radius: 10px;" width="20%" height="45%" src="static/images/pexels-mohamed-abdelghaffar-764340.jpg" alt="">
        <img style="position: absolute;left: 15%;bottom:2% ; border-radius: 10px;" width="20%" height="30%" src="static/images/pexels-bruna-saito-1805843.jpg" alt="">
        <img style="position: absolute;left: 24%;top: 13%; border-radius: 10px;" width="8%" height="15%" src="static/images/pexels-lina-kivaka-1741205.jpg" alt="">
        <img style="position: absolute;right: 3%;bottom: 0; border-radius: 10px;" width="20%" height="45%" src="static/images/pexels-rebecca-zaal-764681.jpg" alt="">
        <img style="position: absolute;right: 13%;top:3%; border-radius: 10px;" width="20%" height="30%" src="static/images/pexels-maksim-goncharenok-5046356.jpg" alt="">
        <img style="position: absolute;right: 25%;bottom: 20%; border-radius: 10px;" width="8%" height="15%" src="static/images/pexels-run-ffwpu-2539281.jpg" alt="">
    </div>
    <script>
        const prev = document.getElementById("carousel").src;
        function next(){
            document.getElementById("carousel").src = "static/images/pexels-bruna-saito-1805843.jpg"

        }
        function pre(){
            console.log(prev);
            document.getElementById("carousel").src = prev
        }
    </script>
  </body>
  <footer>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Inventore eaque laboriosam nihil voluptas, accusantium ipsa accusamus quia provident mollitia sint aspernatur quaerat expedita, eveniet, necessitatibus maiores hic animi iste voluptate.</p>
  </footer>
</html>
