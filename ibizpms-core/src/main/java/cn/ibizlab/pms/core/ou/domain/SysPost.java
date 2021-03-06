package cn.ibizlab.pms.core.ou.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.math.BigInteger;
import java.util.HashMap;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.util.ObjectUtils;
import org.springframework.util.DigestUtils;
import cn.ibizlab.pms.util.domain.EntityBase;
import cn.ibizlab.pms.util.annotation.DEField;
import cn.ibizlab.pms.util.enums.DEPredefinedFieldType;
import cn.ibizlab.pms.util.enums.DEFieldDefaultValueType;
import cn.ibizlab.pms.util.helper.DataObject;
import cn.ibizlab.pms.util.enums.DupCheck;
import java.io.Serializable;
import lombok.*;
import org.springframework.data.annotation.Transient;
import cn.ibizlab.pms.util.annotation.Audit;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import cn.ibizlab.pms.util.domain.EntityClient;

/**
 * ServiceApi [岗位] 对象
 */
@Data
@ApiModel("岗位")
public class SysPost extends EntityClient implements Serializable {

    /**
     * 岗位标识
     */
    @DEField(defaultValue = "postcode", defaultValueType = DEFieldDefaultValueType.PARAM , isKeyField = true)
    @JSONField(name = "postid")
    @JsonProperty("postid")
    @ApiModelProperty("岗位标识")
    private String postid;

    /**
     * 岗位编码
     */
    @JSONField(name = "postcode")
    @JsonProperty("postcode")
    @ApiModelProperty("岗位编码")
    private String postcode;

    /**
     * 岗位名称
     */
    @JSONField(name = "postname")
    @JsonProperty("postname")
    @ApiModelProperty("岗位名称")
    private String postname;

    /**
     * 区属
     */
    @JSONField(name = "domains")
    @JsonProperty("domains")
    @ApiModelProperty("区属")
    private String domains;

    /**
     * 备注
     */
    @JSONField(name = "memo")
    @JsonProperty("memo")
    @ApiModelProperty("备注")
    private String memo;





    /**
     * 设置 [岗位编码]
     */
    public void setPostcode(String postcode) {
        this.postcode = postcode ;
        this.modify("postcode",postcode);
    }

    /**
     * 设置 [岗位名称]
     */
    public void setPostname(String postname) {
        this.postname = postname ;
        this.modify("postname",postname);
    }

    /**
     * 设置 [区属]
     */
    public void setDomains(String domains) {
        this.domains = domains ;
        this.modify("domains",domains);
    }

    /**
     * 设置 [备注]
     */
    public void setMemo(String memo) {
        this.memo = memo ;
        this.modify("memo",memo);
    }

    /**
     * 复制当前对象数据到目标对象(粘贴重置)
     * @param targetEntity 目标数据对象
     * @param bIncEmpty  是否包括空值
     * @param <T>
     * @return
     */
    @Override
    public <T> T copyTo(T targetEntity, boolean bIncEmpty) {
        this.reset("postid");
        return super.copyTo(targetEntity,bIncEmpty);
    }
}


