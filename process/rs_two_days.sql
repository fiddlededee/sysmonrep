select Module, Login, EventDate, EventTimestamp 
from logs.login 
where EventDate between today() - 1 and today()
