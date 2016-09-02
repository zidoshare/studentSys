package com.hudongwx.studentSys.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("stumanager_class", "classId", Class.class);
		arp.addMapping("stumanager_employee", "id", Employee.class);
		arp.addMapping("stumanager_mapping", "id", Mapping.class);
		arp.addMapping("stumanager_role", "id", Role.class);
		arp.addMapping("stumanager_student", "id", Student.class);
		arp.addMapping("stumanager_user", "id", User.class);
	}
}

