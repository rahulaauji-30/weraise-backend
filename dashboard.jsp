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
    <h1 align="center" style="color: green;">Dashboard</h1>
    <div class="dposts">
        <div class="dpost">
            <h1><a href="individual page.html">Just A kid</a></h1>
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                    <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M38.657,18.536l2.44,-2.44c2.534,-2.534 2.534,-6.658 0,-9.193c-1.227,-1.226 -2.858,-1.9 -4.597,-1.9c-1.739,0 -3.371,0.675 -4.597,1.901l-2.439,2.439zM27.343,11.464l-18.069,18.069c-0.385,0.385 -0.678,0.86 -0.848,1.375l-3.35,10.121c-0.179,0.538 -0.038,1.131 0.363,1.532c0.287,0.286 0.669,0.439 1.061,0.439c0.158,0 0.317,-0.025 0.472,-0.076l10.118,-3.351c0.517,-0.17 0.993,-0.463 1.378,-0.849l18.068,-18.068z"></path></g></g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                        <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(10.66667,10.66667)"><path d="M10.80664,2c-0.517,0 -1.01095,0.20431 -1.37695,0.57031l-0.42969,0.42969h-5c-0.36064,-0.0051 -0.69608,0.18438 -0.87789,0.49587c-0.18181,0.3115 -0.18181,0.69676 0,1.00825c0.18181,0.3115 0.51725,0.50097 0.87789,0.49587h16c0.36064,0.0051 0.69608,-0.18438 0.87789,-0.49587c0.18181,-0.3115 0.18181,-0.69676 0,-1.00825c-0.18181,-0.3115 -0.51725,-0.50097 -0.87789,-0.49587h-5l-0.42969,-0.42969c-0.365,-0.366 -0.85995,-0.57031 -1.37695,-0.57031zM4.36523,7l1.52734,13.26367c0.132,0.99 0.98442,1.73633 1.98242,1.73633h8.24805c0.998,0 1.85138,-0.74514 1.98438,-1.74414l1.52734,-13.25586z"></path></g></g>
                        </svg>
            </div>
        </div>
        <div class="dpost">
            <h1><a href="individual page.html">Just A kid</a></h1>
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                    <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M38.657,18.536l2.44,-2.44c2.534,-2.534 2.534,-6.658 0,-9.193c-1.227,-1.226 -2.858,-1.9 -4.597,-1.9c-1.739,0 -3.371,0.675 -4.597,1.901l-2.439,2.439zM27.343,11.464l-18.069,18.069c-0.385,0.385 -0.678,0.86 -0.848,1.375l-3.35,10.121c-0.179,0.538 -0.038,1.131 0.363,1.532c0.287,0.286 0.669,0.439 1.061,0.439c0.158,0 0.317,-0.025 0.472,-0.076l10.118,-3.351c0.517,-0.17 0.993,-0.463 1.378,-0.849l18.068,-18.068z"></path></g></g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                        <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(10.66667,10.66667)"><path d="M10.80664,2c-0.517,0 -1.01095,0.20431 -1.37695,0.57031l-0.42969,0.42969h-5c-0.36064,-0.0051 -0.69608,0.18438 -0.87789,0.49587c-0.18181,0.3115 -0.18181,0.69676 0,1.00825c0.18181,0.3115 0.51725,0.50097 0.87789,0.49587h16c0.36064,0.0051 0.69608,-0.18438 0.87789,-0.49587c0.18181,-0.3115 0.18181,-0.69676 0,-1.00825c-0.18181,-0.3115 -0.51725,-0.50097 -0.87789,-0.49587h-5l-0.42969,-0.42969c-0.365,-0.366 -0.85995,-0.57031 -1.37695,-0.57031zM4.36523,7l1.52734,13.26367c0.132,0.99 0.98442,1.73633 1.98242,1.73633h8.24805c0.998,0 1.85138,-0.74514 1.98438,-1.74414l1.52734,-13.25586z"></path></g></g>
                        </svg>
            </div>
        </div>
        <div class="dpost">
            <h1><a href="individual page.html">Just A kid</a></h1>
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                    <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M38.657,18.536l2.44,-2.44c2.534,-2.534 2.534,-6.658 0,-9.193c-1.227,-1.226 -2.858,-1.9 -4.597,-1.9c-1.739,0 -3.371,0.675 -4.597,1.901l-2.439,2.439zM27.343,11.464l-18.069,18.069c-0.385,0.385 -0.678,0.86 -0.848,1.375l-3.35,10.121c-0.179,0.538 -0.038,1.131 0.363,1.532c0.287,0.286 0.669,0.439 1.061,0.439c0.158,0 0.317,-0.025 0.472,-0.076l10.118,-3.351c0.517,-0.17 0.993,-0.463 1.378,-0.849l18.068,-18.068z"></path></g></g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0,0,256,256">
                        <g fill="#009c00" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(10.66667,10.66667)"><path d="M10.80664,2c-0.517,0 -1.01095,0.20431 -1.37695,0.57031l-0.42969,0.42969h-5c-0.36064,-0.0051 -0.69608,0.18438 -0.87789,0.49587c-0.18181,0.3115 -0.18181,0.69676 0,1.00825c0.18181,0.3115 0.51725,0.50097 0.87789,0.49587h16c0.36064,0.0051 0.69608,-0.18438 0.87789,-0.49587c0.18181,-0.3115 0.18181,-0.69676 0,-1.00825c-0.18181,-0.3115 -0.51725,-0.50097 -0.87789,-0.49587h-5l-0.42969,-0.42969c-0.365,-0.366 -0.85995,-0.57031 -1.37695,-0.57031zM4.36523,7l1.52734,13.26367c0.132,0.99 0.98442,1.73633 1.98242,1.73633h8.24805c0.998,0 1.85138,-0.74514 1.98438,-1.74414l1.52734,-13.25586z"></path></g></g>
                        </svg>
            </div>
        </div>
    </div>
    </body>
    </html>