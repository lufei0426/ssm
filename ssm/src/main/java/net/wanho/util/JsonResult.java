package net.wanho.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by Administrator on 2019/4/18.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonResult {
    private Integer status;
    private String msg;
    private Object result;
}
