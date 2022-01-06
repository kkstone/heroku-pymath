> 提醒： 滥用可能导致账户被BAN！！！   
  
* 使用[xray](https://github.com/XTLS/Xray-core)+caddy部署通过ws传输的vless协议    
  
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/kkstone/xrayku)  
  
### 服务端
点击上面紫色`Deploy to Heroku`，会跳转到heroku app创建页面，填上app的名字、选择节点、按需修改部分参数和AUUID后点击下面deploy创建app即可开始部署  
如出现错误，可以多尝试几次，待部署完成后页面底部会显示Your app was successfully deployed  
  * 点击Manage App可在Settings下的Config Vars项**查看和重新设置参数**  
  * 点击Open app跳转[欢迎页面](/etc/CADDYIndexPage.md)域名即为heroku分配域名，格式为`appname.herokuapp.com`，用于客户端  
  * 默认协议密码为$UUID，WS路径为/uploader
  
### 客户端
* **务必替换所有的appname.herokuapp.com为heroku分配的项目域名**  
* **务必替换所有的8f91b6a0-e8ee-11ea-adc1-0242ac120002为部署时设置的AUUID**  
  
<details>
<summary>cloudflare workers example</summary>

```js
const SingleDay = 'appname.herokuapp.com'
const DoubleDay = 'appname.herokuapp.com'
addEventListener(
    "fetch",event => {
    
        let nd = new Date();
        if (nd.getDate()%2) {
            host = SingleDay
        } else {
            host = DoubleDay
        }
        
        let url=new URL(event.request.url);
        url.hostname=host;
        let request=new Request(url,event.request);
        event. respondWith(
            fetch(request)
        )
    }
)
```
</details>
