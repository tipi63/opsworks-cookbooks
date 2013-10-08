cron "clean_auploader_files" do
  minute "*/5"
  command "/srv/www/taketrackerapi/current/protected/yiic cleanauploderfiles clean"
end
cron "resend_to_conversion" do
  minute "*/5"
  command "/srv/www/taketrackerapi/current/protected/yiic resendtoconversion send"
end
cron "clean_uploads_freemium" do
  minute "0"
  hour "0"
  command "/srv/www/taketrackerapi/current/protected/yiic cleanuploadsfreemium clean"
end