package cn.ibizlab.pms.core.ou.filter;

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
 * ServiceApi数据实体[IBZEmployee] 查询条件对象
 */
@Slf4j
@Data
public class IBZEmployeeSearchContext extends SearchContextBase {
	private String n_personname_like;//[姓名]

	private String n_sex_eq;//[性别]

}


