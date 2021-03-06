package cn.ibizlab.pms.core.report.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Map;
import java.util.HashSet;
import java.util.HashMap;
import java.util.Collection;
import java.util.Objects;
import java.util.Optional;
import java.math.BigInteger;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Value;
import cn.ibizlab.pms.util.errors.BadRequestAlertException;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.Lazy;
import cn.ibizlab.pms.core.report.domain.IbzReport;
import cn.ibizlab.pms.core.report.filter.IbzReportSearchContext;
import cn.ibizlab.pms.core.report.service.IIbzReportService;

import cn.ibizlab.pms.util.helper.CachedBeanCopier;
import cn.ibizlab.pms.util.helper.DEFieldCacheMap;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.ibizlab.pms.core.report.mapper.IbzReportMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.alibaba.fastjson.JSONObject;
import org.springframework.util.StringUtils;

/**
 * 实体[汇报汇总] 服务对象接口实现
 */
@Slf4j
@Service("IbzReportServiceImpl")
public class IbzReportServiceImpl extends ServiceImpl<IbzReportMapper, IbzReport> implements IIbzReportService {


    protected int batchSize = 500;

    @Override
    @Transactional
    public boolean create(IbzReport et) {
        if(!this.retBool(this.baseMapper.insert(et))) {
            return false;
        }
        CachedBeanCopier.copy(get(et.getIbzdailyid()), et);
        return true;
    }

    @Override
    @Transactional
    public void createBatch(List<IbzReport> list) {
        this.saveBatch(list, batchSize);
    }

    @Override
    @Transactional
    public boolean update(IbzReport et) {
        if(!update(et, (Wrapper) et.getUpdateWrapper(true).eq("ibz_dailyid", et.getIbzdailyid()))) {
            return false;
        }
        CachedBeanCopier.copy(get(et.getIbzdailyid()), et);
        return true;
    }

    @Override
    @Transactional
    public void updateBatch(List<IbzReport> list) {
        updateBatchById(list, batchSize);
    }

    @Override
    @Transactional
    public boolean remove(Long key) {
        boolean result = removeById(key);
        return result ;
    }

    @Override
    @Transactional
    public void removeBatch(Collection<Long> idList) {
        removeByIds(idList);
    }

    @Override
    @Transactional
    public IbzReport get(Long key) {
        IbzReport et = getById(key);
        if(et == null){
            et = new IbzReport();
            et.setIbzdailyid(key);
        }
        else {
        }
        return et;
    }

    @Override
    public IbzReport getDraft(IbzReport et) {
        return et;
    }

    @Override
    public boolean checkKey(IbzReport et) {
        return (!ObjectUtils.isEmpty(et.getIbzdailyid())) && (!Objects.isNull(this.getById(et.getIbzdailyid())));
    }
    @Override
    @Transactional
    public IbzReport myReportINotSubmit(IbzReport et) {
         return et ;
    }

    @Override
    @Transactional
    public IbzReport reportIReceived(IbzReport et) {
         return et ;
    }

    @Override
    @Transactional
    public boolean save(IbzReport et) {
        if(!saveOrUpdate(et)) {
            return false;
        }
        return true;
    }

    @Override
    @Transactional
    public boolean saveOrUpdate(IbzReport et) {
        if (null == et) {
            return false;
        } else {
            return checkKey(et) ? getProxyService().update(et) : getProxyService().create(et);
        }
    }

    @Override
    @Transactional
    public boolean saveBatch(Collection<IbzReport> list) {
        List<IbzReport> create = new ArrayList<>();
        List<IbzReport> update = new ArrayList<>();
        for (IbzReport et : list) {
            if (ObjectUtils.isEmpty(et.getIbzdailyid()) || ObjectUtils.isEmpty(getById(et.getIbzdailyid()))) {
                create.add(et);
            } else {
                update.add(et);
            }
        }
        if (create.size() > 0) {
            getProxyService().createBatch(create);
        }
        if (update.size() > 0) {
            getProxyService().updateBatch(update);
        }
        return true;
    }

    @Override
    @Transactional
    public void saveBatch(List<IbzReport> list) {
        List<IbzReport> create = new ArrayList<>();
        List<IbzReport> update = new ArrayList<>();
        for (IbzReport et : list) {
            if (ObjectUtils.isEmpty(et.getIbzdailyid()) || ObjectUtils.isEmpty(getById(et.getIbzdailyid()))) {
                create.add(et);
            } else {
                update.add(et);
            }
        }
        if (create.size() > 0) {
            getProxyService().createBatch(create);
        }
        if (update.size() > 0) {
            getProxyService().updateBatch(update);
        }
    }



    /**
     * 查询集合 汇报汇总
     */
    @Override
    public Page<IbzReport> searchAllReport(IbzReportSearchContext context) {
        com.baomidou.mybatisplus.extension.plugins.pagination.Page<IbzReport> pages=baseMapper.searchAllReport(context.getPages(),context,context.getSelectCond());
        return new PageImpl<IbzReport>(pages.getRecords(), context.getPageable(), pages.getTotal());
    }

    /**
     * 查询集合 数据集
     */
    @Override
    public Page<IbzReport> searchDefault(IbzReportSearchContext context) {
        com.baomidou.mybatisplus.extension.plugins.pagination.Page<IbzReport> pages=baseMapper.searchDefault(context.getPages(),context,context.getSelectCond());
        return new PageImpl<IbzReport>(pages.getRecords(), context.getPageable(), pages.getTotal());
    }

    /**
     * 查询集合 汇报汇总（我收到的）
     */
    @Override
    public Page<IbzReport> searchMyReAllReport(IbzReportSearchContext context) {
        com.baomidou.mybatisplus.extension.plugins.pagination.Page<IbzReport> pages=baseMapper.searchMyReAllReport(context.getPages(),context,context.getSelectCond());
        return new PageImpl<IbzReport>(pages.getRecords(), context.getPageable(), pages.getTotal());
    }







    @Override
    public List<JSONObject> select(String sql, Map param){
        return this.baseMapper.selectBySQL(sql,param);
    }

    @Override
    @Transactional
    public boolean execute(String sql , Map param){
        if (sql == null || sql.isEmpty()) {
            return false;
        }
        if (sql.toLowerCase().trim().startsWith("insert")) {
            return this.baseMapper.insertBySQL(sql,param);
        }
        if (sql.toLowerCase().trim().startsWith("update")) {
            return this.baseMapper.updateBySQL(sql,param);
        }
        if (sql.toLowerCase().trim().startsWith("delete")) {
            return this.baseMapper.deleteBySQL(sql,param);
        }
        log.warn("暂未支持的SQL语法");
        return true;
    }

    @Override
    public List<IbzReport> getIbzreportByIds(List<Long> ids) {
         return this.listByIds(ids);
    }

    @Override
    public List<IbzReport> getIbzreportByEntities(List<IbzReport> entities) {
        List ids =new ArrayList();
        for(IbzReport entity : entities){
            Serializable id=entity.getIbzdailyid();
            if(!ObjectUtils.isEmpty(id)){
                ids.add(id);
            }
        }
        if(ids.size()>0) {
            return this.listByIds(ids);
        }
        else {
            return entities;
        }
    }


    public IIbzReportService getProxyService() {
        return cn.ibizlab.pms.util.security.SpringContextHolder.getBean(this.getClass());
    }
}


