package cn.ibizlab.pms.core.ou.client;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Collection;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import cn.ibizlab.pms.core.ou.domain.SysDepartment;
import cn.ibizlab.pms.core.ou.filter.SysDepartmentSearchContext;
import org.springframework.stereotype.Component;

/**
 * 实体[SysDepartment] 服务对象接口
 */
@Component
public class SysDepartmentFallback implements SysDepartmentFeignClient {

    public Page<SysDepartment> select() {
        return null;
    }

    public SysDepartment create(SysDepartment et) {
        return null;
    }
    public Boolean createBatch(List<SysDepartment> sysdepartments) {
        return false;
    }

    public SysDepartment update(String deptid, SysDepartment et) {
        return null;
    }
    public Boolean updateBatch(List<SysDepartment> sysdepartments) {
        return false;
    }


    public Boolean remove(String deptid) {
        return false;
    }
    public Boolean removeBatch(Collection<String> idList) {
        return false;
    }

    public SysDepartment get(String deptid) {
        return null;
    }


    public String getByCodeName(String codeName) {
            return null;
    }


    public SysDepartment getDraft(SysDepartment entity){
        return null;
    }



    public Boolean checkKey(SysDepartment et) {
        return false;
    }


    public Object saveEntity(SysDepartment et) {
        return null;
    }
    public Boolean save(SysDepartment et) {
        return false;
    }
    public Boolean saveBatch(List<SysDepartment> sysdepartments) {
        return false;
    }

    public Page<SysDepartment> searchDefault(SysDepartmentSearchContext context) {
        return null;
    }


}
