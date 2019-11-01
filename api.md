# 爱赚 api

## * 1级 邀请3人 升级高级
## * 1级 佣金30% 上级推广 20%  总代理 50%
## * 2级 佣金60% 上级推广 20%  总代理 20%



## 1. 获取验证码
**request**
* 描述: 获取验证码
* method: get
* url: `/getcode`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | account | string 或 int | 手机号或者邮箱号 |
| 必选 | type | int | 1验证码登陆 2注册获取验证码 3找回密码验证码 |

**response**
```


success
{
    "code": 200,
    "msg": ok,
}

error
{
    "code": 400,
    "msg": 错误原因
}
```


## 2. 注册
**request**
* 描述: 用户注册
* method: post
* url: `/register`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | account | string 或 int | 账号,必须和自己支付宝账号相同，提现时候钱只打到这里 |
| 必选 | code | int | 验证码 |
| 必选 | password | string | 密码 |
| 必选 | repeat_password | string | 重复密码 | 
**response**
```


success
{
    "code": 200,
    "msg": ok,
    "data": {
        "token": xxxxx, // token
        "invite_code": 19821, // 邀请码
        "level": 1, // 等级
        "pid: 1081 // 渠道号
    }
}

error
{
    "code": 400,
    "msg": 错误原因
}
```

## 3. 登陆
**request**
* 描述: 用户登陆
* method: post
* url: `/login`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | account | string 或 number | 账号|
| 必选 | password | string | 密码 |
**response**
```
success
{
    "code": 200,
    "msg": ok,
    "data": {
        "token": xxxxx, // token
        "invite_code": 19821, // 邀请码
        "level": 1, // 等级
    }
}

error
{
    "code": 400,
    "msg": 错误原因
}
```

## 4. 重置密码
**request**
* 描述: 重置密码
* method: post
* url: `/reset_password`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | account | string 或 int | 账号,必须和自己支付宝账号相同，提现时候钱只打到这里 |
| 必选 | code | int | 验证码 |
| 必选 | password | string | 密码 |
| 必选 | repeat_password | string | 重复密码 | 
**response**
```


success
{
    "code": 200,
    "msg": ok,
}

error
{
    "code": 400,
    "msg": 错误原因
}
```


## 5. 修改密码
**request**
* 描述: 修改密码
* method: post
* url: `/modify_password`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | old_password | string | 旧密码 |
| 必选 | new_password | string | 新密码 |
| 必选 | repeat_new_password | string | 重复新密码 |
**response**
```


success
{
    "code": 200,
    "msg": ok,
}

error
{
    "code": 400,
    "msg": 错误原因
}
```

## 6. 邀请记录
**request**
* 描述: 邀请记录
* method: get
* url: `/invite_list`
* 参数:

| 是否必选 | 参数 | 类型 | 参数说明 |
| - | - | - | - |
| 必选 | old_password | string | 旧密码 |
| 必选 | new_password | string | 新密码 |
| 必选 | repeat_new_password | string | 重复新密码 |
**response**
```


success
{
    "code": 200,
    "msg": ok,
}

error
{
    "code": 400,
    "msg": 错误原因
}
```