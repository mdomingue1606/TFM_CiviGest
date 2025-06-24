& '.\parar MySQL.ps1'

# Backend
docker build -t civigest-basic:lastest .\BasicGest
docker build -t civigest-library:lastest .\LibraryGest
docker build -t civigest-member:lastest .\MemberGest
docker build -t civigest-auth:lastest .\AuthUtility
docker build -t civigest-notification:lastest .\NotificationUtility

# Frontend
docker build -t civigest-frontend:lastest .\frontend-civigest

docker-compose up -d
