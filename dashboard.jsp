<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="database.Campaign" %>
<%@ page import="java.util.List" %>

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
    <style>
        .dposts{
            margin: 20px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-evenly;
        }

        .dpost{
            border: 1px solid green;
            width: 250px;
            height: 10%;
            padding: 10px;
            border-radius: 5px;
            background-color: white;
        }
        .dpost:hover{
            box-shadow: 3px 5px 3px lightgray;
            cursor: pointer;
        }
        .icon{
            display: flex;
            flex-direction: row;
            gap: 10px;
        }
        svg{
            border: 1px solid green;
            padding: 3px;
            border-radius: 5px;
            cursor: pointer;
        }
        svg:hover{
            background-color: rgb(186, 255, 186);
        }
        a{
            text-decoration: none;
            color: green;
        }
        a:hover{
            text-decoration: underline;
        }
        h1{
            font-family: "Bree Serif", serif;
        }
    </style>
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
          <form action="./search" method="post" class="search">
                    <input type="text" name="search"/>
                    <button type="submit"><img src="static/icons/search.png"></button>
                </form>
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
    <h1 align="center" style="color: green;">Dashboard</h1>
    <div class="dposts">
        <%  if(session.getAttribute("id") != null){
            List<Campaign> campaigns = (List<Campaign>) request.getAttribute("campaigns");
            System.out.println("Campaigns list received:");
            if(campaigns!=null){
                for(Campaign campaign:campaigns){
                    if(Integer.valueOf(session.getAttribute("id").toString()) == campaign.getUserId()){
                %>
                    <div class="dpost">
                        <h1><%=campaign.getTitle()%></h1>
                        <div class="icon">
                                <form method="post" action="./delete">
                                    <input type="hidden" value="<%=campaign.getId()%>" name="id">
                                    <input type="submit" style="background-color:red;width:100%;color:white;border-radius: 5px;border-color:none;padding:5px;" value="Delete" >
                                </form>
                        </div>
                    </div>
                    <%}
                   }
                 }
               }else{
               response.sendRedirect("./login.html");}%>
    </div>
    </body>
    </html>