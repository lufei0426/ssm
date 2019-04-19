package net.wanho.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.wanho.mapper.UserMapper;
import net.wanho.pojo.User;
import net.wanho.service.UserServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/4/18.
 */
@Service
public class UserServiceImpl implements UserServiceI {

    @Autowired
    private UserMapper userMapper;


    @Override
    public PageInfo<User> getAllUsers(Integer pageNum) {
        //设置分页信息
        PageHelper.startPage(pageNum,3);
        List<User> allUsers = userMapper.getAllUsers();
        PageInfo<User> pageInfo=new PageInfo<User>(allUsers);
        return pageInfo;
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    @Override
    public void addUser(User user) {

        userMapper.addUser(user);

    }

    @Override
    public User getSingle(Integer id) {

        return userMapper.getSingle(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }
}
