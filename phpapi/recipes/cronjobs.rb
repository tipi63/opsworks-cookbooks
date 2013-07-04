cron "clean_auploader_files" do
  minute "*/5"
  command "/srv/www/taketrackerapi/current/protected/yiic cleanauploderfiles clean"
end