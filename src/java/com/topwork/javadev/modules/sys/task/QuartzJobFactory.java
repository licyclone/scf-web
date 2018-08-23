package com.topwork.javadev.modules.sys.task;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.topwork.javadev.modules.sys.entity.SysScheduleJob;
import com.topwork.javadev.modules.sys.utils.ScheduleUtils;

public class QuartzJobFactory extends QuartzJobBean {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		SysScheduleJob scheduleJob = (SysScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		ScheduleUtils.invokMethod(scheduleJob);
		
	}

}
