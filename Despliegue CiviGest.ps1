& '.\parar MySQL.ps1'

# Backend
docker build -t civigest-basic:lastest C:\Users\carme\source\repos\BasicGest
docker build -t civigest-library:lastest C:\Users\carme\source\repos\LibraryGest
docker build -t civigest-member:lastest C:\Users\carme\source\repos\MemberGest
docker build -t civigest-auth:lastest C:\Users\carme\source\repos\AuthUtility
docker build -t civigest-notification:lastest C:\Users\carme\source\repos\NotificationUtility

# Frontend
docker build -t civigest-frontend:lastest C:\Users\carme\OneDrive\Documentos\CiviGest\civigest

docker-compose up -d