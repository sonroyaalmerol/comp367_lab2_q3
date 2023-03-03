<html>
<body>

  <% 
   Calendar cal = Calendar.getInstance();
   int hour = cal.get(Calendar.HOUR_OF_DAY);

   String greeting = "Good ";
   if (hour < 12) {
       greeting += "morning";
   } else {
       greeting += "afternoon";
   }
  %>
  <h2><%= greeting %>, Son Roy, Welcome to COMP367</h2>

  
</body>
</html>
