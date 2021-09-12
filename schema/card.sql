CREATE TABLE `era` (
	`id`           INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '世代id',
	`region`       VARCHAR(8)   NOT NULL COMMENT '地区 [JPN, ENG, CHN, KOR]',
	`name`         JSON                  COMMENT '名称',
	`abbreviation` VARCHAR(8)   NOT NULL COMMENT '名称缩写',
	`data`         JSON                  COMMENT '扩展字段'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '世代';

CREATE TABLE `release` (
	`id`           INT UNSIGNED     NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '商品id',
	`type`         TINYINT UNSIGNED NOT NULL DEFAULT 0    COMMENT '商品类型 [0: Unknown, 1: MainSet, 2: SubSet, 3: Deck, 4: Promo, 5: Special, 6: Others]',
	`name`         JSON                                   COMMENT '名称',
	`abbreviation` VARCHAR(8)                DEFAULT NULL COMMENT '名称缩写',
	`shortcut`     VARCHAR(8)       NOT NULL              COMMENT '访问索引',
	`logo`         JSON                                   COMMENT 'oss存储路径',
	`era_id`       INT UNSIGNED     NOT NULL DEFAULT 0    COMMENT '所属世代',
	`data`         JSON                                   COMMENT '扩展字段',
	`release_date` BIGINT UNSIGNED  NOT NULL DEFAULT 0    COMMENT '发行日期',
	KEY idx_era (era_id),
	KEY idx_shortcut (shortcut)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '商品';

CREATE TABLE `card` (
	`id`           INT UNSIGNED     NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '卡牌id',
	`release_id`   INT UNSIGNED     NOT NULL DEFAULT 0    COMMENT '所属商品',
	`index`        VARCHAR(16)               DEFAULT NULL COMMENT '卡牌编号',
	`mark`         VARCHAR(8)                DEFAULT NULL COMMENT '稀有度标记',
	`type`         VARCHAR(16)      NOT NULL              COMMENT '属性 [POKEMON, TRAINER, ITEM, SUPPORTER, STADIUM, ENERGY]',
    `name`         JSON                                   COMMENT '名称',
    `holofoil`     TINYINT UNSIGNED NOT NULL DEFAULT 0    COMMENT '是否闪 [0: 否, 1: 是]',
    `edition`      TINYINT UNSIGNED NOT NULL DEFAULT 0    COMMENT '是否有1ED [0: 否, 1: 是]',
    `card`         VARCHAR(256)              DEFAULT NULL COMMENT 'oss存储路径',
    `data`         JSON                                   COMMENT '扩展字段',
    KEY idx_release (release_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '卡牌';