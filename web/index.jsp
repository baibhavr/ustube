<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<!-- ####################################################################################################### -->

<div class="wrapper">
  <div class="container">
  
  <form name="frm" enctype="multipart/form-data" action="test.do" method = "POST">
  
  </form>
    <div class="content">
      <div id="featured_slide">
        <ul id="featurednews">
          <li><img src="images/demo/1.gif" alt="" />
            <div class="panel-overlay">
              <h2>Nullamlacus dui ipsum</h2>
              <p>Temperinte interdum sempus odio urna eget curabitur semper convallis nunc laoreet.<br />
                <a href="#">Continue Reading &raquo;</a></p>
            </div>
          </li>
          <li><img src="images/demo/2.gif" alt="" />
            <div class="panel-overlay">
              <h2>Aliquatjusto quisque nam</h2>
              <p>Temperinte interdum sempus odio urna eget curabitur semper convallis nunc laoreet.<br />
                <a href="#">Continue Reading &raquo;</a></p>
            </div>
          </li>
          <li><img src="images/demo/3.gif" alt="" />
            <div class="panel-overlay">
              <h2>Dapiensociis temper donec</h2>
              <p>Temperinte interdum sempus odio urna eget curabitur semper convallis nunc laoreet.<br />
                <a href="#">Continue Reading &raquo;</a></p>
            </div>
          </li>
          <li><img src="images/demo/4.gif" alt="" />
            <div class="panel-overlay">
              <h2>Semvelit nonummy odio tempus</h2>
              <p>Justolacus eger at pede felit in dictum sempus elit curabitur ipsum. Ametpellentum.<br />
                <a href="#">Continue Reading &raquo;</a></p>
            </div>
          </li>
          <li><img src="images/demo/5.gif" alt="" />
            <div class="panel-overlay">
              <h2>Pedefamet orci orci quisque</h2>
              <p>Nonnam aenenasce morbi liberos malesuada risus id donec volutpat estibulum curabitae.<br />
                <a href="#">Continue Reading &raquo;</a></p>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="column">
      <ul class="latestnews">
        <li><img src="images/demo/100x100.gif" alt="" />
          <p><strong><a href="#">Indonectetus facilis leo.</a></strong> Nullamlacus dui ipsum cons eque loborttis non euis que morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque.</p>
        </li>
        <li><img src="images/demo/100x100.gif" alt="" />
          <p><strong><a href="#">Indonectetus facilis leo.</a></strong> Nullamlacus dui ipsum cons eque loborttis non euis que morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque.</p>
        </li>
        <li class="last"><img src="images/demo/100x100.gif" alt="" />
          <p><strong><a href="#">Indonectetus facilis leo.</a></strong> Nullamlacus dui ipsum cons eque loborttis non euis que morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque.</p>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- Media List ####################################################################################################### -->
<%@include file="homepage/recommended.jsp" %>
<c:import url="index_include_mediaList.jsp"/>
<%@ include file="footer.jsp" %>
