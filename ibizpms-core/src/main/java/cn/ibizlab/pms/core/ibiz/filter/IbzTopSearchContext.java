package cn.ibizlab.pms.core.ibiz.filter;

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


import cn.ibizlab.pms.util.filter.QueryWrapperContext;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import cn.ibizlab.pms.core.ibiz.domain.IbzTop;
/**
 * 关系型数据实体[IbzTop] 查询条件对象
 */
@Slf4j
@Data
public class IbzTopSearchContext extends QueryWrapperContext<IbzTop> {

	private String n_ibz_topname_like;//[置顶名称]
	public void setN_ibz_topname_like(String n_ibz_topname_like) {
        this.n_ibz_topname_like = n_ibz_topname_like;
        if(!ObjectUtils.isEmpty(this.n_ibz_topname_like)){
            this.getSearchCond().like("`ibz_topname`", n_ibz_topname_like);
        }
    }
	private String n_account_eq;//[置顶用户]
	public void setN_account_eq(String n_account_eq) {
        this.n_account_eq = n_account_eq;
        if(!ObjectUtils.isEmpty(this.n_account_eq)){
            this.getSearchCond().eq("`account`", n_account_eq);
        }
    }
	private String n_type_eq;//[类型]
	public void setN_type_eq(String n_type_eq) {
        this.n_type_eq = n_type_eq;
        if(!ObjectUtils.isEmpty(this.n_type_eq)){
            this.getSearchCond().eq("`type`", n_type_eq);
        }
    }

    /**
	 * 启用快速搜索
	 */
    @Override
	public void setQuery(String query)
	{
		 this.query=query;
		 if(!StringUtils.isEmpty(query)){
            this.getSearchCond().and( wrapper ->
                     wrapper.like("`ibz_topname`", query)
            );
		 }
	}
}



