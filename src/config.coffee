getEmailArgument =
  if process.argv.indexOf("-email") != -1
  then process.argv[process.argv.indexOf("-email") + 1]

getPasswordArgument =
  if process.argv.indexOf("-pass") != -1
  then process.argv[process.argv.indexOf("-pass") + 1]

getSprintArgument =
    if process.argv.indexOf("-sprint") != -1
    then process.argv[process.argv.indexOf("-sprint") + 1]


#Youtrack Credentials
YouTrackEmail = -> process.env.youtrack_email ? getEmailArgument  ? "EMAIL@EMAIL.com"
YouTrackPassword = -> process.env.youtrack_password ? getPasswordArgument ? "PASSWORD"

#Youtrack API URls
YoutrackLoginURL =-> 'https://COMPANY.myjetbrains.com/youtrack/rest/user/login';
YouTrack_BaseURL =  "https://COMPANY.myjetbrains.com/youtrack/rest/issue?filter="

#Youtrack Queries
SprintNumber = -> getSprintArgument ? "32"
youtrack_query  = ("Sprint: #" + SprintNumber() + " Type:{Technical} Type:{User Story} Type:{Bug}");
YouTrackURL = -> YouTrack_BaseURL + encodeURIComponent(youtrack_query) + '&max=3000';

exports.sprint_number = SprintNumber()
exports.YouTrack_URL = YouTrackURL()
exports.YouTrack_Email = YouTrackEmail()
exports.YouTrack_Password = YouTrackPassword()  
exports.YouTrack_Login_URL = YoutrackLoginURL()
