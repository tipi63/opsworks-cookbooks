node[:deploy].each do |app_name, deploy|

  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
	php composer.phar self-update
	php composer.phar install
	cd ..
	chown www-data:www-data current
	EOH
  end
  
  script "setup_yii" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
	find -type d | xargs chmod -v 755
	find -type f | xargs chmod -v 644
	mkdir assets
	chmod 777 assets/
	mkdir protected/runtime
	chmod 777 protected/runtime
	chmod 777 avatars
	EOH
  end
  
  script "move_avatars" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/releases"
    code <<-EOH
	folder=$(find -maxdepth 1 -type d  | sort -nr | awk 'NR==2')
	cd $folder/avatars
	mv * ../../../current/avatars/
	EOH
  end
end