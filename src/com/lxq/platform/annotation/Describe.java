package com.lxq.platform.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 修饰POJO类
 * 描述类的说明
 * 描述字段的说明ww
 */

@Target({ElementType.TYPE,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Describe {
	String describe();
}