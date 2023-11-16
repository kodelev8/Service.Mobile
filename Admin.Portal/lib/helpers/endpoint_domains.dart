// const mongConnectionString = 'mongodb+srv://prechart:Calender365@delphiguy.u4m93.mongodb.net/?retryWrites=true&w=majority';
const mongConnectionString = 'mongodb+srv://portal:PqglbquoNoubhp1Z@delphiguy.u4m93.mongodb.net/Prechart-Portal?retryWrites=true&w=majority';
const mongoEndPointsCollection = 'EndPoints';

//mongodb+srv://portal:PqglbquoNoubhp1Z@delphiguy.u4m93.mongodb.net/test
//mongodb+srv://<username>:<password>@delphiguy.u4m93.mongodb.net/?retryWrites=true&w=majority



// String userDomain = 'prd-zekerheyd-user.prechart.com';
// String werkgeverDomain = 'prd-zekerheyd-werkgever.prechart.com';
// String personDomain = 'prd-zekerheyd-person.prechart.com';
// String loonheffingDomain = 'prd-zekerheyd-loonheffing.prechart.com/';
// String berekingenDomain  = 'prd-zekerheyd-berekening.prechart.com';
// String belastingDomain = 'prd-zekerheyd-belastingen.prechart.com';

String userDomain = 'localhost:5000';
String werkgeverDomain = 'localhost:5000';
String personDomain = 'localhost:5000';
String loonheffingDomain = 'localhost:5000';
String berekingenDomain  = 'localhost:5000';
String belastingDomain = 'localhost:5000';

String IsSSL() => userDomain.contains('localhost') || userDomain.contains('127') ? 'http' : 'https';
