# ecnu\_auth
A simple wrapper for ECNU net client on Linux

## 登录

```bash
ecnu_auth --login

# check
ecnu_auth --check
ping 1.1.1.1
```

**注意**：密码明文存储在 `~/.config/ecnu_auth/config.json` 中

其他用法见 `ecnu_auth -h`

## 自动登录

目前（2023/07/24）每个人至多只能登录三台设备。若无网络流量，2小时后自动断开，因此需要自动登录。

可以通过 crontab 设置启动时自动登录：

```bash
sudo crontab -e
```

crontab 中输入下面的内容

```
admin=your_user_name
@reboot sleep 30; /usr/local/anaconda3/bin/python /usr/local/bin/ecnu_auth --admin $admin --daemon > /usr/local/bin/ecnu_auth.log 2>&1
```

`your_user_name` 替换为执行 `ecnu_auth --login` 的用户名（用于指定config路径）

> `sleep 30` 保证相关依赖项已经启动完毕

如果不能重启服务器，需要临时设置自动登录（重启后失效）:

```bash
sudo su  # switch to root
admin=your_user_name
nohup /usr/local/anaconda3/bin/python /usr/local/bin/ecnu_auth --admin $admin --daemon > /usr/local/bin/ecnu_auth.log 2>&1 &
```


