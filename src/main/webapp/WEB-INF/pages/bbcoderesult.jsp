<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="application" scope="application" type="javax.servlet.ServletContext" /> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>BBCode Test Result</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <style type="text/css">
        span.raw {
            font-family: monospace;
        }
        div.box {
            width: 40em;
            overflow: auto;
            margin-left: 1em;
            margin-right: 1em;
            margin-top: 1ex;
            margin-bottom: 1ex;
            outline: thin solid rgb(0%,0%,0%);
            background-color:rgb(100%,90%,80%);
        }
    </style>
</head>
<body>
	<h1>BBCode Test Result</h1>
    <div>The raw <a href="http://en.wikipedia.org/wiki/BBCode">BBCode</a> markup
        <div class="box">
            <c:forEach var="line" items='${rawMarkupLines}'>
                <span class="raw"><c:out value="${line}" escapeXml="true"/><br/></span>
            </c:forEach>
        </div> is transformed by the
        <a href="http://kefirsf.org/kefirbb/">KefirBB</a> text processor into:
        <div class="box">${processedMarkup}</div>
        The generated HTML fragment is:
        <div class="box">
            <span class="raw"><c:out value="${processedMarkup}" escapeXml="true"/></span>
        </div>
    </div>
    <p>Back to the <a href="${rootUrl}">Input Form</a>. </p>
</body>
</html>
