# DB
mysql -uroot -proot -h mysql mysql < docker/db/1_pre.sql
mysql -uroot -proot -h mysql web_develop < docker/db/2_db_test.sql

