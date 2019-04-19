package net.wanho.service;

import com.github.pagehelper.PageInfo;
import net.wanho.pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2019/4/18.
 */
public interface UserServiceI {

    PageInfo<User> getAllUsers(Integer pageNum);

    void deleteUser(Integer id);

    void addUser(User user);

    User getSingle(Integer id);

    void updateUser (User user);
}
