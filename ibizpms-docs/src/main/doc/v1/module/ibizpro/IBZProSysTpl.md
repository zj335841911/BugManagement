
# 实体-系统模板(IBZPRO_SYSTPL)
## 实体说明
系统模板

## 所属模块
[iBizPro模块](../ibizpro)

## 实体关系
### 1:N
无
### N:1
| 序号 | 关系实体 | 关系类型 |
| ---- | ---- | ---- |
| 1 | [附件（ZT_FILE）](../zentao/File) | （默认） |


## 实体属性
| 序号 | 属性 | 属性名 | 数据类型 | 主键 | 外键 | 允许为空 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1 | [系统模板标识](#属性-系统模板标识（IBZPRO_SYSTPLID）) | IBZPRO_SYSTPLID | 全局唯一标识，文本类型，用户不可见 | 是 | 否 | 否 |
| 2 | [建立人](#属性-建立人（CREATEMAN）) | CREATEMAN | 文本，可指定长度 | 否 | 否 | 否 |
| 3 | [建立时间](#属性-建立时间（CREATEDATE）) | CREATEDATE | 日期时间型 | 否 | 否 | 否 |
| 4 | [系统模板名称](#属性-系统模板名称（IBZPRO_SYSTPLNAME）) | IBZPRO_SYSTPLNAME | 文本，可指定长度 | 否 | 否 | 是 |
| 5 | [更新人](#属性-更新人（UPDATEMAN）) | UPDATEMAN | 文本，可指定长度 | 否 | 否 | 否 |
| 6 | [更新时间](#属性-更新时间（UPDATEDATE）) | UPDATEDATE | 日期时间型 | 否 | 否 | 否 |
| 7 | [是否公开](#属性-是否公开（PUBLIC）) | PUBLIC | 单项选择(文本值) | 否 | 否 | 是 |
| 8 | [来源对象](#属性-来源对象（IBIZ_SOURCEOBJECT）) | IBIZ_SOURCEOBJECT | 单项选择(文本值) | 否 | 否 | 是 |
| 9 | [模板内容](#属性-模板内容（CONTENT）) | CONTENT | 长文本，没有长度限制 | 否 | 否 | 是 |
| 10 | [IBIZ模板类型](#属性-IBIZ模板类型（TPLTYPE）) | TPLTYPE | 单项选择(文本值) | 否 | 否 | 是 |
| 11 | [id](#属性-id（FILE）) | FILE | 外键值 | 否 | 是 | 是 |

### 属性-系统模板标识（IBZPRO_SYSTPLID）
#### 属性说明
系统模板标识

- 是否是主键
是

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
全局唯一标识，文本类型，用户不可见

- Java类型
String

- 是否允许为空
否

- 默认值
无

- 取值范围/公式
无

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-建立人（CREATEMAN）
#### 属性说明
建立人

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
文本，可指定长度

- Java类型
String

- 是否允许为空
否

- 默认值
无

- 取值范围/公式
参照数据字典【[云系统操作者（SysOperator）](../../codelist/SysOperator)】

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-建立时间（CREATEDATE）
#### 属性说明
建立时间

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
日期时间型

- Java类型
Timestamp

- 是否允许为空
否

- 默认值
无

- 取值范围/公式
无

- 数据格式
yyyy-MM-dd HH:mm:ss

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-系统模板名称（IBZPRO_SYSTPLNAME）
#### 属性说明
系统模板名称

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
文本，可指定长度

- Java类型
String

- 是否允许为空
是

- 默认值
无

- 取值范围/公式
无

- 数据格式
无

- 是否支持快速搜索
是

- 搜索条件
| 序号 | 组合方式 |
| ---- | ---- |
| 1 | `%like%` |

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-更新人（UPDATEMAN）
#### 属性说明
更新人

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
文本，可指定长度

- Java类型
String

- 是否允许为空
否

- 默认值
无

- 取值范围/公式
参照数据字典【[云系统操作者（SysOperator）](../../codelist/SysOperator)】

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-更新时间（UPDATEDATE）
#### 属性说明
更新时间

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
日期时间型

- Java类型
Timestamp

- 是否允许为空
否

- 默认值
无

- 取值范围/公式
无

- 数据格式
yyyy-MM-dd HH:mm:ss

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-是否公开（PUBLIC）
#### 属性说明
是否公开

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
单项选择(文本值)

- Java类型
String

- 是否允许为空
是

- 默认值
| 项目 | 说明 |
| ---- | ---- |
| 类型 |  |
| 值 | 0 |

- 取值范围/公式
参照数据字典【[是否（数值）（YesNo2）](../../codelist/YesNo2)】

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
| 序号 | 组合方式 |
| ---- | ---- |
| 1 | `=` |

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-来源对象（IBIZ_SOURCEOBJECT）
#### 属性说明
来源对象

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
单项选择(文本值)

- Java类型
String

- 是否允许为空
是

- 默认值
无

- 取值范围/公式
参照数据字典【[来源对象（Ibizpro_story__sourceobject）](../../codelist/Ibizpro_story__sourceobject)】

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
| 序号 | 组合方式 |
| ---- | ---- |
| 1 | `=` |

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-模板内容（CONTENT）
#### 属性说明
模板内容

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
长文本，没有长度限制

- Java类型
String

- 是否允许为空
是

- 默认值
无

- 取值范围/公式
无

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
无

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-IBIZ模板类型（TPLTYPE）
#### 属性说明
IBIZ模板类型

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
单项选择(文本值)

- Java类型
String

- 是否允许为空
是

- 默认值
| 项目 | 说明 |
| ---- | ---- |
| 类型 |  |
| 值 | freemarker |

- 取值范围/公式
参照数据字典【[IBIZ模板类型（Ibz__systpl__type）](../../codelist/Ibz__systpl__type)】

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
| 序号 | 组合方式 |
| ---- | ---- |
| 1 | `=` |

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |

### 属性-id（FILE）
#### 属性说明
id

- 是否是主键
否

- 属性类型
物理字段[来自当前实体物理表字段]

- 数据类型
外键值

- Java类型
Long

- 是否允许为空
是

- 默认值
无

- 取值范围/公式
无

- 数据格式
无

- 是否支持快速搜索
否

- 搜索条件
| 序号 | 组合方式 |
| ---- | ---- |
| 1 | `=` |

#### 关系属性
| 项目 | 说明 |
| ---- | ---- |
| 关系实体 | [附件（ZT_FILE）](../zentao/File) |
| 关系属性 | [id（ID）](../zentao/File/#属性-id（ID）) |
| 关系类型 | 关系实体 1:N 当前实体 |


## 业务状态
无

## 实体行为
| 序号 | 行为 | 行为名 | 行为类型 | 行为持有者 |
| ---- | ---- | ---- | ---- | ---- |
| 1 | [Create](#实体行为-Create（Create）) | Create | 内置方法 | 后台及前台 |
| 2 | [Update](#实体行为-Update（Update）) | Update | 内置方法 | 后台及前台 |
| 3 | [Remove](#实体行为-Remove（Remove）) | Remove | 内置方法 | 后台及前台 |
| 4 | [Get](#实体行为-Get（Get）) | Get | 内置方法 | 后台及前台 |
| 5 | [GetDraft](#实体行为-GetDraft（GetDraft）) | GetDraft | 内置方法 | 后台及前台 |
| 6 | [CheckKey](#实体行为-CheckKey（CheckKey）) | CheckKey | 内置方法 | 后台及前台 |
| 7 | [Save](#实体行为-Save（Save）) | Save | 内置方法 | 后台及前台 |

### 实体行为-Create（Create）
#### 说明
Create

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-Update（Update）
#### 说明
Update

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-Remove（Remove）
#### 说明
Remove

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-Get（Get）
#### 说明
Get

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-GetDraft（GetDraft）
#### 说明
GetDraft

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-CheckKey（CheckKey）
#### 说明
CheckKey

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无
### 实体行为-Save（Save）
#### 说明
Save

- 行为类型
内置方法

- 行为持有者
后台及前台

#### 逻辑附加
无

## 逻辑处理
无

## 实体搜索
### 快速搜索项
| 序号 | 属性 |
| ---- | ---- |
| 1 | [系统模板名称（IBZPRO_SYSTPLNAME）](#属性-系统模板名称（IBZPRO_SYSTPLNAME）) |

### 搜索条件
| 序号 | 属性 | 组合方式 |
| ---- | ---- | ---- |
| 1 | [系统模板名称（IBZPRO_SYSTPLNAME）](#属性-系统模板名称（IBZPRO_SYSTPLNAME）) | `%like%` |
| 2 | [是否公开（PUBLIC）](#属性-是否公开（PUBLIC）) | `=` |
| 3 | [来源对象（IBIZ_SOURCEOBJECT）](#属性-来源对象（IBIZ_SOURCEOBJECT）) | `=` |
| 4 | [IBIZ模板类型（TPLTYPE）](#属性-IBIZ模板类型（TPLTYPE）) | `=` |
| 5 | [id（FILE）](#属性-id（FILE）) | `=` |

## 数据查询
| 序号 | 查询 | 查询名 | 默认 |
| ---- | ---- | ---- | ---- |
| 1 | [数据查询](#数据查询-数据查询（Default）) | Default | 否 |
| 2 | [默认（全部数据）](#数据查询-默认（全部数据）（View）) | View | 否 |

### 数据查询-数据查询（Default）
#### 说明
数据查询

- 默认查询
否

- 查询权限使用
否

#### SQL
- MYSQL5
```SQL
SELECT
t1.`CREATEDATE`,
t1.`CREATEMAN`,
t1.`FILE`,
t1.`IBIZ_SOURCEOBJECT`,
t1.`IBZPRO_SYSTPLID`,
t1.`IBZPRO_SYSTPLNAME`,
t1.`PUBLIC`,
t1.`TPLTYPE`,
t1.`UPDATEDATE`,
t1.`UPDATEMAN`
FROM `T_IBZPRO_SYSTPL` t1 

```
### 数据查询-默认（全部数据）（View）
#### 说明
默认（全部数据）

- 默认查询
否

- 查询权限使用
否

#### SQL
- MYSQL5
```SQL
SELECT
t1.`CONTENT`,
t1.`CREATEDATE`,
t1.`CREATEMAN`,
t1.`FILE`,
t1.`IBIZ_SOURCEOBJECT`,
t1.`IBZPRO_SYSTPLID`,
t1.`IBZPRO_SYSTPLNAME`,
t1.`PUBLIC`,
t1.`TPLTYPE`,
t1.`UPDATEDATE`,
t1.`UPDATEMAN`
FROM `T_IBZPRO_SYSTPL` t1 

```

## 数据集合
| 序号 | 集合 | 集合名 | 默认 |
| ---- | ---- | ---- | ---- |
| 1 | [数据集](#数据集合-数据集（Default）) | Default | 是 |

### 数据集合-数据集（Default）
#### 说明
数据集

- 默认集合
是

- 行为持有者
后台及前台

#### 关联的数据查询
| 序号 | 数据查询 |
| ---- | ---- |
| 1 | [数据查询（Default）](#数据查询-数据查询（Default）) |

## 数据导入
无

## 数据导出
无
