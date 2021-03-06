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
import cn.ibizlab.pms.core.ou.domain.SysOrganization;
import cn.ibizlab.pms.core.ou.filter.SysOrganizationSearchContext;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * 实体[SysOrganization] 服务对象接口
 */
@FeignClient(value = "${ibiz.ref.service.ibzou-api:ibzou-api}", contextId = "SysOrganization", fallback = SysOrganizationFallback.class)
public interface SysOrganizationFeignClient {

    @RequestMapping(method = RequestMethod.GET, value = "/sysorganizations/select")
    Page<SysOrganization> select();


    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations")
    SysOrganization create(@RequestBody SysOrganization et);

    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations/batch")
    Boolean createBatch(@RequestBody List<SysOrganization> sysorganizations);


    @RequestMapping(method = RequestMethod.PUT, value = "/sysorganizations/{orgid}")
    SysOrganization update(@PathVariable("orgid") String orgid, @RequestBody SysOrganization et);

    @RequestMapping(method = RequestMethod.PUT, value = "/sysorganizations/batch")
    Boolean updateBatch(@RequestBody List<SysOrganization> sysorganizations);


    @RequestMapping(method = RequestMethod.DELETE, value = "/sysorganizations/{orgid}")
    Boolean remove(@PathVariable("orgid") String orgid);

    @RequestMapping(method = RequestMethod.DELETE, value = "/sysorganizations/batch}")
    Boolean removeBatch(@RequestBody Collection<String> idList);


    @RequestMapping(method = RequestMethod.GET, value = "/sysorganizations/{orgid}")
    SysOrganization get(@PathVariable("orgid") String orgid);

    @RequestMapping(method = RequestMethod.GET, value = "/sysorganizations/getbycodename/{orgid}")
    String getByCodeName(@PathVariable("orgid") String codeName);


    @RequestMapping(method = RequestMethod.GET, value = "/sysorganizations/getdraft")
    SysOrganization getDraft(SysOrganization entity);


    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations/checkkey")
    Boolean checkKey(@RequestBody SysOrganization et);


    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations/save")
    Object saveEntity(@RequestBody SysOrganization et);

    default Boolean save(@RequestBody SysOrganization et) { return saveEntity(et)!=null; }

    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations/savebatch")
    Boolean saveBatch(@RequestBody List<SysOrganization> sysorganizations);



    @RequestMapping(method = RequestMethod.POST, value = "/sysorganizations/searchdefault")
    Page<SysOrganization> searchDefault(@RequestBody SysOrganizationSearchContext context);


}
