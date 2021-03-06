package cn.ibizlab.pms.webapi.rest;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.math.BigInteger;
import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;
import com.alibaba.fastjson.JSONObject;
import javax.servlet.ServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.validation.annotation.Validated;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import cn.ibizlab.pms.webapi.dto.*;
import cn.ibizlab.pms.webapi.mapping.*;
import cn.ibizlab.pms.core.ibiz.domain.DynaDashboard;
import cn.ibizlab.pms.core.ibiz.service.IDynaDashboardService;
import cn.ibizlab.pms.core.ibiz.filter.DynaDashboardSearchContext;
import cn.ibizlab.pms.util.annotation.VersionCheck;

@Slf4j
@Api(tags = {"动态数据看板" })
@RestController("WebApi-dynadashboard")
@RequestMapping("")
public class DynaDashboardResource {

    @Autowired
    public IDynaDashboardService dynadashboardService;

    @Autowired
    @Lazy
    public DynaDashboardMapping dynadashboardMapping;

    @PreAuthorize("hasPermission(this.dynadashboardMapping.toDomain(#dynadashboarddto),'pms-DynaDashboard-Create')")
    @ApiOperation(value = "新建动态数据看板", tags = {"动态数据看板" },  notes = "新建动态数据看板")
	@RequestMapping(method = RequestMethod.POST, value = "/dynadashboards")
    public ResponseEntity<DynaDashboardDTO> create(@Validated @RequestBody DynaDashboardDTO dynadashboarddto) {
        DynaDashboard domain = dynadashboardMapping.toDomain(dynadashboarddto);
		dynadashboardService.create(domain);
        DynaDashboardDTO dto = dynadashboardMapping.toDto(domain);
		return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

    @PreAuthorize("hasPermission(this.dynadashboardMapping.toDomain(#dynadashboarddtos),'pms-DynaDashboard-Create')")
    @ApiOperation(value = "批量新建动态数据看板", tags = {"动态数据看板" },  notes = "批量新建动态数据看板")
	@RequestMapping(method = RequestMethod.POST, value = "/dynadashboards/batch")
    public ResponseEntity<Boolean> createBatch(@RequestBody List<DynaDashboardDTO> dynadashboarddtos) {
        dynadashboardService.createBatch(dynadashboardMapping.toDomain(dynadashboarddtos));
        return  ResponseEntity.status(HttpStatus.OK).body(true);
    }

    @VersionCheck(entity = "dynadashboard" , versionfield = "updatedate")
    @PreAuthorize("hasPermission(this.dynadashboardService.get(#dynadashboard_id),'pms-DynaDashboard-Update')")
    @ApiOperation(value = "更新动态数据看板", tags = {"动态数据看板" },  notes = "更新动态数据看板")
	@RequestMapping(method = RequestMethod.PUT, value = "/dynadashboards/{dynadashboard_id}")
    public ResponseEntity<DynaDashboardDTO> update(@PathVariable("dynadashboard_id") String dynadashboard_id, @RequestBody DynaDashboardDTO dynadashboarddto) {
		DynaDashboard domain  = dynadashboardMapping.toDomain(dynadashboarddto);
        domain .setDynadashboardid(dynadashboard_id);
		dynadashboardService.update(domain );
		DynaDashboardDTO dto = dynadashboardMapping.toDto(domain);
        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

    @PreAuthorize("hasPermission(this.dynadashboardService.getDynadashboardByEntities(this.dynadashboardMapping.toDomain(#dynadashboarddtos)),'pms-DynaDashboard-Update')")
    @ApiOperation(value = "批量更新动态数据看板", tags = {"动态数据看板" },  notes = "批量更新动态数据看板")
	@RequestMapping(method = RequestMethod.PUT, value = "/dynadashboards/batch")
    public ResponseEntity<Boolean> updateBatch(@RequestBody List<DynaDashboardDTO> dynadashboarddtos) {
        dynadashboardService.updateBatch(dynadashboardMapping.toDomain(dynadashboarddtos));
        return  ResponseEntity.status(HttpStatus.OK).body(true);
    }

    @PreAuthorize("hasPermission(this.dynadashboardService.get(#dynadashboard_id),'pms-DynaDashboard-Remove')")
    @ApiOperation(value = "删除动态数据看板", tags = {"动态数据看板" },  notes = "删除动态数据看板")
	@RequestMapping(method = RequestMethod.DELETE, value = "/dynadashboards/{dynadashboard_id}")
    public ResponseEntity<Boolean> remove(@PathVariable("dynadashboard_id") String dynadashboard_id) {
         return ResponseEntity.status(HttpStatus.OK).body(dynadashboardService.remove(dynadashboard_id));
    }

    @PreAuthorize("hasPermission(this.dynadashboardService.getDynadashboardByIds(#ids),'pms-DynaDashboard-Remove')")
    @ApiOperation(value = "批量删除动态数据看板", tags = {"动态数据看板" },  notes = "批量删除动态数据看板")
	@RequestMapping(method = RequestMethod.DELETE, value = "/dynadashboards/batch")
    public ResponseEntity<Boolean> removeBatch(@RequestBody List<String> ids) {
        dynadashboardService.removeBatch(ids);
        return  ResponseEntity.status(HttpStatus.OK).body(true);
    }

    @PostAuthorize("hasPermission(this.dynadashboardMapping.toDomain(returnObject.body),'pms-DynaDashboard-Get')")
    @ApiOperation(value = "获取动态数据看板", tags = {"动态数据看板" },  notes = "获取动态数据看板")
	@RequestMapping(method = RequestMethod.GET, value = "/dynadashboards/{dynadashboard_id}")
    public ResponseEntity<DynaDashboardDTO> get(@PathVariable("dynadashboard_id") String dynadashboard_id) {
        DynaDashboard domain = dynadashboardService.get(dynadashboard_id);
        DynaDashboardDTO dto = dynadashboardMapping.toDto(domain);
        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

    @ApiOperation(value = "获取动态数据看板草稿", tags = {"动态数据看板" },  notes = "获取动态数据看板草稿")
	@RequestMapping(method = RequestMethod.GET, value = "/dynadashboards/getdraft")
    public ResponseEntity<DynaDashboardDTO> getDraft(DynaDashboardDTO dto) {
        DynaDashboard domain = dynadashboardMapping.toDomain(dto);
        return ResponseEntity.status(HttpStatus.OK).body(dynadashboardMapping.toDto(dynadashboardService.getDraft(domain)));
    }

    @ApiOperation(value = "检查动态数据看板", tags = {"动态数据看板" },  notes = "检查动态数据看板")
	@RequestMapping(method = RequestMethod.POST, value = "/dynadashboards/checkkey")
    public ResponseEntity<Boolean> checkKey(@RequestBody DynaDashboardDTO dynadashboarddto) {
        return  ResponseEntity.status(HttpStatus.OK).body(dynadashboardService.checkKey(dynadashboardMapping.toDomain(dynadashboarddto)));
    }

    @PreAuthorize("hasPermission(this.dynadashboardMapping.toDomain(#dynadashboarddto),'pms-DynaDashboard-Save')")
    @ApiOperation(value = "保存动态数据看板", tags = {"动态数据看板" },  notes = "保存动态数据看板")
	@RequestMapping(method = RequestMethod.POST, value = "/dynadashboards/save")
    public ResponseEntity<DynaDashboardDTO> save(@RequestBody DynaDashboardDTO dynadashboarddto) {
        DynaDashboard domain = dynadashboardMapping.toDomain(dynadashboarddto);
        dynadashboardService.save(domain);
        return ResponseEntity.status(HttpStatus.OK).body(dynadashboardMapping.toDto(domain));
    }

    @PreAuthorize("hasPermission(this.dynadashboardMapping.toDomain(#dynadashboarddtos),'pms-DynaDashboard-Save')")
    @ApiOperation(value = "批量保存动态数据看板", tags = {"动态数据看板" },  notes = "批量保存动态数据看板")
	@RequestMapping(method = RequestMethod.POST, value = "/dynadashboards/savebatch")
    public ResponseEntity<Boolean> saveBatch(@RequestBody List<DynaDashboardDTO> dynadashboarddtos) {
        dynadashboardService.saveBatch(dynadashboardMapping.toDomain(dynadashboarddtos));
        return  ResponseEntity.status(HttpStatus.OK).body(true);
    }

    @PreAuthorize("hasAnyAuthority('ROLE_SUPERADMIN','pms-DynaDashboard-searchDefault-all') and hasPermission(#context,'pms-DynaDashboard-Get')")
	@ApiOperation(value = "获取DEFAULT", tags = {"动态数据看板" } ,notes = "获取DEFAULT")
    @RequestMapping(method= RequestMethod.GET , value="/dynadashboards/fetchdefault")
	public ResponseEntity<List<DynaDashboardDTO>> fetchDefault(DynaDashboardSearchContext context) {
        Page<DynaDashboard> domains = dynadashboardService.searchDefault(context) ;
        List<DynaDashboardDTO> list = dynadashboardMapping.toDto(domains.getContent());
        return ResponseEntity.status(HttpStatus.OK)
                .header("x-page", String.valueOf(context.getPageable().getPageNumber()))
                .header("x-per-page", String.valueOf(context.getPageable().getPageSize()))
                .header("x-total", String.valueOf(domains.getTotalElements()))
                .body(list);
	}

    @PreAuthorize("hasAnyAuthority('ROLE_SUPERADMIN','pms-DynaDashboard-searchDefault-all') and hasPermission(#context,'pms-DynaDashboard-Get')")
	@ApiOperation(value = "查询DEFAULT", tags = {"动态数据看板" } ,notes = "查询DEFAULT")
    @RequestMapping(method= RequestMethod.POST , value="/dynadashboards/searchdefault")
	public ResponseEntity<Page<DynaDashboardDTO>> searchDefault(@RequestBody DynaDashboardSearchContext context) {
        Page<DynaDashboard> domains = dynadashboardService.searchDefault(context) ;
	    return ResponseEntity.status(HttpStatus.OK)
                .body(new PageImpl(dynadashboardMapping.toDto(domains.getContent()), context.getPageable(), domains.getTotalElements()));
	}



}

