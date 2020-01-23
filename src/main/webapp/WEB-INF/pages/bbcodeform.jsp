<%@ page session="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>BBCode Test Form</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>BBCode Test Form</h1>
    <p>The text entered in the folowing textbox will be processed as
        <a href="http://en.wikipedia.org/wiki/BBCode" target="_blank">BBCode</a> by the
        <a href="http://kefirsf.org/kefirbb/" target="_blank">KefirBB</a> text processor.</p>
    <p><b>Note:</b> The set of supported BBCode tags and how they are actually rendered depends on
        the KefirBB configuration!</p>
    <form action="${formSubmissionUrl}" method="post">
       <div>
           <label for="bbcodeinput">BBCode Input:</label><br/>
           <textarea id="bbcodeinput" name="bbcodeinput" rows="8" cols="60">Here comes your BBCode formatted text...</textarea>
       </div>
       <input type="submit" value="Process BBCode"/>
    </form>
</body>
</html>
