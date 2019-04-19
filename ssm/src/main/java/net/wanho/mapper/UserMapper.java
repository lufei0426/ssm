package net.wanho.mapper;

import net.wanho.pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2019/4/18.
 */
public interface UserMapper {

    List<User> getAllUsers();

    void addUser(User user);

    void deleteUser(Integer id);

    User getSingle(Integer id);

    void updateUser (User user);

}
