package cn.ibizlab.pms.core.uaa.filter;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import lombok.*;
import lombok.extern.slf4j.Slf4j;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.fastjson.annotation.JSONField;

import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;


import cn.ibizlab.pms.util.filter.SearchContextBase;

/**
 * ServiceApi数据实体[SysUserRole] 查询条件对象
 */
@Slf4j
@Data
public class SysUserRoleSearchContext extends SearchContextBase {
	private String n_sys_roleid_eq;//[角色标识]

	private String n_sys_rolename_eq;//[角色名称]

	private String n_sys_rolename_in;//[角色名称]

	private String n_sys_rolename_like;//[角色名称]

	private String n_sys_rolename_notin;//[角色名称]

	private String n_sys_userid_eq;//[用户标识]

	private String n_sys_userid_in;//[用户标识]

	private String n_sys_userid_like;//[用户标识]

	private String n_sys_username_eq;//[用户名称]

	private String n_sys_username_in;//[用户名称]

	private String n_sys_username_like;//[用户名称]

	private String n_sys_username_notin;//[用户名称]

}


