# 1. Check if .env file exists
if [ -e .env ]; then
    source .env
else 
    echo "Please set up your .env file before starting your environment."
    exit 1
fi

while getopts b: option
  do
    case "${option}"
  in
    b) PATHNAME=${OPTARG}
    ;;
  esac
done

if [ -z "$PATHNAME" ]; then
  echo "please use param b for backup folder"
  exit
if
  
if [ -d "./backups/$PATHNAME/" ]; then
  echo "copy files to wp"
  cp -r ./backups/$PATHNAME/html/wp-content/* $WP_CONTENT
fi

LOCAL_FILE=./backups/$PATHNAME/$MYSQL_DATABASE.sql
echo "copy file: "$LOCAL_FILE
cp $LOCAL_FILE $DB_PATH/$MYSQL_DATABASE.sql

sleep 2

docker-compose run $CONTAINER_DB_NAME mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /var/lib/mysql/$MYSQL_DATABASE.sql

echo "remove file: "$DB_PATH/$MYSQL_DATABASE.sql
rm $DB_PATH/$MYSQL_DATABASE.sql
