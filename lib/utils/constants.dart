const String APP_NAME = 'הולי פוד',
    WELCOME_TEXT = 'ברוכים הבאים למערכת ניהול עובדים שלנו ';

// ignore_for_file: constant_identifier_names

// ===================== Environment Variables =====================
const PROJECT_ID = 'PROJECT_ID';
const PRIVATE_KEY_ID = 'PRIVATE_KEY_ID';
const PRIVATE_KEY = 'PRIVATE_KEY';
const CLIENT_EMAIL = 'CLIENT_EMAIL';
const CLIENT_ID = 'CLIENT_ID';
const SPREADSHEET_ID = 'SHEET_ID';
const CREDINTIAL_PRIVATE_KETS = {
  'project_id': PROJECT_ID,
  'private_key_id': PRIVATE_KEY_ID,
  'private_key': PRIVATE_KEY,
  'client_email': CLIENT_EMAIL,
  'client_id': CLIENT_ID,
};

//============= Google Sheets Credentials ==============
const String AUTH_URL = 'https://accounts.google.com/o/oauth2/auth';
const String TOKEN_URL = 'https://oauth2.googleapis.com/token';
const String SERVICE_ACCOUNT = 'service_account';
const String AUTH_PROVIDER_X509_CERT_URL =
    'https://www.googleapis.com/oauth2/v1/certs';
const String G_SHEETS_MISSING_CREDENTIALS_OR_SPREADSHEET_ID =
    'Spreadsheet id or credentials is not found';

const String CLIENT_X509_CERT_URL =
    "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets-azn%40applied-primacy-415108.iam.gserviceaccount.com";
const String UNIVERSE_DOMAIN = "googleapis.com";
const CREDINTAL_KEYS = {
  'type': SERVICE_ACCOUNT,
  'auth_uri': AUTH_URL,
  'token_uri': TOKEN_URL,
  'auth_provider_x509_cert_url': AUTH_PROVIDER_X509_CERT_URL,
  'client_x509_cert_url': CLIENT_X509_CERT_URL,
  'universe_domain': UNIVERSE_DOMAIN,
};
// gsheets sheets
const String USERS_SPREADSHEET_NAME = 'test';
// ==========================================================================================================
const String WELCOME_BACK = 'ברוך הבא 👋';
const String SIGN_IN_TO_CONTINUE = 'התחבר כדי להמשיך';
const String LOGOUT_CONFIRMATION_MSG = 'האם אתה בטוח שברצונך להתנתק?';

const String DEFAULT_PROFILE_IMAGE_URL = 'assets/images/logo.png';
const String USERNAME_REG_EXP = r'^[a-zA-Zא-ת0-9\s]{3,}$';
const String PASSWORD_REG_EXP = r'^.{2,}$';
const String NAME_REG_EXP = r'^[a-zA-Z\s]+$';
const String EMAIL_REG_EXP = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
const String PHONE_REG_EXP = r'^[0-9]{10}$';
const String DATE_REG_EXP = r'^\d{4}-\d{2}-\d{2}$';
const String USERNAME_FORMATE = 'שם משתמש חייב להכיל לפחות 3 תווים';
const String PASSWORD_FORMATE = 'סיסמה חייבת להכיל לפחות 2 תווים';
const String SOMETHING_WENT_WRONG = 'אופס! משהו השתבש';

// Firebase Auth
const SIGN_OUT_ERROR = 'אירעה שגיאה בעת התנתקות מהמערכת';

const String USER_NOT_FOUND = 'יוזר לא נמצא',
    USER_NOT_AUTHORIZED = 'יןזר לא מורשה',
    USER_NOT_VERIFIED = 'יוזר לא מאומת',
    PASSWORD_NOT_MATCH = 'סיסמא לא נכונה',
    USER_NOT_CREATED = 'יוזר לא נוצר',
    USER_NOT_UPDATED = 'יוזר לא עודכן',
    USER_NOT_DELETED = 'יוזר לא נמחק',
    USER_NOT_SIGNED_IN = 'יוזר לא התחבר',
    UNKNOWN_ERROR = '😟 אירעה שגיאה',
    ADMIN_NOT_FOUND = 'לא קיים מנהל עם הפרטים שהוזנו',
    PASSWORD_RESET_LINK_SENT = 'קישור לאיפוס סיסמה נשלח למייל שהוזן',
    LOGIN_SUCCESS = 'התחברת בהצלחה',
    UPDATE_LAST_ACTIVE_ERROR = 'שגיאה בעדכון פעילות אחרונה';

const Map<String, String> FIREBASE_AUTH_MAP = {
  'operation-not-allowed': USER_NOT_AUTHORIZED,
  'user-not-found': USER_NOT_FOUND,
  'wrong-password': PASSWORD_NOT_MATCH,
  'user-not-verified': USER_NOT_VERIFIED,
  'email-already-in-use': USER_NOT_CREATED, //when sign up
  'unknown': UNKNOWN_ERROR,
};

const Map<String, dynamic> APP_MANAGER_LOGIN_MESSAFES = {
  'title': 'כניסת מנהל אפליקציה',
  'userHint': 'אימייל',
  'passwordHint': 'סיסמה',
  'loginButton': 'התחבר',
  'forgotPasswordButton': 'שכחתי סיסמה',
  'goBackButton': 'חזור',
  'confirmPasswordError': PASSWORD_NOT_MATCH,
  'recoverPasswordIntro': 'הזן את כתובת המייל שלך ולחץ על איפוס סיסמה',
  'recoverPasswordDescription': 'הזן סיסמה חדשה ולחץ על איפוס סיסמה',
  'recoverPasswordSuccess': 'הסיסמה אופסה בהצלחה',
  'recoverPasswordButton': 'איפוס סיסמה',
  'confirmPasswordHint': 'אימות סיסמה',
};

const Map<String, String> LOGIN_MESSAGES = {
  'username': 'שם משתמש חייב להיות באורך של 3 תווים לפחות',
  'password': 'סיסמה חייבת להיות באורך של 2 תווים לפחות',
  'adminTitle': 'כניסת מנהל',
  'userTitle': 'כניסת עובד',
  'welcomeBack': 'ברוך הבא',
  'signInToContinue': 'התחבר כדי להמשיך',
  'hintUsername': 'שם משתמש',
  'hintPassword': 'סיסמה',
  'signIn': 'כניסה',
};

const String USER_HINT_TEXT = 'שם משתמש', PASSWORD_HINT_TEXT = 'סיסמה';
// ================ Collections =================
const String USERS_COLLECTION = 'users';
const String DEPARTMENTS_COLLECTION = 'departments';
const String PRODUCTS_COLLECTION = 'products';



const USER_TABLE_HEADERS = [
  '#',
  ' יוזרנים',
  'סיסמה',
  'מחלקה',
  'סטטוס',
  'זמן סטטוס אחרון',
  'תקופת סטטוס'
];
