<%-- 
    Document   : youtubers
    Created on : 19-feb-2018, 11:14:31
    Author     : Laptop10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<section>
    <article>
        <header><h2>Popular Youtubers</h2></header>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse semper nisl ipsum, a tincidunt neque tincidunt eu. Aenean at metus vitae nulla interdum mollis. Pellentesque gravida purus non tincidunt efficitur. Donec volutpat, nunc nec ultricies efficitur, mauris felis aliquet ante, et iaculis dolor nibh et purus. Vestibulum fermentum rutrum viverra. Donec hendrerit vulputate augue facilisis vestibulum. Nullam nec felis molestie lorem efficitur varius. Nunc vel interdum nisl. Vestibulum justo eros, consequat in nunc eget, porttitor porta leo. Nulla eu feugiat est. In id placerat neque, nec sagittis nunc. Integer vel posuere sapien. Fusce bibendum porttitor lobortis.</p>
        <div class="youtubers">
            <h3>
                Pewdiepie
            </h3>
            <figure>
                <a href="https://www.youtube.com/user/PewDiePie">
                    <img src="https://yt3.ggpht.com/-rJq9gk1QIis/AAAAAAAAAAI/AAAAAAAAAAA/Kx4wkvKOfxY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg">
                </a>
            </figure>
            <h3>Luis Fonsi & Daddy Yankee - Despacito</h3>
            <video width="320" height="240" controls>
                <source src="media/despacito.mp4">
            </video>
        </div>
    </article>
</section>

<jsp:include page="footer.jsp" />
