# 设置服务文件权限
chmod 777 $TARGET_DIR/etc/systemd/system/my_service.service

# 设置服务自启动
ln -s $TARGET_DIR/etc/systemd/system/my_service.service $TARGET_DIR/etc/systemd/system/multi-user.target.wants/my_service.service
