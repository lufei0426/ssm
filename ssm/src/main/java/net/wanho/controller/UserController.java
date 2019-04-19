package net.wanho.controller;

import com.github.pagehelper.PageInfo;
import net.wanho.mapper.UserMapper;
import net.wanho.pojo.User;
import net.wanho.service.UserServiceI;
import net.wanho.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/4/18.
 */
@Controller
public class UserController {

    @Autowired
    private UserServiceI userServiceI;

   /* @RequestMapping("getAllUsers")
    @ResponseBody
    public JsonResult getAllUsers(){
        List<User> users = userServiceI.getAllUsers();
        System.out.println(users);
        JsonResult jsonResult=new JsonResult(200,"查询成功",users);
        return jsonResult;
    }*/

    @RequestMapping("getAllUsers")
    public String getAllUsers(@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum, Map map){
        PageInfo<User> pageInfo = userServiceI.getAllUsers(pageNum);
        map.put("pageInfo",pageInfo);
        return "user";
    }

    //删除
    @RequestMapping("deleteUser")
    @ResponseBody
    public JsonResult deleteUser(Integer userId){
        userServiceI.deleteUser(userId);
        JsonResult jsonResult=new JsonResult(200,"删除成功",null);
        return jsonResult;
    }

    //跳转增加界面
    @RequestMapping("jump")
    public String jump(){
        return "create";
    }

    //增加
    @RequestMapping("addUser")
    @ResponseBody
    public JsonResult addUser(User user){
        System.out.println(123);
        userServiceI.addUser(user);
        JsonResult jsonResult=new JsonResult(200,"增加成功",null);
        return jsonResult;
    }

    //回填
    @RequestMapping("back")
    public String back(Map map,Integer id){

        User user = userServiceI.getSingle(id);
        map.put("user",user);
        return "update";

    }
    // 修改
    @RequestMapping("updateUser")
    @ResponseBody
    public JsonResult updateUser(User user){
        userServiceI.updateUser(user);
        JsonResult jsonResult=new JsonResult(200,"修改成功",null);
        return jsonResult;
    }


}
