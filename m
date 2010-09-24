Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1Oz2xr-0007TE-96
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 09:45:06 +0200
Received: by qyk7 with SMTP id 7so608057qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u15F/q/Ue1QJwEHs9ZTY1h98QV9C7zmMd4ITJQ5MJww=;
	b=KgVPSzGEwFmEv+9lO4S2IR8xTRZ2IPOx6D7wgVolVWWc2833imVnbDxX7clyeeAq6F
	nkLiQz3tvNoBN9OUB47jrQHtOVcr21EcngEEtj1hfjmpK4yZ0L8s/c9Vv6zqOnnZpbhw
	+NPtmtptCatOWD2sGD58/RFsB1SXgS9Mf4QQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ErdHLatErayxid2gOsYRQ3qZvzzi1B2Y4S5bdUGPnLooKekOVPvDMVhx1WcgaFR9xT
	8sLCpj8/saSvl8BJuTJkfsyYp8EPXgTAQzw1bNPFoGa+gkrfWReV4UH3kV/nLCvWBChr
	wSdA6ZHxNeGIphofF2/9VbX37UOB5Hnh9rgnc=
MIME-Version: 1.0
Received: by 10.224.79.11 with SMTP id n11mr2141158qak.256.1285314294347; Fri,
	24 Sep 2010 00:44:54 -0700 (PDT)
Received: by 10.229.188.3 with HTTP; Fri, 24 Sep 2010 00:44:54 -0700 (PDT)
In-Reply-To: <1285162376-13725-2-git-send-email-michael.lippautz@gmail.com>
References: <1285162376-13725-1-git-send-email-michael.lippautz@gmail.com>
	<1285162376-13725-2-git-send-email-michael.lippautz@gmail.com>
Date: Fri, 24 Sep 2010 09:44:54 +0200
Message-ID: <AANLkTi=tXNAUutrtuYzGivcWFKkx50r8G4qSeMZZSj8X@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-igep2: Bump kernel to 2.6.33.7-0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Sep 2010 07:45:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ack

2010/9/22 Michael Lippautz <michael.lippautz@gmail.com>:
> * Kernel is released at http://labs.igep.es/index.php/The_Linux_kernel
>
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
> =C2=A0.../linux-igep2-2.6.33.7-0/igep0020/defconfig =C2=A0 =C2=A0 =C2=A0|=
 2495 ++++++++++++++++++++
> =C2=A0recipes/linux/linux-igep2_2.6.28.10-0.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/linux/linux-igep2_2.6.33.7-0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 20 +
> =C2=A03 files changed, 2516 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/linux/linux-igep2-2.6.33.7-0/igep0020/de=
fconfig
> =C2=A0create mode 100644 recipes/linux/linux-igep2_2.6.33.7-0.bb
>
> diff --git a/recipes/linux/linux-igep2-2.6.33.7-0/igep0020/defconfig b/re=
cipes/linux/linux-igep2-2.6.33.7-0/igep0020/defconfig
> new file mode 100644
> index 0000000..a2c0f8b
> --- /dev/null
> +++ b/recipes/linux/linux-igep2-2.6.33.7-0/igep0020/defconfig
> @@ -0,0 +1,2495 @@
> +#
> +# Automatically generated make config: don't edit
> +# Linux kernel version: 2.6.33.7
> +# Wed Aug 25 10:30:44 2010
> +#
> +CONFIG_ARM=3Dy
> +CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> +CONFIG_GENERIC_GPIO=3Dy
> +CONFIG_GENERIC_TIME=3Dy
> +CONFIG_GENERIC_CLOCKEVENTS=3Dy
> +CONFIG_HAVE_PROC_CPU=3Dy
> +CONFIG_GENERIC_HARDIRQS=3Dy
> +CONFIG_STACKTRACE_SUPPORT=3Dy
> +CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> +CONFIG_LOCKDEP_SUPPORT=3Dy
> +CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> +CONFIG_HARDIRQS_SW_RESEND=3Dy
> +CONFIG_GENERIC_IRQ_PROBE=3Dy
> +CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
> +CONFIG_ARCH_HAS_CPUFREQ=3Dy
> +CONFIG_GENERIC_HWEIGHT=3Dy
> +CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> +CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> +CONFIG_ARM_L1_CACHE_SHIFT_6=3Dy
> +CONFIG_VECTORS_BASE=3D0xffff0000
> +CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> +CONFIG_CONSTRUCTORS=3Dy
> +
> +#
> +# General setup
> +#
> +CONFIG_EXPERIMENTAL=3Dy
> +CONFIG_BROKEN_ON_SMP=3Dy
> +CONFIG_INIT_ENV_ARG_LIMIT=3D32
> +CONFIG_LOCALVERSION=3D""
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_HAVE_KERNEL_GZIP=3Dy
> +CONFIG_HAVE_KERNEL_LZO=3Dy
> +CONFIG_KERNEL_GZIP=3Dy
> +# CONFIG_KERNEL_BZIP2 is not set
> +# CONFIG_KERNEL_LZMA is not set
> +# CONFIG_KERNEL_LZO is not set
> +CONFIG_SWAP=3Dy
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_SYSVIPC_SYSCTL=3Dy
> +CONFIG_POSIX_MQUEUE=3Dy
> +CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> +CONFIG_BSD_PROCESS_ACCT=3Dy
> +CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> +# CONFIG_TASKSTATS is not set
> +# CONFIG_AUDIT is not set
> +
> +#
> +# RCU Subsystem
> +#
> +CONFIG_TREE_RCU=3Dy
> +# CONFIG_TREE_PREEMPT_RCU is not set
> +# CONFIG_TINY_RCU is not set
> +# CONFIG_RCU_TRACE is not set
> +CONFIG_RCU_FANOUT=3D32
> +# CONFIG_RCU_FANOUT_EXACT is not set
> +# CONFIG_TREE_RCU_TRACE is not set
> +# CONFIG_IKCONFIG is not set
> +CONFIG_LOG_BUF_SHIFT=3D17
> +CONFIG_CGROUPS=3Dy
> +# CONFIG_CGROUP_DEBUG is not set
> +# CONFIG_CGROUP_NS is not set
> +# CONFIG_CGROUP_FREEZER is not set
> +# CONFIG_CGROUP_DEVICE is not set
> +# CONFIG_CPUSETS is not set
> +# CONFIG_CGROUP_CPUACCT is not set
> +# CONFIG_RESOURCE_COUNTERS is not set
> +CONFIG_CGROUP_SCHED=3Dy
> +CONFIG_FAIR_GROUP_SCHED=3Dy
> +CONFIG_RT_GROUP_SCHED=3Dy
> +# CONFIG_SYSFS_DEPRECATED_V2 is not set
> +CONFIG_RELAY=3Dy
> +CONFIG_NAMESPACES=3Dy
> +CONFIG_UTS_NS=3Dy
> +CONFIG_IPC_NS=3Dy
> +# CONFIG_USER_NS is not set
> +# CONFIG_PID_NS is not set
> +CONFIG_NET_NS=3Dy
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D""
> +CONFIG_RD_GZIP=3Dy
> +CONFIG_RD_BZIP2=3Dy
> +CONFIG_RD_LZMA=3Dy
> +CONFIG_RD_LZO=3Dy
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> +CONFIG_SYSCTL=3Dy
> +CONFIG_ANON_INODES=3Dy
> +CONFIG_EMBEDDED=3Dy
> +CONFIG_UID16=3Dy
> +# CONFIG_SYSCTL_SYSCALL is not set
> +CONFIG_KALLSYMS=3Dy
> +# CONFIG_KALLSYMS_ALL is not set
> +CONFIG_KALLSYMS_EXTRA_PASS=3Dy
> +CONFIG_HOTPLUG=3Dy
> +CONFIG_PRINTK=3Dy
> +CONFIG_BUG=3Dy
> +CONFIG_ELF_CORE=3Dy
> +CONFIG_BASE_FULL=3Dy
> +CONFIG_FUTEX=3Dy
> +CONFIG_EPOLL=3Dy
> +CONFIG_SIGNALFD=3Dy
> +CONFIG_TIMERFD=3Dy
> +CONFIG_EVENTFD=3Dy
> +CONFIG_SHMEM=3Dy
> +CONFIG_AIO=3Dy
> +CONFIG_HAVE_PERF_EVENTS=3Dy
> +CONFIG_PERF_USE_VMALLOC=3Dy
> +
> +#
> +# Kernel Performance Events And Counters
> +#
> +CONFIG_PERF_EVENTS=3Dy
> +# CONFIG_PERF_COUNTERS is not set
> +# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> +CONFIG_VM_EVENT_COUNTERS=3Dy
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB=3Dy
> +# CONFIG_SLUB is not set
> +# CONFIG_SLOB is not set
> +# CONFIG_PROFILING is not set
> +CONFIG_HAVE_OPROFILE=3Dy
> +# CONFIG_KPROBES is not set
> +CONFIG_HAVE_KPROBES=3Dy
> +CONFIG_HAVE_KRETPROBES=3Dy
> +CONFIG_HAVE_CLK=3Dy
> +
> +#
> +# GCOV-based kernel profiling
> +#
> +# CONFIG_GCOV_KERNEL is not set
> +CONFIG_SLOW_WORK=3Dy
> +# CONFIG_SLOW_WORK_DEBUG is not set
> +CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> +CONFIG_SLABINFO=3Dy
> +CONFIG_RT_MUTEXES=3Dy
> +CONFIG_BASE_SMALL=3D0
> +CONFIG_MODULES=3Dy
> +CONFIG_MODULE_FORCE_LOAD=3Dy
> +CONFIG_MODULE_UNLOAD=3Dy
> +# CONFIG_MODULE_FORCE_UNLOAD is not set
> +# CONFIG_MODVERSIONS is not set
> +# CONFIG_MODULE_SRCVERSION_ALL is not set
> +CONFIG_BLOCK=3Dy
> +CONFIG_LBDAF=3Dy
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_BLK_DEV_INTEGRITY is not set
> +# CONFIG_BLK_CGROUP is not set
> +
> +#
> +# IO Schedulers
> +#
> +CONFIG_IOSCHED_NOOP=3Dy
> +CONFIG_IOSCHED_DEADLINE=3Dy
> +CONFIG_IOSCHED_CFQ=3Dy
> +# CONFIG_CFQ_GROUP_IOSCHED is not set
> +# CONFIG_DEFAULT_DEADLINE is not set
> +CONFIG_DEFAULT_CFQ=3Dy
> +# CONFIG_DEFAULT_NOOP is not set
> +CONFIG_DEFAULT_IOSCHED=3D"cfq"
> +# CONFIG_INLINE_SPIN_TRYLOCK is not set
> +# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> +# CONFIG_INLINE_SPIN_LOCK is not set
> +# CONFIG_INLINE_SPIN_LOCK_BH is not set
> +# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> +# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_SPIN_UNLOCK=3Dy
> +# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> +CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> +# CONFIG_INLINE_READ_TRYLOCK is not set
> +# CONFIG_INLINE_READ_LOCK is not set
> +# CONFIG_INLINE_READ_LOCK_BH is not set
> +# CONFIG_INLINE_READ_LOCK_IRQ is not set
> +# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_READ_UNLOCK=3Dy
> +# CONFIG_INLINE_READ_UNLOCK_BH is not set
> +CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> +# CONFIG_INLINE_WRITE_TRYLOCK is not set
> +# CONFIG_INLINE_WRITE_LOCK is not set
> +# CONFIG_INLINE_WRITE_LOCK_BH is not set
> +# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> +# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_WRITE_UNLOCK=3Dy
> +# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> +CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> +# CONFIG_MUTEX_SPIN_ON_OWNER is not set
> +# CONFIG_FREEZER is not set
> +
> +#
> +# System Type
> +#
> +CONFIG_MMU=3Dy
> +# CONFIG_ARCH_AAEC2000 is not set
> +# CONFIG_ARCH_INTEGRATOR is not set
> +# CONFIG_ARCH_REALVIEW is not set
> +# CONFIG_ARCH_VERSATILE is not set
> +# CONFIG_ARCH_AT91 is not set
> +# CONFIG_ARCH_CLPS711X is not set
> +# CONFIG_ARCH_GEMINI is not set
> +# CONFIG_ARCH_EBSA110 is not set
> +# CONFIG_ARCH_EP93XX is not set
> +# CONFIG_ARCH_FOOTBRIDGE is not set
> +# CONFIG_ARCH_MXC is not set
> +# CONFIG_ARCH_STMP3XXX is not set
> +# CONFIG_ARCH_NETX is not set
> +# CONFIG_ARCH_H720X is not set
> +# CONFIG_ARCH_NOMADIK is not set
> +# CONFIG_ARCH_IOP13XX is not set
> +# CONFIG_ARCH_IOP32X is not set
> +# CONFIG_ARCH_IOP33X is not set
> +# CONFIG_ARCH_IXP23XX is not set
> +# CONFIG_ARCH_IXP2000 is not set
> +# CONFIG_ARCH_IXP4XX is not set
> +# CONFIG_ARCH_L7200 is not set
> +# CONFIG_ARCH_DOVE is not set
> +# CONFIG_ARCH_KIRKWOOD is not set
> +# CONFIG_ARCH_LOKI is not set
> +# CONFIG_ARCH_MV78XX0 is not set
> +# CONFIG_ARCH_ORION5X is not set
> +# CONFIG_ARCH_MMP is not set
> +# CONFIG_ARCH_KS8695 is not set
> +# CONFIG_ARCH_NS9XXX is not set
> +# CONFIG_ARCH_W90X900 is not set
> +# CONFIG_ARCH_NUC93X is not set
> +# CONFIG_ARCH_PNX4008 is not set
> +# CONFIG_ARCH_PXA is not set
> +# CONFIG_ARCH_MSM is not set
> +# CONFIG_ARCH_RPC is not set
> +# CONFIG_ARCH_SA1100 is not set
> +# CONFIG_ARCH_S3C2410 is not set
> +# CONFIG_ARCH_S3C64XX is not set
> +# CONFIG_ARCH_S5PC1XX is not set
> +# CONFIG_ARCH_SHARK is not set
> +# CONFIG_ARCH_LH7A40X is not set
> +# CONFIG_ARCH_U300 is not set
> +# CONFIG_ARCH_DAVINCI is not set
> +CONFIG_ARCH_OMAP=3Dy
> +# CONFIG_ARCH_BCMRING is not set
> +# CONFIG_ARCH_U8500 is not set
> +
> +#
> +# TI OMAP Implementations
> +#
> +CONFIG_ARCH_OMAP_OTG=3Dy
> +# CONFIG_ARCH_OMAP1 is not set
> +CONFIG_ARCH_OMAP2PLUS=3Dy
> +# CONFIG_ARCH_OMAP2 is not set
> +CONFIG_ARCH_OMAP3=3Dy
> +# CONFIG_ARCH_OMAP4 is not set
> +
> +#
> +# OMAP Feature Selections
> +#
> +# CONFIG_OMAP_RESET_CLOCKS is not set
> +# CONFIG_OMAP_MUX is not set
> +CONFIG_OMAP_MCBSP=3Dy
> +CONFIG_OMAP_MBOX_FWK=3Dm
> +CONFIG_OMAP_IOMMU=3Dm
> +# CONFIG_OMAP_MPU_TIMER is not set
> +CONFIG_OMAP_32K_TIMER=3Dy
> +# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
> +CONFIG_OMAP_32K_TIMER_HZ=3D128
> +CONFIG_OMAP_DM_TIMER=3Dy
> +# CONFIG_OMAP_PM_NONE is not set
> +CONFIG_OMAP_PM_NOOP=3Dy
> +CONFIG_ARCH_OMAP3430=3Dy
> +CONFIG_OMAP_PACKAGE_CBB=3Dy
> +
> +#
> +# OMAP Board Type
> +#
> +# CONFIG_MACH_OMAP3_BEAGLE is not set
> +# CONFIG_MACH_DEVKIT8000 is not set
> +# CONFIG_MACH_OMAP_LDP is not set
> +# CONFIG_MACH_OVERO is not set
> +# CONFIG_MACH_OMAP3EVM is not set
> +# CONFIG_MACH_OMAP3517EVM is not set
> +# CONFIG_MACH_OMAP3_PANDORA is not set
> +# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
> +# CONFIG_MACH_OMAP_3430SDP is not set
> +# CONFIG_MACH_NOKIA_RX51 is not set
> +# CONFIG_MACH_OMAP_ZOOM2 is not set
> +# CONFIG_MACH_OMAP_ZOOM3 is not set
> +# CONFIG_MACH_CM_T35 is not set
> +CONFIG_MACH_IGEP0020=3Dy
> +CONFIG_MACH_IGEP0030=3Dy
> +# CONFIG_MACH_OMAP_3630SDP is not set
> +# CONFIG_OMAP3_EMU is not set
> +# CONFIG_OMAP3_SDRC_AC_TIMING is not set
> +
> +#
> +# Processor Type
> +#
> +CONFIG_CPU_32v6K=3Dy
> +CONFIG_CPU_V7=3Dy
> +CONFIG_CPU_32v7=3Dy
> +CONFIG_CPU_ABRT_EV7=3Dy
> +CONFIG_CPU_PABRT_V7=3Dy
> +CONFIG_CPU_CACHE_V7=3Dy
> +CONFIG_CPU_CACHE_VIPT=3Dy
> +CONFIG_CPU_COPY_V6=3Dy
> +CONFIG_CPU_TLB_V7=3Dy
> +CONFIG_CPU_HAS_ASID=3Dy
> +CONFIG_CPU_CP15=3Dy
> +CONFIG_CPU_CP15_MMU=3Dy
> +
> +#
> +# Processor Features
> +#
> +CONFIG_ARM_THUMB=3Dy
> +CONFIG_ARM_THUMBEE=3Dy
> +# CONFIG_CPU_ICACHE_DISABLE is not set
> +# CONFIG_CPU_DCACHE_DISABLE is not set
> +# CONFIG_CPU_BPREDICT_DISABLE is not set
> +CONFIG_HAS_TLS_REG=3Dy
> +CONFIG_ARM_L1_CACHE_SHIFT=3D6
> +CONFIG_CPU_HAS_PMU=3Dy
> +CONFIG_ARM_ERRATA_430973=3Dy
> +CONFIG_ARM_ERRATA_458693=3Dy
> +CONFIG_ARM_ERRATA_460075=3Dy
> +CONFIG_COMMON_CLKDEV=3Dy
> +
> +#
> +# Bus support
> +#
> +# CONFIG_PCI_SYSCALL is not set
> +# CONFIG_ARCH_SUPPORTS_MSI is not set
> +# CONFIG_PCCARD is not set
> +
> +#
> +# Kernel Features
> +#
> +CONFIG_TICK_ONESHOT=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> +CONFIG_VMSPLIT_3G=3Dy
> +# CONFIG_VMSPLIT_2G is not set
> +# CONFIG_VMSPLIT_1G is not set
> +CONFIG_PAGE_OFFSET=3D0xC0000000
> +# CONFIG_PREEMPT_NONE is not set
> +CONFIG_PREEMPT_VOLUNTARY=3Dy
> +# CONFIG_PREEMPT is not set
> +CONFIG_HZ=3D128
> +# CONFIG_THUMB2_KERNEL is not set
> +CONFIG_AEABI=3Dy
> +# CONFIG_OABI_COMPAT is not set
> +CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=3Dy
> +# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> +# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
> +# CONFIG_HIGHMEM is not set
> +CONFIG_HW_PERF_EVENTS=3Dy
> +CONFIG_SELECT_MEMORY_MODEL=3Dy
> +CONFIG_FLATMEM_MANUAL=3Dy
> +# CONFIG_DISCONTIGMEM_MANUAL is not set
> +# CONFIG_SPARSEMEM_MANUAL is not set
> +CONFIG_FLATMEM=3Dy
> +CONFIG_FLAT_NODE_MEM_MAP=3Dy
> +CONFIG_PAGEFLAGS_EXTENDED=3Dy
> +CONFIG_SPLIT_PTLOCK_CPUS=3D4
> +# CONFIG_PHYS_ADDR_T_64BIT is not set
> +CONFIG_ZONE_DMA_FLAG=3D0
> +CONFIG_VIRT_TO_BUS=3Dy
> +# CONFIG_KSM is not set
> +CONFIG_DEFAULT_MMAP_MIN_ADDR=3D32768
> +# CONFIG_LEDS is not set
> +CONFIG_ALIGNMENT_TRAP=3Dy
> +# CONFIG_UACCESS_WITH_MEMCPY is not set
> +
> +#
> +# Boot options
> +#
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D""
> +# CONFIG_XIP_KERNEL is not set
> +# CONFIG_KEXEC is not set
> +
> +#
> +# CPU Power Management
> +#
> +# CONFIG_CPU_FREQ is not set
> +# CONFIG_CPU_IDLE is not set
> +
> +#
> +# Floating point emulation
> +#
> +
> +#
> +# At least one emulation must be selected
> +#
> +CONFIG_VFP=3Dy
> +CONFIG_VFPv3=3Dy
> +CONFIG_NEON=3Dy
> +
> +#
> +# Userspace binary formats
> +#
> +CONFIG_BINFMT_ELF=3Dy
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_HAVE_AOUT=3Dy
> +CONFIG_BINFMT_AOUT=3Dm
> +CONFIG_BINFMT_MISC=3Dm
> +
> +#
> +# Power management options
> +#
> +CONFIG_PM=3Dy
> +# CONFIG_PM_DEBUG is not set
> +# CONFIG_SUSPEND is not set
> +# CONFIG_APM_EMULATION is not set
> +# CONFIG_PM_RUNTIME is not set
> +CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> +CONFIG_NET=3Dy
> +
> +#
> +# Networking options
> +#
> +CONFIG_PACKET=3Dy
> +# CONFIG_PACKET_MMAP is not set
> +CONFIG_UNIX=3Dy
> +CONFIG_XFRM=3Dy
> +CONFIG_XFRM_USER=3Dm
> +# CONFIG_XFRM_SUB_POLICY is not set
> +CONFIG_XFRM_MIGRATE=3Dy
> +# CONFIG_XFRM_STATISTICS is not set
> +CONFIG_XFRM_IPCOMP=3Dm
> +CONFIG_NET_KEY=3Dm
> +CONFIG_NET_KEY_MIGRATE=3Dy
> +CONFIG_INET=3Dy
> +CONFIG_IP_MULTICAST=3Dy
> +CONFIG_IP_ADVANCED_ROUTER=3Dy
> +CONFIG_ASK_IP_FIB_HASH=3Dy
> +# CONFIG_IP_FIB_TRIE is not set
> +CONFIG_IP_FIB_HASH=3Dy
> +CONFIG_IP_MULTIPLE_TABLES=3Dy
> +CONFIG_IP_ROUTE_MULTIPATH=3Dy
> +CONFIG_IP_ROUTE_VERBOSE=3Dy
> +CONFIG_IP_PNP=3Dy
> +CONFIG_IP_PNP_DHCP=3Dy
> +CONFIG_IP_PNP_BOOTP=3Dy
> +# CONFIG_IP_PNP_RARP is not set
> +CONFIG_NET_IPIP=3Dm
> +CONFIG_NET_IPGRE=3Dm
> +CONFIG_NET_IPGRE_BROADCAST=3Dy
> +CONFIG_IP_MROUTE=3Dy
> +CONFIG_IP_PIMSM_V1=3Dy
> +CONFIG_IP_PIMSM_V2=3Dy
> +# CONFIG_ARPD is not set
> +CONFIG_SYN_COOKIES=3Dy
> +CONFIG_INET_AH=3Dm
> +CONFIG_INET_ESP=3Dm
> +CONFIG_INET_IPCOMP=3Dm
> +CONFIG_INET_XFRM_TUNNEL=3Dm
> +CONFIG_INET_TUNNEL=3Dm
> +CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
> +CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
> +CONFIG_INET_XFRM_MODE_BEET=3Dm
> +CONFIG_INET_LRO=3Dy
> +CONFIG_INET_DIAG=3Dy
> +CONFIG_INET_TCP_DIAG=3Dy
> +CONFIG_TCP_CONG_ADVANCED=3Dy
> +CONFIG_TCP_CONG_BIC=3Dm
> +CONFIG_TCP_CONG_CUBIC=3Dy
> +CONFIG_TCP_CONG_WESTWOOD=3Dm
> +CONFIG_TCP_CONG_HTCP=3Dm
> +CONFIG_TCP_CONG_HSTCP=3Dm
> +CONFIG_TCP_CONG_HYBLA=3Dm
> +CONFIG_TCP_CONG_VEGAS=3Dm
> +CONFIG_TCP_CONG_SCALABLE=3Dm
> +CONFIG_TCP_CONG_LP=3Dm
> +CONFIG_TCP_CONG_VENO=3Dm
> +CONFIG_TCP_CONG_YEAH=3Dm
> +CONFIG_TCP_CONG_ILLINOIS=3Dm
> +# CONFIG_DEFAULT_BIC is not set
> +CONFIG_DEFAULT_CUBIC=3Dy
> +# CONFIG_DEFAULT_HTCP is not set
> +# CONFIG_DEFAULT_VEGAS is not set
> +# CONFIG_DEFAULT_WESTWOOD is not set
> +# CONFIG_DEFAULT_RENO is not set
> +CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> +# CONFIG_TCP_MD5SIG is not set
> +CONFIG_IPV6=3Dy
> +CONFIG_IPV6_PRIVACY=3Dy
> +# CONFIG_IPV6_ROUTER_PREF is not set
> +# CONFIG_IPV6_OPTIMISTIC_DAD is not set
> +CONFIG_INET6_AH=3Dm
> +CONFIG_INET6_ESP=3Dm
> +CONFIG_INET6_IPCOMP=3Dm
> +# CONFIG_IPV6_MIP6 is not set
> +CONFIG_INET6_XFRM_TUNNEL=3Dm
> +CONFIG_INET6_TUNNEL=3Dm
> +CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
> +CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
> +CONFIG_INET6_XFRM_MODE_BEET=3Dm
> +# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> +CONFIG_IPV6_SIT=3Dm
> +# CONFIG_IPV6_SIT_6RD is not set
> +CONFIG_IPV6_NDISC_NODETYPE=3Dy
> +CONFIG_IPV6_TUNNEL=3Dm
> +CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> +# CONFIG_IPV6_SUBTREES is not set
> +# CONFIG_IPV6_MROUTE is not set
> +# CONFIG_NETWORK_SECMARK is not set
> +# CONFIG_NETFILTER is not set
> +# CONFIG_IP_DCCP is not set
> +CONFIG_IP_SCTP=3Dm
> +# CONFIG_SCTP_DBG_MSG is not set
> +# CONFIG_SCTP_DBG_OBJCNT is not set
> +# CONFIG_SCTP_HMAC_NONE is not set
> +# CONFIG_SCTP_HMAC_SHA1 is not set
> +CONFIG_SCTP_HMAC_MD5=3Dy
> +# CONFIG_RDS is not set
> +# CONFIG_TIPC is not set
> +# CONFIG_ATM is not set
> +# CONFIG_BRIDGE is not set
> +# CONFIG_NET_DSA is not set
> +# CONFIG_VLAN_8021Q is not set
> +# CONFIG_DECNET is not set
> +# CONFIG_LLC2 is not set
> +# CONFIG_IPX is not set
> +# CONFIG_ATALK is not set
> +# CONFIG_X25 is not set
> +# CONFIG_LAPB is not set
> +# CONFIG_ECONET is not set
> +# CONFIG_WAN_ROUTER is not set
> +# CONFIG_PHONET is not set
> +# CONFIG_IEEE802154 is not set
> +# CONFIG_NET_SCHED is not set
> +# CONFIG_DCB is not set
> +
> +#
> +# Network testing
> +#
> +# CONFIG_NET_PKTGEN is not set
> +# CONFIG_HAMRADIO is not set
> +# CONFIG_CAN is not set
> +# CONFIG_IRDA is not set
> +CONFIG_BT=3Dm
> +CONFIG_BT_L2CAP=3Dm
> +CONFIG_BT_SCO=3Dm
> +CONFIG_BT_RFCOMM=3Dm
> +CONFIG_BT_RFCOMM_TTY=3Dy
> +CONFIG_BT_BNEP=3Dm
> +CONFIG_BT_BNEP_MC_FILTER=3Dy
> +CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> +CONFIG_BT_HIDP=3Dm
> +
> +#
> +# Bluetooth device drivers
> +#
> +CONFIG_BT_HCIBTUSB=3Dm
> +CONFIG_BT_HCIBTSDIO=3Dm
> +CONFIG_BT_HCIUART=3Dm
> +CONFIG_BT_HCIUART_H4=3Dy
> +CONFIG_BT_HCIUART_BCSP=3Dy
> +CONFIG_BT_HCIUART_LL=3Dy
> +CONFIG_BT_HCIBCM203X=3Dm
> +CONFIG_BT_HCIBPA10X=3Dm
> +CONFIG_BT_HCIBFUSB=3Dm
> +CONFIG_BT_HCIVHCI=3Dm
> +# CONFIG_BT_MRVL is not set
> +CONFIG_BT_ATH3K=3Dm
> +# CONFIG_AF_RXRPC is not set
> +CONFIG_FIB_RULES=3Dy
> +CONFIG_WIRELESS=3Dy
> +CONFIG_WIRELESS_EXT=3Dy
> +CONFIG_WEXT_CORE=3Dy
> +CONFIG_WEXT_PROC=3Dy
> +CONFIG_WEXT_SPY=3Dy
> +CONFIG_CFG80211=3Dm
> +# CONFIG_NL80211_TESTMODE is not set
> +# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> +# CONFIG_CFG80211_REG_DEBUG is not set
> +CONFIG_CFG80211_DEFAULT_PS=3Dy
> +CONFIG_CFG80211_DEBUGFS=3Dy
> +# CONFIG_WIRELESS_OLD_REGULATORY is not set
> +CONFIG_CFG80211_WEXT=3Dy
> +CONFIG_WIRELESS_EXT_SYSFS=3Dy
> +CONFIG_LIB80211=3Dm
> +# CONFIG_LIB80211_DEBUG is not set
> +CONFIG_MAC80211=3Dm
> +CONFIG_MAC80211_HAS_RC=3Dy
> +# CONFIG_MAC80211_RC_PID is not set
> +CONFIG_MAC80211_RC_MINSTREL=3Dy
> +# CONFIG_MAC80211_RC_DEFAULT_PID is not set
> +CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> +CONFIG_MAC80211_RC_DEFAULT=3D"minstrel"
> +CONFIG_MAC80211_MESH=3Dy
> +# CONFIG_MAC80211_LEDS is not set
> +CONFIG_MAC80211_DEBUGFS=3Dy
> +# CONFIG_MAC80211_DEBUG_MENU is not set
> +# CONFIG_WIMAX is not set
> +# CONFIG_RFKILL is not set
> +# CONFIG_NET_9P is not set
> +
> +#
> +# Device Drivers
> +#
> +
> +#
> +# Generic Driver Options
> +#
> +CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> +# CONFIG_DEVTMPFS is not set
> +CONFIG_STANDALONE=3Dy
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_FW_LOADER=3Dy
> +CONFIG_FIRMWARE_IN_KERNEL=3Dy
> +CONFIG_EXTRA_FIRMWARE=3D""
> +# CONFIG_DEBUG_DRIVER is not set
> +# CONFIG_DEBUG_DEVRES is not set
> +# CONFIG_SYS_HYPERVISOR is not set
> +CONFIG_CONNECTOR=3Dy
> +CONFIG_PROC_EVENTS=3Dy
> +CONFIG_MTD=3Dy
> +# CONFIG_MTD_DEBUG is not set
> +CONFIG_MTD_TESTS=3Dm
> +CONFIG_MTD_CONCAT=3Dm
> +CONFIG_MTD_PARTITIONS=3Dy
> +# CONFIG_MTD_REDBOOT_PARTS is not set
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +# CONFIG_MTD_AFS_PARTS is not set
> +# CONFIG_MTD_AR7_PARTS is not set
> +
> +#
> +# User Modules And Translation Layers
> +#
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLKDEVS=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +# CONFIG_FTL is not set
> +# CONFIG_NFTL is not set
> +# CONFIG_INFTL is not set
> +# CONFIG_RFD_FTL is not set
> +# CONFIG_SSFDC is not set
> +# CONFIG_MTD_OOPS is not set
> +
> +#
> +# RAM/ROM/Flash chip drivers
> +#
> +# CONFIG_MTD_CFI is not set
> +# CONFIG_MTD_JEDECPROBE is not set
> +CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> +CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> +CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> +# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> +CONFIG_MTD_CFI_I1=3Dy
> +CONFIG_MTD_CFI_I2=3Dy
> +# CONFIG_MTD_CFI_I4 is not set
> +# CONFIG_MTD_CFI_I8 is not set
> +# CONFIG_MTD_RAM is not set
> +# CONFIG_MTD_ROM is not set
> +# CONFIG_MTD_ABSENT is not set
> +
> +#
> +# Mapping drivers for chip access
> +#
> +# CONFIG_MTD_COMPLEX_MAPPINGS is not set
> +# CONFIG_MTD_PLATRAM is not set
> +
> +#
> +# Self-contained MTD device drivers
> +#
> +# CONFIG_MTD_DATAFLASH is not set
> +# CONFIG_MTD_M25P80 is not set
> +# CONFIG_MTD_SST25L is not set
> +# CONFIG_MTD_SLRAM is not set
> +# CONFIG_MTD_PHRAM is not set
> +# CONFIG_MTD_MTDRAM is not set
> +# CONFIG_MTD_BLOCK2MTD is not set
> +
> +#
> +# Disk-On-Chip Device Drivers
> +#
> +# CONFIG_MTD_DOC2000 is not set
> +# CONFIG_MTD_DOC2001 is not set
> +# CONFIG_MTD_DOC2001PLUS is not set
> +# CONFIG_MTD_NAND is not set
> +CONFIG_MTD_ONENAND=3Dy
> +# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> +# CONFIG_MTD_ONENAND_GENERIC is not set
> +CONFIG_MTD_ONENAND_OMAP2=3Dy
> +# CONFIG_MTD_ONENAND_OTP is not set
> +CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> +CONFIG_MTD_ONENAND_SIM=3Dm
> +
> +#
> +# LPDDR flash memory drivers
> +#
> +# CONFIG_MTD_LPDDR is not set
> +
> +#
> +# UBI - Unsorted block images
> +#
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> +CONFIG_MTD_UBI_BEB_RESERVE=3D1
> +CONFIG_MTD_UBI_GLUEBI=3Dm
> +
> +#
> +# UBI debugging options
> +#
> +# CONFIG_MTD_UBI_DEBUG is not set
> +# CONFIG_PARPORT is not set
> +CONFIG_BLK_DEV=3Dy
> +# CONFIG_BLK_DEV_COW_COMMON is not set
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
> +# CONFIG_BLK_DEV_DRBD is not set
> +CONFIG_BLK_DEV_NBD=3Dm
> +# CONFIG_BLK_DEV_UB is not set
> +CONFIG_BLK_DEV_RAM=3Dy
> +CONFIG_BLK_DEV_RAM_COUNT=3D1
> +CONFIG_BLK_DEV_RAM_SIZE=3D65536
> +# CONFIG_BLK_DEV_XIP is not set
> +# CONFIG_CDROM_PKTCDVD is not set
> +# CONFIG_ATA_OVER_ETH is not set
> +# CONFIG_MG_DISK is not set
> +CONFIG_MISC_DEVICES=3Dy
> +# CONFIG_AD525X_DPOT is not set
> +# CONFIG_ICS932S401 is not set
> +# CONFIG_ENCLOSURE_SERVICES is not set
> +# CONFIG_ISL29003 is not set
> +# CONFIG_DS1682 is not set
> +# CONFIG_TI_DAC7512 is not set
> +# CONFIG_C2PORT is not set
> +
> +#
> +# EEPROM support
> +#
> +CONFIG_EEPROM_AT24=3Dm
> +CONFIG_EEPROM_AT25=3Dm
> +# CONFIG_EEPROM_LEGACY is not set
> +CONFIG_EEPROM_MAX6875=3Dm
> +CONFIG_EEPROM_93CX6=3Dm
> +# CONFIG_IWMC3200TOP is not set
> +CONFIG_HAVE_IDE=3Dy
> +# CONFIG_IDE is not set
> +
> +#
> +# SCSI device support
> +#
> +# CONFIG_RAID_ATTRS is not set
> +CONFIG_SCSI=3Dy
> +CONFIG_SCSI_DMA=3Dy
> +# CONFIG_SCSI_TGT is not set
> +# CONFIG_SCSI_NETLINK is not set
> +CONFIG_SCSI_PROC_FS=3Dy
> +
> +#
> +# SCSI support type (disk, tape, CD-ROM)
> +#
> +CONFIG_BLK_DEV_SD=3Dy
> +# CONFIG_CHR_DEV_ST is not set
> +# CONFIG_CHR_DEV_OSST is not set
> +# CONFIG_BLK_DEV_SR is not set
> +# CONFIG_CHR_DEV_SG is not set
> +# CONFIG_CHR_DEV_SCH is not set
> +# CONFIG_SCSI_MULTI_LUN is not set
> +# CONFIG_SCSI_CONSTANTS is not set
> +# CONFIG_SCSI_LOGGING is not set
> +# CONFIG_SCSI_SCAN_ASYNC is not set
> +CONFIG_SCSI_WAIT_SCAN=3Dm
> +
> +#
> +# SCSI Transports
> +#
> +# CONFIG_SCSI_SPI_ATTRS is not set
> +# CONFIG_SCSI_FC_ATTRS is not set
> +# CONFIG_SCSI_ISCSI_ATTRS is not set
> +# CONFIG_SCSI_SAS_LIBSAS is not set
> +# CONFIG_SCSI_SRP_ATTRS is not set
> +CONFIG_SCSI_LOWLEVEL=3Dy
> +# CONFIG_ISCSI_TCP is not set
> +# CONFIG_LIBFC is not set
> +# CONFIG_LIBFCOE is not set
> +# CONFIG_SCSI_DEBUG is not set
> +# CONFIG_SCSI_DH is not set
> +# CONFIG_SCSI_OSD_INITIATOR is not set
> +# CONFIG_ATA is not set
> +# CONFIG_MD is not set
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_DUMMY=3Dm
> +# CONFIG_BONDING is not set
> +# CONFIG_MACVLAN is not set
> +CONFIG_EQUALIZER=3Dm
> +CONFIG_TUN=3Dm
> +CONFIG_VETH=3Dm
> +CONFIG_PHYLIB=3Dy
> +
> +#
> +# MII PHY device drivers
> +#
> +# CONFIG_MARVELL_PHY is not set
> +# CONFIG_DAVICOM_PHY is not set
> +# CONFIG_QSEMI_PHY is not set
> +# CONFIG_LXT_PHY is not set
> +# CONFIG_CICADA_PHY is not set
> +# CONFIG_VITESSE_PHY is not set
> +# CONFIG_SMSC_PHY is not set
> +# CONFIG_BROADCOM_PHY is not set
> +# CONFIG_ICPLUS_PHY is not set
> +# CONFIG_REALTEK_PHY is not set
> +# CONFIG_NATIONAL_PHY is not set
> +# CONFIG_STE10XP is not set
> +# CONFIG_LSI_ET1011C_PHY is not set
> +# CONFIG_FIXED_PHY is not set
> +# CONFIG_MDIO_BITBANG is not set
> +CONFIG_NET_ETHERNET=3Dy
> +CONFIG_MII=3Dy
> +# CONFIG_AX88796 is not set
> +# CONFIG_SMC91X is not set
> +# CONFIG_TI_DAVINCI_EMAC is not set
> +# CONFIG_DM9000 is not set
> +# CONFIG_ENC28J60 is not set
> +# CONFIG_ETHOC is not set
> +# CONFIG_SMC911X is not set
> +CONFIG_SMSC911X=3Dy
> +# CONFIG_DNET is not set
> +# CONFIG_IBM_NEW_EMAC_ZMII is not set
> +# CONFIG_IBM_NEW_EMAC_RGMII is not set
> +# CONFIG_IBM_NEW_EMAC_TAH is not set
> +# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
> +# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
> +# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
> +# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
> +# CONFIG_B44 is not set
> +# CONFIG_KS8842 is not set
> +# CONFIG_KS8851 is not set
> +# CONFIG_KS8851_MLL is not set
> +# CONFIG_NETDEV_1000 is not set
> +# CONFIG_NETDEV_10000 is not set
> +CONFIG_WLAN=3Dy
> +# CONFIG_LIBERTAS_THINFIRM is not set
> +# CONFIG_AT76C50X_USB is not set
> +# CONFIG_USB_ZD1201 is not set
> +# CONFIG_USB_NET_RNDIS_WLAN is not set
> +# CONFIG_RTL8187 is not set
> +# CONFIG_MAC80211_HWSIM is not set
> +# CONFIG_ATH_COMMON is not set
> +# CONFIG_B43 is not set
> +# CONFIG_B43LEGACY is not set
> +# CONFIG_HOSTAP is not set
> +# CONFIG_IWM is not set
> +CONFIG_LIBERTAS=3Dm
> +CONFIG_LIBERTAS_USB=3Dm
> +CONFIG_LIBERTAS_SDIO=3Dm
> +# CONFIG_LIBERTAS_SPI is not set
> +CONFIG_LIBERTAS_DEBUG=3Dy
> +CONFIG_LIBERTAS_MESH=3Dy
> +# CONFIG_P54_COMMON is not set
> +# CONFIG_RT2X00 is not set
> +# CONFIG_WL12XX is not set
> +# CONFIG_ZD1211RW is not set
> +
> +#
> +# Enable WiMAX (Networking options) to see the WiMAX drivers
> +#
> +
> +#
> +# USB Network Adapters
> +#
> +# CONFIG_USB_CATC is not set
> +CONFIG_USB_KAWETH=3Dm
> +CONFIG_USB_PEGASUS=3Dm
> +# CONFIG_USB_RTL8150 is not set
> +CONFIG_USB_USBNET=3Dm
> +CONFIG_USB_NET_AX8817X=3Dm
> +CONFIG_USB_NET_CDCETHER=3Dm
> +CONFIG_USB_NET_CDC_EEM=3Dm
> +CONFIG_USB_NET_DM9601=3Dm
> +CONFIG_USB_NET_SMSC95XX=3Dm
> +CONFIG_USB_NET_GL620A=3Dm
> +CONFIG_USB_NET_NET1080=3Dm
> +CONFIG_USB_NET_PLUSB=3Dm
> +CONFIG_USB_NET_MCS7830=3Dm
> +CONFIG_USB_NET_RNDIS_HOST=3Dm
> +CONFIG_USB_NET_CDC_SUBSET=3Dm
> +CONFIG_USB_ALI_M5632=3Dy
> +CONFIG_USB_AN2720=3Dy
> +CONFIG_USB_BELKIN=3Dy
> +CONFIG_USB_ARMLINUX=3Dy
> +# CONFIG_USB_EPSON2888 is not set
> +# CONFIG_USB_KC2190 is not set
> +CONFIG_USB_NET_ZAURUS=3Dm
> +# CONFIG_USB_NET_INT51X1 is not set
> +# CONFIG_WAN is not set
> +CONFIG_PPP=3Dm
> +CONFIG_PPP_MULTILINK=3Dy
> +CONFIG_PPP_FILTER=3Dy
> +CONFIG_PPP_ASYNC=3Dm
> +CONFIG_PPP_SYNC_TTY=3Dm
> +CONFIG_PPP_DEFLATE=3Dm
> +CONFIG_PPP_BSDCOMP=3Dm
> +CONFIG_PPP_MPPE=3Dm
> +CONFIG_PPPOE=3Dm
> +CONFIG_PPPOL2TP=3Dm
> +CONFIG_SLIP=3Dm
> +CONFIG_SLIP_COMPRESSED=3Dy
> +CONFIG_SLHC=3Dm
> +CONFIG_SLIP_SMART=3Dy
> +CONFIG_SLIP_MODE_SLIP6=3Dy
> +# CONFIG_NETCONSOLE is not set
> +# CONFIG_NETPOLL is not set
> +# CONFIG_NET_POLL_CONTROLLER is not set
> +# CONFIG_ISDN is not set
> +# CONFIG_PHONE is not set
> +
> +#
> +# Input device support
> +#
> +CONFIG_INPUT=3Dy
> +CONFIG_INPUT_FF_MEMLESS=3Dm
> +# CONFIG_INPUT_POLLDEV is not set
> +# CONFIG_INPUT_SPARSEKMAP is not set
> +
> +#
> +# Userland interfaces
> +#
> +CONFIG_INPUT_MOUSEDEV=3Dy
> +CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> +# CONFIG_INPUT_JOYDEV is not set
> +CONFIG_INPUT_EVDEV=3Dy
> +# CONFIG_INPUT_EVBUG is not set
> +
> +#
> +# Input Device Drivers
> +#
> +CONFIG_INPUT_KEYBOARD=3Dy
> +# CONFIG_KEYBOARD_ADP5588 is not set
> +# CONFIG_KEYBOARD_ATKBD is not set
> +# CONFIG_QT2160 is not set
> +# CONFIG_KEYBOARD_LKKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +# CONFIG_KEYBOARD_MATRIX is not set
> +# CONFIG_KEYBOARD_LM8323 is not set
> +# CONFIG_KEYBOARD_MAX7359 is not set
> +# CONFIG_KEYBOARD_NEWTON is not set
> +# CONFIG_KEYBOARD_OPENCORES is not set
> +# CONFIG_KEYBOARD_STOWAWAY is not set
> +# CONFIG_KEYBOARD_SUNKBD is not set
> +CONFIG_KEYBOARD_TWL4030=3Dm
> +# CONFIG_KEYBOARD_XTKBD is not set
> +CONFIG_INPUT_MOUSE=3Dy
> +# CONFIG_MOUSE_PS2 is not set
> +# CONFIG_MOUSE_SERIAL is not set
> +# CONFIG_MOUSE_APPLETOUCH is not set
> +# CONFIG_MOUSE_BCM5974 is not set
> +# CONFIG_MOUSE_VSXXXAA is not set
> +# CONFIG_MOUSE_GPIO is not set
> +# CONFIG_MOUSE_SYNAPTICS_I2C is not set
> +# CONFIG_INPUT_JOYSTICK is not set
> +# CONFIG_INPUT_TABLET is not set
> +# CONFIG_INPUT_TOUCHSCREEN is not set
> +CONFIG_INPUT_MISC=3Dy
> +CONFIG_INPUT_ATI_REMOTE=3Dm
> +CONFIG_INPUT_ATI_REMOTE2=3Dm
> +# CONFIG_INPUT_KEYSPAN_REMOTE is not set
> +# CONFIG_INPUT_POWERMATE is not set
> +CONFIG_INPUT_YEALINK=3Dm
> +CONFIG_INPUT_CM109=3Dm
> +CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
> +CONFIG_INPUT_UINPUT=3Dm
> +CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> +
> +#
> +# Hardware I/O ports
> +#
> +CONFIG_SERIO=3Dy
> +CONFIG_SERIO_SERPORT=3Dy
> +CONFIG_SERIO_LIBPS2=3Dy
> +# CONFIG_SERIO_RAW is not set
> +# CONFIG_SERIO_ALTERA_PS2 is not set
> +# CONFIG_GAMEPORT is not set
> +
> +#
> +# Character devices
> +#
> +CONFIG_VT=3Dy
> +CONFIG_CONSOLE_TRANSLATIONS=3Dy
> +CONFIG_VT_CONSOLE=3Dy
> +CONFIG_HW_CONSOLE=3Dy
> +CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> +# CONFIG_DEVKMEM is not set
> +# CONFIG_SERIAL_NONSTANDARD is not set
> +
> +#
> +# Serial drivers
> +#
> +CONFIG_SERIAL_8250=3Dy
> +CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D32
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> +CONFIG_SERIAL_8250_EXTENDED=3Dy
> +CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> +CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> +CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> +CONFIG_SERIAL_8250_RSA=3Dy
> +
> +#
> +# Non-8250 serial port support
> +#
> +# CONFIG_SERIAL_MAX3100 is not set
> +CONFIG_SERIAL_CORE=3Dy
> +CONFIG_SERIAL_CORE_CONSOLE=3Dy
> +
> +#
> +# serial port extensions
> +#
> +CONFIG_SERIAL_PORT_DIRECTION_CONTROL=3Dy
> +CONFIG_UNIX98_PTYS=3Dy
> +# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> +CONFIG_LEGACY_PTYS=3Dy
> +CONFIG_LEGACY_PTY_COUNT=3D16
> +# CONFIG_IPMI_HANDLER is not set
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_R3964 is not set
> +# CONFIG_RAW_DRIVER is not set
> +# CONFIG_TCG_TPM is not set
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_BOARDINFO=3Dy
> +CONFIG_I2C_COMPAT=3Dy
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_I2C_HELPER_AUTO=3Dy
> +CONFIG_I2C_ALGOBIT=3Dm
> +
> +#
> +# I2C Hardware Bus support
> +#
> +
> +#
> +# I2C system bus drivers (mostly embedded / system-on-chip)
> +#
> +# CONFIG_I2C_DESIGNWARE is not set
> +# CONFIG_I2C_GPIO is not set
> +# CONFIG_I2C_OCORES is not set
> +CONFIG_I2C_OMAP=3Dy
> +# CONFIG_I2C_SIMTEC is not set
> +
> +#
> +# External I2C/SMBus adapter drivers
> +#
> +# CONFIG_I2C_PARPORT_LIGHT is not set
> +# CONFIG_I2C_TAOS_EVM is not set
> +# CONFIG_I2C_TINY_USB is not set
> +
> +#
> +# Other I2C/SMBus bus drivers
> +#
> +# CONFIG_I2C_PCA_PLATFORM is not set
> +# CONFIG_I2C_STUB is not set
> +
> +#
> +# Miscellaneous I2C Chip support
> +#
> +# CONFIG_SENSORS_TSL2550 is not set
> +# CONFIG_I2C_DEBUG_CORE is not set
> +# CONFIG_I2C_DEBUG_ALGO is not set
> +# CONFIG_I2C_DEBUG_BUS is not set
> +# CONFIG_I2C_DEBUG_CHIP is not set
> +CONFIG_SPI=3Dy
> +# CONFIG_SPI_DEBUG is not set
> +CONFIG_SPI_MASTER=3Dy
> +
> +#
> +# SPI Master Controller Drivers
> +#
> +# CONFIG_SPI_BITBANG is not set
> +# CONFIG_SPI_GPIO is not set
> +CONFIG_SPI_OMAP24XX=3Dy
> +# CONFIG_SPI_XILINX is not set
> +# CONFIG_SPI_DESIGNWARE is not set
> +
> +#
> +# SPI Protocol Masters
> +#
> +CONFIG_SPI_SPIDEV=3Dy
> +# CONFIG_SPI_TLE62X0 is not set
> +
> +#
> +# PPS support
> +#
> +CONFIG_PPS=3Dm
> +# CONFIG_PPS_DEBUG is not set
> +CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
> +CONFIG_GPIOLIB=3Dy
> +# CONFIG_DEBUG_GPIO is not set
> +CONFIG_GPIO_SYSFS=3Dy
> +
> +#
> +# Memory mapped GPIO expanders:
> +#
> +
> +#
> +# I2C GPIO expanders:
> +#
> +# CONFIG_GPIO_MAX732X is not set
> +# CONFIG_GPIO_PCA953X is not set
> +# CONFIG_GPIO_PCF857X is not set
> +CONFIG_GPIO_TWL4030=3Dy
> +# CONFIG_GPIO_ADP5588 is not set
> +
> +#
> +# PCI GPIO expanders:
> +#
> +
> +#
> +# SPI GPIO expanders:
> +#
> +# CONFIG_GPIO_MAX7301 is not set
> +# CONFIG_GPIO_MCP23S08 is not set
> +# CONFIG_GPIO_MC33880 is not set
> +
> +#
> +# AC97 GPIO expanders:
> +#
> +# CONFIG_W1 is not set
> +CONFIG_POWER_SUPPLY=3Dy
> +# CONFIG_POWER_SUPPLY_DEBUG is not set
> +# CONFIG_PDA_POWER is not set
> +# CONFIG_BATTERY_DS2760 is not set
> +# CONFIG_BATTERY_DS2782 is not set
> +# CONFIG_BATTERY_BQ27x00 is not set
> +# CONFIG_BATTERY_MAX17040 is not set
> +CONFIG_HWMON=3Dy
> +# CONFIG_HWMON_VID is not set
> +# CONFIG_HWMON_DEBUG_CHIP is not set
> +
> +#
> +# Native drivers
> +#
> +# CONFIG_SENSORS_AD7414 is not set
> +# CONFIG_SENSORS_AD7418 is not set
> +# CONFIG_SENSORS_ADCXX is not set
> +# CONFIG_SENSORS_ADM1021 is not set
> +# CONFIG_SENSORS_ADM1025 is not set
> +# CONFIG_SENSORS_ADM1026 is not set
> +# CONFIG_SENSORS_ADM1029 is not set
> +# CONFIG_SENSORS_ADM1031 is not set
> +# CONFIG_SENSORS_ADM9240 is not set
> +# CONFIG_SENSORS_ADT7462 is not set
> +# CONFIG_SENSORS_ADT7470 is not set
> +# CONFIG_SENSORS_ADT7473 is not set
> +# CONFIG_SENSORS_ADT7475 is not set
> +# CONFIG_SENSORS_ATXP1 is not set
> +# CONFIG_SENSORS_DS1621 is not set
> +# CONFIG_SENSORS_F71805F is not set
> +# CONFIG_SENSORS_F71882FG is not set
> +# CONFIG_SENSORS_F75375S is not set
> +# CONFIG_SENSORS_G760A is not set
> +# CONFIG_SENSORS_GL518SM is not set
> +# CONFIG_SENSORS_GL520SM is not set
> +# CONFIG_SENSORS_IT87 is not set
> +# CONFIG_SENSORS_LM63 is not set
> +# CONFIG_SENSORS_LM70 is not set
> +# CONFIG_SENSORS_LM73 is not set
> +# CONFIG_SENSORS_LM75 is not set
> +# CONFIG_SENSORS_LM77 is not set
> +# CONFIG_SENSORS_LM78 is not set
> +# CONFIG_SENSORS_LM80 is not set
> +# CONFIG_SENSORS_LM83 is not set
> +# CONFIG_SENSORS_LM85 is not set
> +# CONFIG_SENSORS_LM87 is not set
> +# CONFIG_SENSORS_LM90 is not set
> +# CONFIG_SENSORS_LM92 is not set
> +# CONFIG_SENSORS_LM93 is not set
> +# CONFIG_SENSORS_LTC4215 is not set
> +# CONFIG_SENSORS_LTC4245 is not set
> +# CONFIG_SENSORS_LM95241 is not set
> +# CONFIG_SENSORS_MAX1111 is not set
> +# CONFIG_SENSORS_MAX1619 is not set
> +# CONFIG_SENSORS_MAX6650 is not set
> +# CONFIG_SENSORS_PC87360 is not set
> +# CONFIG_SENSORS_PC87427 is not set
> +# CONFIG_SENSORS_PCF8591 is not set
> +# CONFIG_SENSORS_SHT15 is not set
> +# CONFIG_SENSORS_DME1737 is not set
> +# CONFIG_SENSORS_SMSC47M1 is not set
> +# CONFIG_SENSORS_SMSC47M192 is not set
> +# CONFIG_SENSORS_SMSC47B397 is not set
> +# CONFIG_SENSORS_ADS7828 is not set
> +# CONFIG_SENSORS_AMC6821 is not set
> +# CONFIG_SENSORS_THMC50 is not set
> +# CONFIG_SENSORS_TMP401 is not set
> +# CONFIG_SENSORS_TMP421 is not set
> +# CONFIG_SENSORS_VT1211 is not set
> +# CONFIG_SENSORS_W83781D is not set
> +# CONFIG_SENSORS_W83791D is not set
> +# CONFIG_SENSORS_W83792D is not set
> +# CONFIG_SENSORS_W83793 is not set
> +# CONFIG_SENSORS_W83L785TS is not set
> +# CONFIG_SENSORS_W83L786NG is not set
> +# CONFIG_SENSORS_W83627HF is not set
> +# CONFIG_SENSORS_W83627EHF is not set
> +# CONFIG_SENSORS_LIS3_SPI is not set
> +# CONFIG_SENSORS_LIS3_I2C is not set
> +CONFIG_THERMAL=3Dm
> +CONFIG_THERMAL_HWMON=3Dy
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_WATCHDOG_NOWAYOUT=3Dy
> +
> +#
> +# Watchdog Device Drivers
> +#
> +CONFIG_SOFT_WATCHDOG=3Dm
> +CONFIG_OMAP_WATCHDOG=3Dm
> +CONFIG_TWL4030_WATCHDOG=3Dm
> +
> +#
> +# USB-based Watchdog Cards
> +#
> +# CONFIG_USBPCWATCHDOG is not set
> +CONFIG_SSB_POSSIBLE=3Dy
> +
> +#
> +# Sonics Silicon Backplane
> +#
> +CONFIG_SSB=3Dm
> +CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> +# CONFIG_SSB_SDIOHOST is not set
> +# CONFIG_SSB_SILENT is not set
> +# CONFIG_SSB_DEBUG is not set
> +
> +#
> +# Multifunction device drivers
> +#
> +CONFIG_MFD_CORE=3Dy
> +# CONFIG_MFD_SM501 is not set
> +# CONFIG_MFD_ASIC3 is not set
> +# CONFIG_HTC_EGPIO is not set
> +# CONFIG_HTC_PASIC3 is not set
> +# CONFIG_TPS65010 is not set
> +CONFIG_TWL4030_CORE=3Dy
> +CONFIG_TWL4030_POWER=3Dy
> +CONFIG_TWL4030_CODEC=3Dy
> +# CONFIG_MFD_TMIO is not set
> +# CONFIG_MFD_T7L66XB is not set
> +# CONFIG_MFD_TC6387XB is not set
> +# CONFIG_MFD_TC6393XB is not set
> +# CONFIG_PMIC_DA903X is not set
> +# CONFIG_PMIC_ADP5520 is not set
> +# CONFIG_MFD_WM8400 is not set
> +# CONFIG_MFD_WM831X is not set
> +# CONFIG_MFD_WM8350_I2C is not set
> +# CONFIG_MFD_PCF50633 is not set
> +# CONFIG_MFD_MC13783 is not set
> +# CONFIG_AB3100_CORE is not set
> +# CONFIG_EZX_PCAP is not set
> +# CONFIG_MFD_88PM8607 is not set
> +# CONFIG_AB4500_CORE is not set
> +CONFIG_REGULATOR=3Dy
> +# CONFIG_REGULATOR_DEBUG is not set
> +# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
> +# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> +# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> +# CONFIG_REGULATOR_BQ24022 is not set
> +# CONFIG_REGULATOR_MAX1586 is not set
> +# CONFIG_REGULATOR_MAX8660 is not set
> +CONFIG_REGULATOR_TWL4030=3Dy
> +# CONFIG_REGULATOR_LP3971 is not set
> +# CONFIG_REGULATOR_TPS65023 is not set
> +# CONFIG_REGULATOR_TPS6507X is not set
> +CONFIG_MEDIA_SUPPORT=3Dy
> +
> +#
> +# Multimedia core support
> +#
> +CONFIG_VIDEO_DEV=3Dm
> +CONFIG_VIDEO_V4L2_COMMON=3Dm
> +CONFIG_VIDEO_ALLOW_V4L1=3Dy
> +CONFIG_VIDEO_V4L1_COMPAT=3Dy
> +CONFIG_DVB_CORE=3Dm
> +CONFIG_VIDEO_MEDIA=3Dm
> +
> +#
> +# Multimedia drivers
> +#
> +CONFIG_IR_CORE=3Dy
> +CONFIG_VIDEO_IR=3Dy
> +CONFIG_MEDIA_ATTACH=3Dy
> +CONFIG_MEDIA_TUNER=3Dm
> +# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
> +CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> +CONFIG_MEDIA_TUNER_TDA8290=3Dm
> +CONFIG_MEDIA_TUNER_TDA18271=3Dm
> +CONFIG_MEDIA_TUNER_TDA9887=3Dm
> +CONFIG_MEDIA_TUNER_TEA5761=3Dm
> +CONFIG_MEDIA_TUNER_TEA5767=3Dm
> +CONFIG_MEDIA_TUNER_MT20XX=3Dm
> +CONFIG_MEDIA_TUNER_XC2028=3Dm
> +CONFIG_MEDIA_TUNER_XC5000=3Dm
> +CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> +CONFIG_MEDIA_TUNER_MC44S803=3Dm
> +CONFIG_VIDEO_V4L2=3Dm
> +CONFIG_VIDEO_V4L1=3Dm
> +CONFIG_VIDEOBUF_GEN=3Dm
> +CONFIG_VIDEOBUF_DMA_SG=3Dm
> +CONFIG_VIDEOBUF_VMALLOC=3Dm
> +CONFIG_VIDEOBUF_DMA_CONTIG=3Dm
> +CONFIG_VIDEOBUF_DVB=3Dm
> +CONFIG_VIDEO_TVEEPROM=3Dm
> +CONFIG_VIDEO_TUNER=3Dm
> +CONFIG_VIDEO_CAPTURE_DRIVERS=3Dy
> +# CONFIG_VIDEO_ADV_DEBUG is not set
> +# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> +CONFIG_VIDEO_HELPER_CHIPS_AUTO=3Dy
> +CONFIG_VIDEO_IR_I2C=3Dm
> +CONFIG_VIDEO_MSP3400=3Dm
> +CONFIG_VIDEO_CS53L32A=3Dm
> +CONFIG_VIDEO_WM8775=3Dm
> +CONFIG_VIDEO_MT9V011=3Dm
> +CONFIG_VIDEO_SAA711X=3Dm
> +CONFIG_VIDEO_TVP5150=3Dm
> +CONFIG_VIDEO_CX25840=3Dm
> +CONFIG_VIDEO_CX2341X=3Dm
> +CONFIG_VIDEO_VIVI=3Dm
> +# CONFIG_VIDEO_CPIA is not set
> +CONFIG_VIDEO_CPIA2=3Dm
> +CONFIG_VIDEO_SAA5246A=3Dm
> +CONFIG_VIDEO_SAA5249=3Dm
> +CONFIG_VIDEO_AU0828=3Dm
> +CONFIG_VIDEO_OMAP3=3Dm
> +CONFIG_VIDEO_OMAP34XX_ISP_PREVIEWER=3Dm
> +CONFIG_VIDEO_OMAP34XX_ISP_RESIZER=3Dm
> +CONFIG_SOC_CAMERA=3Dm
> +CONFIG_SOC_CAMERA_MT9M001=3Dm
> +CONFIG_SOC_CAMERA_MT9M111=3Dm
> +CONFIG_SOC_CAMERA_MT9T031=3Dm
> +CONFIG_SOC_CAMERA_MT9T112=3Dm
> +CONFIG_SOC_CAMERA_MT9V022=3Dm
> +CONFIG_SOC_CAMERA_RJ54N1=3Dm
> +CONFIG_SOC_CAMERA_TW9910=3Dm
> +CONFIG_SOC_CAMERA_PLATFORM=3Dm
> +CONFIG_SOC_CAMERA_OV772X=3Dm
> +CONFIG_SOC_CAMERA_OV9640=3Dm
> +CONFIG_VIDEO_SH_MOBILE_CEU=3Dm
> +CONFIG_V4L_USB_DRIVERS=3Dy
> +CONFIG_USB_VIDEO_CLASS=3Dm
> +CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> +CONFIG_USB_GSPCA=3Dm
> +CONFIG_USB_M5602=3Dm
> +CONFIG_USB_STV06XX=3Dm
> +CONFIG_USB_GL860=3Dm
> +CONFIG_USB_GSPCA_BENQ=3Dm
> +CONFIG_USB_GSPCA_CONEX=3Dm
> +CONFIG_USB_GSPCA_CPIA1=3Dm
> +CONFIG_USB_GSPCA_ETOMS=3Dm
> +CONFIG_USB_GSPCA_FINEPIX=3Dm
> +CONFIG_USB_GSPCA_JEILINJ=3Dm
> +CONFIG_USB_GSPCA_MARS=3Dm
> +CONFIG_USB_GSPCA_MR97310A=3Dm
> +CONFIG_USB_GSPCA_OV519=3Dm
> +CONFIG_USB_GSPCA_OV534=3Dm
> +CONFIG_USB_GSPCA_OV534_9=3Dm
> +CONFIG_USB_GSPCA_PAC207=3Dm
> +CONFIG_USB_GSPCA_PAC7302=3Dm
> +CONFIG_USB_GSPCA_PAC7311=3Dm
> +CONFIG_USB_GSPCA_SN9C2028=3Dm
> +CONFIG_USB_GSPCA_SN9C20X=3Dm
> +CONFIG_USB_GSPCA_SN9C20X_EVDEV=3Dy
> +CONFIG_USB_GSPCA_SONIXB=3Dm
> +CONFIG_USB_GSPCA_SONIXJ=3Dm
> +CONFIG_USB_GSPCA_SPCA500=3Dm
> +CONFIG_USB_GSPCA_SPCA501=3Dm
> +CONFIG_USB_GSPCA_SPCA505=3Dm
> +CONFIG_USB_GSPCA_SPCA506=3Dm
> +CONFIG_USB_GSPCA_SPCA508=3Dm
> +CONFIG_USB_GSPCA_SPCA561=3Dm
> +CONFIG_USB_GSPCA_SQ905=3Dm
> +CONFIG_USB_GSPCA_SQ905C=3Dm
> +CONFIG_USB_GSPCA_STK014=3Dm
> +CONFIG_USB_GSPCA_STV0680=3Dm
> +CONFIG_USB_GSPCA_SUNPLUS=3Dm
> +CONFIG_USB_GSPCA_T613=3Dm
> +CONFIG_USB_GSPCA_TV8532=3Dm
> +CONFIG_USB_GSPCA_VC032X=3Dm
> +CONFIG_USB_GSPCA_ZC3XX=3Dm
> +CONFIG_VIDEO_PVRUSB2=3Dm
> +CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
> +CONFIG_VIDEO_PVRUSB2_DVB=3Dy
> +# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
> +CONFIG_VIDEO_HDPVR=3Dm
> +CONFIG_VIDEO_EM28XX=3Dm
> +CONFIG_VIDEO_EM28XX_ALSA=3Dm
> +CONFIG_VIDEO_EM28XX_DVB=3Dm
> +CONFIG_VIDEO_TLG2300=3Dm
> +CONFIG_VIDEO_CX231XX=3Dm
> +CONFIG_VIDEO_CX231XX_ALSA=3Dm
> +CONFIG_VIDEO_CX231XX_DVB=3Dm
> +CONFIG_VIDEO_USBVISION=3Dm
> +CONFIG_VIDEO_USBVIDEO=3Dm
> +# CONFIG_USB_VICAM is not set
> +CONFIG_USB_IBMCAM=3Dm
> +CONFIG_USB_KONICAWC=3Dm
> +# CONFIG_USB_QUICKCAM_MESSENGER is not set
> +# CONFIG_USB_ET61X251 is not set
> +# CONFIG_VIDEO_OVCAMCHIP is not set
> +# CONFIG_USB_OV511 is not set
> +CONFIG_USB_SE401=3Dm
> +# CONFIG_USB_SN9C102 is not set
> +# CONFIG_USB_STV680 is not set
> +# CONFIG_USB_ZC0301 is not set
> +CONFIG_USB_PWC=3Dm
> +# CONFIG_USB_PWC_DEBUG is not set
> +CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> +CONFIG_USB_ZR364XX=3Dm
> +CONFIG_USB_STKWEBCAM=3Dm
> +CONFIG_USB_S2255=3Dm
> +# CONFIG_RADIO_ADAPTERS is not set
> +CONFIG_DVB_MAX_ADAPTERS=3D8
> +# CONFIG_DVB_DYNAMIC_MINORS is not set
> +CONFIG_DVB_CAPTURE_DRIVERS=3Dy
> +# CONFIG_TTPCI_EEPROM is not set
> +
> +#
> +# Supported USB Adapters
> +#
> +# CONFIG_DVB_USB is not set
> +# CONFIG_SMS_SIANO_MDTV is not set
> +
> +#
> +# Supported FlexCopII (B2C2) Adapters
> +#
> +# CONFIG_DVB_B2C2_FLEXCOP is not set
> +
> +#
> +# Supported DVB Frontends
> +#
> +# CONFIG_DVB_FE_CUSTOMISE is not set
> +CONFIG_DVB_ZL10353=3Dm
> +CONFIG_DVB_TDA10048=3Dm
> +CONFIG_DVB_TDA10023=3Dm
> +CONFIG_DVB_LGDT330X=3Dm
> +CONFIG_DVB_S5H1409=3Dm
> +CONFIG_DVB_AU8522=3Dm
> +CONFIG_DVB_S5H1411=3Dm
> +CONFIG_DAB=3Dy
> +CONFIG_USB_DABUSB=3Dm
> +
> +#
> +# Graphics support
> +#
> +# CONFIG_VGASTATE is not set
> +# CONFIG_VIDEO_OUTPUT_CONTROL is not set
> +CONFIG_FB=3Dy
> +# CONFIG_FIRMWARE_EDID is not set
> +# CONFIG_FB_DDC is not set
> +# CONFIG_FB_BOOT_VESA_SUPPORT is not set
> +CONFIG_FB_CFB_FILLRECT=3Dy
> +CONFIG_FB_CFB_COPYAREA=3Dy
> +CONFIG_FB_CFB_IMAGEBLIT=3Dy
> +# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> +# CONFIG_FB_SYS_FILLRECT is not set
> +# CONFIG_FB_SYS_COPYAREA is not set
> +# CONFIG_FB_SYS_IMAGEBLIT is not set
> +# CONFIG_FB_FOREIGN_ENDIAN is not set
> +# CONFIG_FB_SYS_FOPS is not set
> +# CONFIG_FB_SVGALIB is not set
> +# CONFIG_FB_MACMODES is not set
> +# CONFIG_FB_BACKLIGHT is not set
> +CONFIG_FB_MODE_HELPERS=3Dy
> +# CONFIG_FB_TILEBLITTING is not set
> +
> +#
> +# Frame buffer hardware drivers
> +#
> +# CONFIG_FB_UVESA is not set
> +# CONFIG_FB_S1D13XXX is not set
> +# CONFIG_FB_TMIO is not set
> +# CONFIG_FB_VIRTUAL is not set
> +# CONFIG_FB_METRONOME is not set
> +# CONFIG_FB_MB862XX is not set
> +# CONFIG_FB_BROADSHEET is not set
> +# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
> +CONFIG_OMAP2_VRAM=3Dy
> +CONFIG_OMAP2_VRFB=3Dy
> +CONFIG_OMAP2_DSS=3Dy
> +CONFIG_OMAP2_VRAM_SIZE=3D14
> +CONFIG_OMAP2_DSS_DEBUG_SUPPORT=3Dy
> +# CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS is not set
> +# CONFIG_OMAP2_DSS_RFBI is not set
> +# CONFIG_OMAP2_DSS_VENC is not set
> +# CONFIG_OMAP2_DSS_SDI is not set
> +CONFIG_OMAP2_DSS_DSI=3Dy
> +CONFIG_OMAP2_DSS_USE_DSI_PLL=3Dy
> +# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
> +CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=3D0
> +CONFIG_FB_OMAP2=3Dy
> +CONFIG_FB_OMAP2_DEBUG_SUPPORT=3Dy
> +CONFIG_FB_OMAP2_NUM_FBS=3D3
> +
> +#
> +# OMAP2/3 Display Device Drivers
> +#
> +CONFIG_PANEL_GENERIC=3Dy
> +# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
> +# CONFIG_PANEL_SHARP_LQ043T1DG01 is not set
> +# CONFIG_PANEL_TAAL is not set
> +# CONFIG_PANEL_TOPPOLY_TDO35S is not set
> +# CONFIG_PANEL_TPO_TD043MTEA1 is not set
> +# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> +
> +#
> +# Display device support
> +#
> +CONFIG_DISPLAY_SUPPORT=3Dy
> +
> +#
> +# Display hardware drivers
> +#
> +
> +#
> +# Console display driver support
> +#
> +# CONFIG_VGA_CONSOLE is not set
> +CONFIG_DUMMY_CONSOLE=3Dy
> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> +CONFIG_FONTS=3Dy
> +# CONFIG_FONT_8x8 is not set
> +CONFIG_FONT_8x16=3Dy
> +# CONFIG_FONT_6x11 is not set
> +# CONFIG_FONT_7x14 is not set
> +# CONFIG_FONT_PEARL_8x8 is not set
> +# CONFIG_FONT_ACORN_8x8 is not set
> +# CONFIG_FONT_MINI_4x6 is not set
> +# CONFIG_FONT_SUN8x16 is not set
> +# CONFIG_FONT_SUN12x22 is not set
> +# CONFIG_FONT_10x18 is not set
> +CONFIG_LOGO=3Dy
> +# CONFIG_LOGO_LINUX_MONO is not set
> +# CONFIG_LOGO_LINUX_VGA16 is not set
> +CONFIG_LOGO_LINUX_CLUT224=3Dy
> +CONFIG_SOUND=3Dy
> +CONFIG_SOUND_OSS_CORE=3Dy
> +CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> +CONFIG_SND=3Dy
> +CONFIG_SND_TIMER=3Dy
> +CONFIG_SND_PCM=3Dy
> +CONFIG_SND_JACK=3Dy
> +CONFIG_SND_SEQUENCER=3Dm
> +# CONFIG_SND_SEQ_DUMMY is not set
> +CONFIG_SND_OSSEMUL=3Dy
> +CONFIG_SND_MIXER_OSS=3Dy
> +CONFIG_SND_PCM_OSS=3Dy
> +CONFIG_SND_PCM_OSS_PLUGINS=3Dy
> +CONFIG_SND_SEQUENCER_OSS=3Dy
> +CONFIG_SND_HRTIMER=3Dm
> +CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
> +# CONFIG_SND_DYNAMIC_MINORS is not set
> +CONFIG_SND_SUPPORT_OLD_API=3Dy
> +CONFIG_SND_VERBOSE_PROCFS=3Dy
> +# CONFIG_SND_VERBOSE_PRINTK is not set
> +# CONFIG_SND_DEBUG is not set
> +# CONFIG_SND_RAWMIDI_SEQ is not set
> +# CONFIG_SND_OPL3_LIB_SEQ is not set
> +# CONFIG_SND_OPL4_LIB_SEQ is not set
> +# CONFIG_SND_SBAWE_SEQ is not set
> +# CONFIG_SND_EMU10K1_SEQ is not set
> +CONFIG_SND_DRIVERS=3Dy
> +# CONFIG_SND_DUMMY is not set
> +# CONFIG_SND_VIRMIDI is not set
> +# CONFIG_SND_MTPAV is not set
> +# CONFIG_SND_SERIAL_U16550 is not set
> +# CONFIG_SND_MPU401 is not set
> +# CONFIG_SND_ARM is not set
> +# CONFIG_SND_SPI is not set
> +# CONFIG_SND_USB is not set
> +CONFIG_SND_SOC=3Dy
> +CONFIG_SND_OMAP_SOC=3Dy
> +CONFIG_SND_OMAP_SOC_MCBSP=3Dy
> +CONFIG_SND_OMAP_SOC_IGEP0020=3Dy
> +CONFIG_SND_SOC_I2C_AND_SPI=3Dy
> +# CONFIG_SND_SOC_ALL_CODECS is not set
> +CONFIG_SND_SOC_TWL4030=3Dy
> +# CONFIG_SOUND_PRIME is not set
> +CONFIG_HID_SUPPORT=3Dy
> +CONFIG_HID=3Dy
> +CONFIG_HIDRAW=3Dy
> +
> +#
> +# USB Input Devices
> +#
> +CONFIG_USB_HID=3Dy
> +CONFIG_HID_PID=3Dy
> +CONFIG_USB_HIDDEV=3Dy
> +
> +#
> +# Special HID drivers
> +#
> +CONFIG_HID_3M_PCT=3Dm
> +CONFIG_HID_A4TECH=3Dm
> +CONFIG_HID_APPLE=3Dm
> +CONFIG_HID_BELKIN=3Dm
> +CONFIG_HID_CHERRY=3Dm
> +CONFIG_HID_CHICONY=3Dm
> +CONFIG_HID_CYPRESS=3Dm
> +CONFIG_HID_DRAGONRISE=3Dm
> +CONFIG_DRAGONRISE_FF=3Dy
> +CONFIG_HID_EZKEY=3Dm
> +CONFIG_HID_KYE=3Dm
> +CONFIG_HID_GYRATION=3Dm
> +CONFIG_HID_TWINHAN=3Dm
> +# CONFIG_HID_KENSINGTON is not set
> +CONFIG_HID_LOGITECH=3Dm
> +CONFIG_LOGITECH_FF=3Dy
> +CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> +# CONFIG_LOGIG940_FF is not set
> +# CONFIG_HID_MAGICMOUSE is not set
> +CONFIG_HID_MICROSOFT=3Dm
> +# CONFIG_HID_MOSART is not set
> +CONFIG_HID_MONTEREY=3Dm
> +CONFIG_HID_NTRIG=3Dm
> +# CONFIG_HID_ORTEK is not set
> +CONFIG_HID_PANTHERLORD=3Dm
> +CONFIG_PANTHERLORD_FF=3Dy
> +CONFIG_HID_PETALYNX=3Dm
> +# CONFIG_HID_QUANTA is not set
> +CONFIG_HID_SAMSUNG=3Dm
> +CONFIG_HID_SONY=3Dm
> +# CONFIG_HID_STANTUM is not set
> +CONFIG_HID_SUNPLUS=3Dm
> +CONFIG_HID_GREENASIA=3Dm
> +CONFIG_GREENASIA_FF=3Dy
> +CONFIG_HID_SMARTJOYPLUS=3Dm
> +CONFIG_SMARTJOYPLUS_FF=3Dy
> +CONFIG_HID_TOPSEED=3Dm
> +CONFIG_HID_THRUSTMASTER=3Dm
> +CONFIG_THRUSTMASTER_FF=3Dy
> +CONFIG_HID_WACOM=3Dm
> +CONFIG_HID_ZEROPLUS=3Dm
> +# CONFIG_ZEROPLUS_FF is not set
> +CONFIG_USB_SUPPORT=3Dy
> +CONFIG_USB_ARCH_HAS_HCD=3Dy
> +CONFIG_USB_ARCH_HAS_OHCI=3Dy
> +CONFIG_USB_ARCH_HAS_EHCI=3Dy
> +CONFIG_USB=3Dy
> +# CONFIG_USB_DEBUG is not set
> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> +
> +#
> +# Miscellaneous USB options
> +#
> +# CONFIG_USB_DEVICEFS is not set
> +# CONFIG_USB_DEVICE_CLASS is not set
> +# CONFIG_USB_DYNAMIC_MINORS is not set
> +CONFIG_USB_SUSPEND=3Dy
> +CONFIG_USB_OTG=3Dy
> +# CONFIG_USB_OTG_WHITELIST is not set
> +# CONFIG_USB_OTG_BLACKLIST_HUB is not set
> +CONFIG_USB_MON=3Dm
> +# CONFIG_USB_WUSB is not set
> +CONFIG_USB_WUSB_CBAF=3Dm
> +# CONFIG_USB_WUSB_CBAF_DEBUG is not set
> +
> +#
> +# USB Host Controller Drivers
> +#
> +# CONFIG_USB_C67X00_HCD is not set
> +CONFIG_USB_EHCI_HCD=3Dy
> +CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> +# CONFIG_USB_EHCI_TT_NEWSCHED is not set
> +# CONFIG_USB_OXU210HP_HCD is not set
> +# CONFIG_USB_ISP116X_HCD is not set
> +# CONFIG_USB_ISP1760_HCD is not set
> +# CONFIG_USB_ISP1362_HCD is not set
> +CONFIG_USB_OHCI_HCD=3Dm
> +# CONFIG_USB_OHCI_HCD_SSB is not set
> +# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
> +# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
> +CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> +# CONFIG_USB_SL811_HCD is not set
> +# CONFIG_USB_R8A66597_HCD is not set
> +# CONFIG_USB_HWA_HCD is not set
> +CONFIG_USB_MUSB_HDRC=3Dy
> +CONFIG_USB_MUSB_SOC=3Dy
> +
> +#
> +# OMAP 343x high speed USB support
> +#
> +# CONFIG_USB_MUSB_HOST is not set
> +# CONFIG_USB_MUSB_PERIPHERAL is not set
> +CONFIG_USB_MUSB_OTG=3Dy
> +CONFIG_USB_GADGET_MUSB_HDRC=3Dy
> +CONFIG_USB_MUSB_HDRC_HCD=3Dy
> +# CONFIG_MUSB_PIO_ONLY is not set
> +CONFIG_USB_INVENTRA_DMA=3Dy
> +# CONFIG_USB_TI_CPPI_DMA is not set
> +# CONFIG_USB_MUSB_DEBUG is not set
> +
> +#
> +# USB Device Class drivers
> +#
> +CONFIG_USB_ACM=3Dm
> +CONFIG_USB_PRINTER=3Dm
> +CONFIG_USB_WDM=3Dm
> +# CONFIG_USB_TMC is not set
> +
> +#
> +# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> +#
> +
> +#
> +# also be needed; see USB_STORAGE Help for more info
> +#
> +CONFIG_USB_STORAGE=3Dm
> +# CONFIG_USB_STORAGE_DEBUG is not set
> +# CONFIG_USB_STORAGE_DATAFAB is not set
> +# CONFIG_USB_STORAGE_FREECOM is not set
> +# CONFIG_USB_STORAGE_ISD200 is not set
> +# CONFIG_USB_STORAGE_USBAT is not set
> +# CONFIG_USB_STORAGE_SDDR09 is not set
> +# CONFIG_USB_STORAGE_SDDR55 is not set
> +# CONFIG_USB_STORAGE_JUMPSHOT is not set
> +# CONFIG_USB_STORAGE_ALAUDA is not set
> +# CONFIG_USB_STORAGE_ONETOUCH is not set
> +# CONFIG_USB_STORAGE_KARMA is not set
> +# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> +# CONFIG_USB_LIBUSUAL is not set
> +
> +#
> +# USB Imaging devices
> +#
> +# CONFIG_USB_MDC800 is not set
> +# CONFIG_USB_MICROTEK is not set
> +
> +#
> +# USB port drivers
> +#
> +CONFIG_USB_SERIAL=3Dm
> +CONFIG_USB_EZUSB=3Dy
> +CONFIG_USB_SERIAL_GENERIC=3Dy
> +CONFIG_USB_SERIAL_AIRCABLE=3Dm
> +CONFIG_USB_SERIAL_ARK3116=3Dm
> +CONFIG_USB_SERIAL_BELKIN=3Dm
> +CONFIG_USB_SERIAL_CH341=3Dm
> +CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> +CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> +CONFIG_USB_SERIAL_CP210X=3Dm
> +CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> +CONFIG_USB_SERIAL_EMPEG=3Dm
> +CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> +CONFIG_USB_SERIAL_FUNSOFT=3Dm
> +CONFIG_USB_SERIAL_VISOR=3Dm
> +CONFIG_USB_SERIAL_IPAQ=3Dm
> +CONFIG_USB_SERIAL_IR=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
> +CONFIG_USB_SERIAL_GARMIN=3Dm
> +CONFIG_USB_SERIAL_IPW=3Dm
> +CONFIG_USB_SERIAL_IUU=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN_MPR=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA28=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA28X=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA28XA=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA28XB=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA19=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA18X=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA19W=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA19QW=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA19QI=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA49W=3Dy
> +CONFIG_USB_SERIAL_KEYSPAN_USA49WLC=3Dy
> +CONFIG_USB_SERIAL_KLSI=3Dm
> +CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> +CONFIG_USB_SERIAL_MCT_U232=3Dm
> +CONFIG_USB_SERIAL_MOS7720=3Dm
> +CONFIG_USB_SERIAL_MOS7840=3Dm
> +CONFIG_USB_SERIAL_MOTOROLA=3Dm
> +CONFIG_USB_SERIAL_NAVMAN=3Dm
> +CONFIG_USB_SERIAL_PL2303=3Dm
> +CONFIG_USB_SERIAL_OTI6858=3Dm
> +CONFIG_USB_SERIAL_QUALCOMM=3Dm
> +CONFIG_USB_SERIAL_SPCP8X5=3Dm
> +CONFIG_USB_SERIAL_HP4X=3Dm
> +CONFIG_USB_SERIAL_SAFE=3Dm
> +CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
> +CONFIG_USB_SERIAL_SIEMENS_MPI=3Dm
> +CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> +CONFIG_USB_SERIAL_SYMBOL=3Dm
> +CONFIG_USB_SERIAL_TI=3Dm
> +CONFIG_USB_SERIAL_CYBERJACK=3Dm
> +CONFIG_USB_SERIAL_XIRCOM=3Dm
> +CONFIG_USB_SERIAL_OPTION=3Dm
> +CONFIG_USB_SERIAL_OMNINET=3Dm
> +CONFIG_USB_SERIAL_OPTICON=3Dm
> +# CONFIG_USB_SERIAL_DEBUG is not set
> +
> +#
> +# USB Miscellaneous drivers
> +#
> +CONFIG_USB_EMI62=3Dm
> +CONFIG_USB_EMI26=3Dm
> +CONFIG_USB_ADUTUX=3Dm
> +CONFIG_USB_SEVSEG=3Dm
> +CONFIG_USB_RIO500=3Dm
> +CONFIG_USB_LEGOTOWER=3Dm
> +CONFIG_USB_LCD=3Dm
> +CONFIG_USB_BERRY_CHARGE=3Dm
> +CONFIG_USB_LED=3Dm
> +CONFIG_USB_CYPRESS_CY7C63=3Dm
> +CONFIG_USB_CYTHERM=3Dm
> +CONFIG_USB_IDMOUSE=3Dm
> +# CONFIG_USB_FTDI_ELAN is not set
> +# CONFIG_USB_APPLEDISPLAY is not set
> +CONFIG_USB_SISUSBVGA=3Dm
> +CONFIG_USB_SISUSBVGA_CON=3Dy
> +CONFIG_USB_LD=3Dm
> +CONFIG_USB_TRANCEVIBRATOR=3Dm
> +# CONFIG_USB_IOWARRIOR is not set
> +CONFIG_USB_TEST=3Dm
> +# CONFIG_USB_ISIGHTFW is not set
> +CONFIG_USB_VST=3Dm
> +CONFIG_USB_GADGET=3Dy
> +# CONFIG_USB_GADGET_DEBUG is not set
> +# CONFIG_USB_GADGET_DEBUG_FILES is not set
> +# CONFIG_USB_GADGET_DEBUG_FS is not set
> +CONFIG_USB_GADGET_VBUS_DRAW=3D100
> +CONFIG_USB_GADGET_SELECTED=3Dy
> +# CONFIG_USB_GADGET_AT91 is not set
> +# CONFIG_USB_GADGET_ATMEL_USBA is not set
> +# CONFIG_USB_GADGET_FSL_USB2 is not set
> +# CONFIG_USB_GADGET_LH7A40X is not set
> +# CONFIG_USB_GADGET_OMAP is not set
> +# CONFIG_USB_GADGET_PXA25X is not set
> +# CONFIG_USB_GADGET_R8A66597 is not set
> +# CONFIG_USB_GADGET_PXA27X is not set
> +# CONFIG_USB_GADGET_S3C_HSOTG is not set
> +# CONFIG_USB_GADGET_IMX is not set
> +# CONFIG_USB_GADGET_S3C2410 is not set
> +# CONFIG_USB_GADGET_M66592 is not set
> +# CONFIG_USB_GADGET_AMD5536UDC is not set
> +# CONFIG_USB_GADGET_FSL_QE is not set
> +# CONFIG_USB_GADGET_CI13XXX is not set
> +# CONFIG_USB_GADGET_NET2280 is not set
> +# CONFIG_USB_GADGET_GOKU is not set
> +# CONFIG_USB_GADGET_LANGWELL is not set
> +# CONFIG_USB_GADGET_DUMMY_HCD is not set
> +CONFIG_USB_GADGET_DUALSPEED=3Dy
> +# CONFIG_USB_ZERO is not set
> +# CONFIG_USB_AUDIO is not set
> +# CONFIG_USB_ETH is not set
> +# CONFIG_USB_GADGETFS is not set
> +# CONFIG_USB_FILE_STORAGE is not set
> +# CONFIG_USB_MASS_STORAGE is not set
> +# CONFIG_USB_G_SERIAL is not set
> +# CONFIG_USB_MIDI_GADGET is not set
> +# CONFIG_USB_G_PRINTER is not set
> +# CONFIG_USB_CDC_COMPOSITE is not set
> +CONFIG_USB_G_MULTI=3Dy
> +CONFIG_USB_G_MULTI_RNDIS=3Dy
> +CONFIG_USB_G_MULTI_CDC=3Dy
> +
> +#
> +# OTG and related infrastructure
> +#
> +CONFIG_USB_OTG_UTILS=3Dy
> +# CONFIG_USB_GPIO_VBUS is not set
> +# CONFIG_ISP1301_OMAP is not set
> +# CONFIG_USB_ULPI is not set
> +CONFIG_TWL4030_USB=3Dy
> +# CONFIG_NOP_USB_XCEIV is not set
> +CONFIG_MMC=3Dy
> +# CONFIG_MMC_DEBUG is not set
> +CONFIG_MMC_UNSAFE_RESUME=3Dy
> +
> +#
> +# MMC/SD/SDIO Card Drivers
> +#
> +CONFIG_MMC_BLOCK=3Dy
> +CONFIG_MMC_BLOCK_BOUNCE=3Dy
> +CONFIG_SDIO_UART=3Dm
> +# CONFIG_MMC_TEST is not set
> +
> +#
> +# MMC/SD/SDIO Host Controller Drivers
> +#
> +# CONFIG_MMC_SDHCI is not set
> +# CONFIG_MMC_OMAP is not set
> +CONFIG_MMC_OMAP_HS=3Dy
> +# CONFIG_MMC_AT91 is not set
> +# CONFIG_MMC_ATMELMCI is not set
> +CONFIG_MMC_SPI=3Dm
> +# CONFIG_MEMSTICK is not set
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +
> +#
> +# LED drivers
> +#
> +# CONFIG_LEDS_PCA9532 is not set
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_GPIO_PLATFORM=3Dy
> +# CONFIG_LEDS_LP3944 is not set
> +# CONFIG_LEDS_PCA955X is not set
> +# CONFIG_LEDS_DAC124S085 is not set
> +# CONFIG_LEDS_REGULATOR is not set
> +# CONFIG_LEDS_BD2802 is not set
> +# CONFIG_LEDS_LT3593 is not set
> +
> +#
> +# LED Triggers
> +#
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dm
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> +CONFIG_LEDS_TRIGGER_GPIO=3Dm
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> +
> +#
> +# iptables trigger is under Netfilter config (LED target)
> +#
> +# CONFIG_ACCESSIBILITY is not set
> +CONFIG_RTC_LIB=3Dy
> +CONFIG_RTC_CLASS=3Dm
> +
> +#
> +# RTC interfaces
> +#
> +CONFIG_RTC_INTF_SYSFS=3Dy
> +CONFIG_RTC_INTF_PROC=3Dy
> +CONFIG_RTC_INTF_DEV=3Dy
> +# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> +# CONFIG_RTC_DRV_TEST is not set
> +
> +#
> +# I2C RTC drivers
> +#
> +# CONFIG_RTC_DRV_DS1307 is not set
> +# CONFIG_RTC_DRV_DS1374 is not set
> +# CONFIG_RTC_DRV_DS1672 is not set
> +# CONFIG_RTC_DRV_MAX6900 is not set
> +# CONFIG_RTC_DRV_RS5C372 is not set
> +# CONFIG_RTC_DRV_ISL1208 is not set
> +# CONFIG_RTC_DRV_X1205 is not set
> +# CONFIG_RTC_DRV_PCF8563 is not set
> +# CONFIG_RTC_DRV_PCF8583 is not set
> +# CONFIG_RTC_DRV_M41T80 is not set
> +# CONFIG_RTC_DRV_BQ32K is not set
> +CONFIG_RTC_DRV_TWL4030=3Dm
> +# CONFIG_RTC_DRV_S35390A is not set
> +# CONFIG_RTC_DRV_FM3130 is not set
> +# CONFIG_RTC_DRV_RX8581 is not set
> +# CONFIG_RTC_DRV_RX8025 is not set
> +
> +#
> +# SPI RTC drivers
> +#
> +# CONFIG_RTC_DRV_M41T94 is not set
> +# CONFIG_RTC_DRV_DS1305 is not set
> +# CONFIG_RTC_DRV_DS1390 is not set
> +# CONFIG_RTC_DRV_MAX6902 is not set
> +# CONFIG_RTC_DRV_R9701 is not set
> +# CONFIG_RTC_DRV_RS5C348 is not set
> +# CONFIG_RTC_DRV_DS3234 is not set
> +# CONFIG_RTC_DRV_PCF2123 is not set
> +
> +#
> +# Platform RTC drivers
> +#
> +# CONFIG_RTC_DRV_CMOS is not set
> +# CONFIG_RTC_DRV_DS1286 is not set
> +# CONFIG_RTC_DRV_DS1511 is not set
> +# CONFIG_RTC_DRV_DS1553 is not set
> +# CONFIG_RTC_DRV_DS1742 is not set
> +# CONFIG_RTC_DRV_STK17TA8 is not set
> +# CONFIG_RTC_DRV_M48T86 is not set
> +# CONFIG_RTC_DRV_M48T35 is not set
> +# CONFIG_RTC_DRV_M48T59 is not set
> +# CONFIG_RTC_DRV_MSM6242 is not set
> +# CONFIG_RTC_DRV_BQ4802 is not set
> +# CONFIG_RTC_DRV_RP5C01 is not set
> +# CONFIG_RTC_DRV_V3020 is not set
> +
> +#
> +# on-CPU RTC drivers
> +#
> +# CONFIG_DMADEVICES is not set
> +# CONFIG_AUXDISPLAY is not set
> +CONFIG_UIO=3Dy
> +# CONFIG_UIO_PDRV is not set
> +# CONFIG_UIO_PDRV_GENIRQ is not set
> +# CONFIG_UIO_SMX is not set
> +# CONFIG_UIO_SERCOS3 is not set
> +
> +#
> +# TI VLYNQ
> +#
> +CONFIG_STAGING=3Dy
> +# CONFIG_STAGING_EXCLUDE_BUILD is not set
> +# CONFIG_USB_IP_COMMON is not set
> +# CONFIG_W35UND is not set
> +# CONFIG_PRISM2_USB is not set
> +# CONFIG_ECHO is not set
> +# CONFIG_OTUS is not set
> +# CONFIG_COMEDI is not set
> +# CONFIG_ASUS_OLED is not set
> +# CONFIG_TRANZPORT is not set
> +
> +#
> +# Qualcomm MSM Camera And Video
> +#
> +
> +#
> +# Camera Sensor Selection
> +#
> +# CONFIG_INPUT_GPIO is not set
> +# CONFIG_POHMELFS is not set
> +# CONFIG_PLAN9AUTH is not set
> +# CONFIG_LINE6_USB is not set
> +# CONFIG_USB_SERIAL_QUATECH2 is not set
> +# CONFIG_USB_SERIAL_QUATECH_USB2 is not set
> +# CONFIG_VT6656 is not set
> +# CONFIG_FB_UDL is not set
> +
> +#
> +# RAR Register Driver
> +#
> +# CONFIG_RAR_REGISTER is not set
> +# CONFIG_IIO is not set
> +# CONFIG_RAMZSWAP is not set
> +# CONFIG_BATMAN_ADV is not set
> +# CONFIG_STRIP is not set
> +# CONFIG_FB_SM7XX is not set
> +CONFIG_OMAP3_SGX=3Dy
> +CONFIG_MPU_BRIDGE=3Dm
> +CONFIG_BRIDGE_MEMPOOL_SIZE=3D0x600000
> +# CONFIG_BRIDGE_DEBUG is not set
> +# CONFIG_BRIDGE_RECOVERY is not set
> +# CONFIG_BRIDGE_CACHE_LINE_CHECK is not set
> +# CONFIG_BRIDGE_WDT3 is not set
> +
> +#
> +# Bridge Notifications
> +#
> +# CONFIG_BRIDGE_NTFY_PWRERR is not set
> +
> +#
> +# CBUS support
> +#
> +# CONFIG_CBUS is not set
> +
> +#
> +# File systems
> +#
> +CONFIG_EXT2_FS=3Dy
> +CONFIG_EXT2_FS_XATTR=3Dy
> +CONFIG_EXT2_FS_POSIX_ACL=3Dy
> +CONFIG_EXT2_FS_SECURITY=3Dy
> +# CONFIG_EXT2_FS_XIP is not set
> +CONFIG_EXT3_FS=3Dy
> +CONFIG_EXT3_DEFAULTS_TO_ORDERED=3Dy
> +CONFIG_EXT3_FS_XATTR=3Dy
> +CONFIG_EXT3_FS_POSIX_ACL=3Dy
> +CONFIG_EXT3_FS_SECURITY=3Dy
> +CONFIG_EXT4_FS=3Dy
> +CONFIG_EXT4_FS_XATTR=3Dy
> +CONFIG_EXT4_FS_POSIX_ACL=3Dy
> +CONFIG_EXT4_FS_SECURITY=3Dy
> +# CONFIG_EXT4_DEBUG is not set
> +CONFIG_JBD=3Dy
> +# CONFIG_JBD_DEBUG is not set
> +CONFIG_JBD2=3Dy
> +# CONFIG_JBD2_DEBUG is not set
> +CONFIG_FS_MBCACHE=3Dy
> +# CONFIG_REISERFS_FS is not set
> +# CONFIG_JFS_FS is not set
> +CONFIG_FS_POSIX_ACL=3Dy
> +# CONFIG_XFS_FS is not set
> +# CONFIG_GFS2_FS is not set
> +# CONFIG_OCFS2_FS is not set
> +CONFIG_BTRFS_FS=3Dy
> +CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> +# CONFIG_NILFS2_FS is not set
> +CONFIG_FILE_LOCKING=3Dy
> +CONFIG_FSNOTIFY=3Dy
> +CONFIG_DNOTIFY=3Dy
> +CONFIG_INOTIFY=3Dy
> +CONFIG_INOTIFY_USER=3Dy
> +CONFIG_QUOTA=3Dy
> +CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> +# CONFIG_PRINT_QUOTA_WARNING is not set
> +CONFIG_QUOTA_TREE=3Dy
> +# CONFIG_QFMT_V1 is not set
> +CONFIG_QFMT_V2=3Dy
> +CONFIG_QUOTACTL=3Dy
> +# CONFIG_AUTOFS_FS is not set
> +CONFIG_AUTOFS4_FS=3Dm
> +CONFIG_FUSE_FS=3Dm
> +CONFIG_CUSE=3Dm
> +
> +#
> +# Caches
> +#
> +# CONFIG_FSCACHE is not set
> +
> +#
> +# CD-ROM/DVD Filesystems
> +#
> +# CONFIG_ISO9660_FS is not set
> +# CONFIG_UDF_FS is not set
> +
> +#
> +# DOS/FAT/NT Filesystems
> +#
> +CONFIG_FAT_FS=3Dy
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> +CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> +CONFIG_NTFS_FS=3Dm
> +# CONFIG_NTFS_DEBUG is not set
> +CONFIG_NTFS_RW=3Dy
> +
> +#
> +# Pseudo filesystems
> +#
> +CONFIG_PROC_FS=3Dy
> +CONFIG_PROC_SYSCTL=3Dy
> +CONFIG_PROC_PAGE_MONITOR=3Dy
> +CONFIG_SYSFS=3Dy
> +CONFIG_TMPFS=3Dy
> +# CONFIG_TMPFS_POSIX_ACL is not set
> +# CONFIG_HUGETLB_PAGE is not set
> +CONFIG_CONFIGFS_FS=3Dm
> +CONFIG_MISC_FILESYSTEMS=3Dy
> +# CONFIG_ADFS_FS is not set
> +# CONFIG_AFFS_FS is not set
> +# CONFIG_HFS_FS is not set
> +# CONFIG_HFSPLUS_FS is not set
> +# CONFIG_BEFS_FS is not set
> +# CONFIG_BFS_FS is not set
> +# CONFIG_EFS_FS is not set
> +CONFIG_JFFS2_FS=3Dy
> +CONFIG_JFFS2_FS_DEBUG=3D0
> +CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> +# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> +# CONFIG_JFFS2_SUMMARY is not set
> +# CONFIG_JFFS2_FS_XATTR is not set
> +CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> +CONFIG_JFFS2_ZLIB=3Dy
> +CONFIG_JFFS2_LZO=3Dy
> +CONFIG_JFFS2_RTIME=3Dy
> +# CONFIG_JFFS2_RUBIN is not set
> +# CONFIG_JFFS2_CMODE_NONE is not set
> +# CONFIG_JFFS2_CMODE_PRIORITY is not set
> +# CONFIG_JFFS2_CMODE_SIZE is not set
> +CONFIG_JFFS2_CMODE_FAVOURLZO=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_UBIFS_FS_XATTR=3Dy
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> +CONFIG_UBIFS_FS_LZO=3Dy
> +CONFIG_UBIFS_FS_ZLIB=3Dy
> +# CONFIG_UBIFS_FS_DEBUG is not set
> +CONFIG_CRAMFS=3Dy
> +CONFIG_SQUASHFS=3Dy
> +# CONFIG_SQUASHFS_EMBEDDED is not set
> +CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> +# CONFIG_VXFS_FS is not set
> +# CONFIG_MINIX_FS is not set
> +# CONFIG_OMFS_FS is not set
> +# CONFIG_HPFS_FS is not set
> +# CONFIG_QNX4FS_FS is not set
> +# CONFIG_ROMFS_FS is not set
> +# CONFIG_SYSV_FS is not set
> +# CONFIG_UFS_FS is not set
> +CONFIG_NETWORK_FILESYSTEMS=3Dy
> +CONFIG_NFS_FS=3Dy
> +CONFIG_NFS_V3=3Dy
> +CONFIG_NFS_V3_ACL=3Dy
> +# CONFIG_NFS_V4 is not set
> +CONFIG_ROOT_NFS=3Dy
> +CONFIG_NFSD=3Dm
> +CONFIG_NFSD_V2_ACL=3Dy
> +CONFIG_NFSD_V3=3Dy
> +CONFIG_NFSD_V3_ACL=3Dy
> +# CONFIG_NFSD_V4 is not set
> +CONFIG_LOCKD=3Dy
> +CONFIG_LOCKD_V4=3Dy
> +CONFIG_EXPORTFS=3Dm
> +CONFIG_NFS_ACL_SUPPORT=3Dy
> +CONFIG_NFS_COMMON=3Dy
> +CONFIG_SUNRPC=3Dy
> +# CONFIG_RPCSEC_GSS_KRB5 is not set
> +# CONFIG_RPCSEC_GSS_SPKM3 is not set
> +# CONFIG_SMB_FS is not set
> +CONFIG_CIFS=3Dm
> +# CONFIG_CIFS_STATS is not set
> +CONFIG_CIFS_WEAK_PW_HASH=3Dy
> +CONFIG_CIFS_XATTR=3Dy
> +CONFIG_CIFS_POSIX=3Dy
> +CONFIG_CIFS_DEBUG2=3Dy
> +# CONFIG_CIFS_EXPERIMENTAL is not set
> +# CONFIG_NCP_FS is not set
> +# CONFIG_CODA_FS is not set
> +# CONFIG_AFS_FS is not set
> +
> +#
> +# Partition Types
> +#
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ACORN_PARTITION is not set
> +# CONFIG_OSF_PARTITION is not set
> +# CONFIG_AMIGA_PARTITION is not set
> +# CONFIG_ATARI_PARTITION is not set
> +# CONFIG_MAC_PARTITION is not set
> +CONFIG_MSDOS_PARTITION=3Dy
> +# CONFIG_BSD_DISKLABEL is not set
> +# CONFIG_MINIX_SUBPARTITION is not set
> +# CONFIG_SOLARIS_X86_PARTITION is not set
> +# CONFIG_UNIXWARE_DISKLABEL is not set
> +# CONFIG_LDM_PARTITION is not set
> +# CONFIG_SGI_PARTITION is not set
> +# CONFIG_ULTRIX_PARTITION is not set
> +# CONFIG_SUN_PARTITION is not set
> +# CONFIG_KARMA_PARTITION is not set
> +# CONFIG_EFI_PARTITION is not set
> +# CONFIG_SYSV68_PARTITION is not set
> +CONFIG_NLS=3Dy
> +CONFIG_NLS_DEFAULT=3D"iso8859-1"
> +CONFIG_NLS_CODEPAGE_437=3Dm
> +CONFIG_NLS_CODEPAGE_737=3Dm
> +CONFIG_NLS_CODEPAGE_775=3Dm
> +CONFIG_NLS_CODEPAGE_850=3Dm
> +CONFIG_NLS_CODEPAGE_852=3Dm
> +CONFIG_NLS_CODEPAGE_855=3Dm
> +CONFIG_NLS_CODEPAGE_857=3Dm
> +CONFIG_NLS_CODEPAGE_860=3Dm
> +CONFIG_NLS_CODEPAGE_861=3Dm
> +CONFIG_NLS_CODEPAGE_862=3Dm
> +CONFIG_NLS_CODEPAGE_863=3Dm
> +CONFIG_NLS_CODEPAGE_864=3Dm
> +CONFIG_NLS_CODEPAGE_865=3Dm
> +CONFIG_NLS_CODEPAGE_866=3Dm
> +CONFIG_NLS_CODEPAGE_869=3Dm
> +CONFIG_NLS_CODEPAGE_936=3Dm
> +CONFIG_NLS_CODEPAGE_950=3Dm
> +CONFIG_NLS_CODEPAGE_932=3Dm
> +CONFIG_NLS_CODEPAGE_949=3Dm
> +CONFIG_NLS_CODEPAGE_874=3Dm
> +CONFIG_NLS_ISO8859_8=3Dm
> +CONFIG_NLS_CODEPAGE_1250=3Dm
> +CONFIG_NLS_CODEPAGE_1251=3Dm
> +CONFIG_NLS_ASCII=3Dm
> +CONFIG_NLS_ISO8859_1=3Dm
> +CONFIG_NLS_ISO8859_2=3Dm
> +CONFIG_NLS_ISO8859_3=3Dm
> +CONFIG_NLS_ISO8859_4=3Dm
> +CONFIG_NLS_ISO8859_5=3Dm
> +CONFIG_NLS_ISO8859_6=3Dm
> +CONFIG_NLS_ISO8859_7=3Dm
> +CONFIG_NLS_ISO8859_9=3Dm
> +CONFIG_NLS_ISO8859_13=3Dm
> +CONFIG_NLS_ISO8859_14=3Dm
> +CONFIG_NLS_ISO8859_15=3Dm
> +CONFIG_NLS_KOI8_R=3Dm
> +CONFIG_NLS_KOI8_U=3Dm
> +CONFIG_NLS_UTF8=3Dm
> +CONFIG_DLM=3Dm
> +# CONFIG_DLM_DEBUG is not set
> +
> +#
> +# Kernel hacking
> +#
> +CONFIG_PRINTK_TIME=3Dy
> +CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> +CONFIG_ENABLE_MUST_CHECK=3Dy
> +CONFIG_FRAME_WARN=3D1024
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_STRIP_ASM_SYMS is not set
> +# CONFIG_UNUSED_SYMBOLS is not set
> +CONFIG_DEBUG_FS=3Dy
> +# CONFIG_HEADERS_CHECK is not set
> +CONFIG_DEBUG_KERNEL=3Dy
> +# CONFIG_DEBUG_SHIRQ is not set
> +CONFIG_DETECT_SOFTLOCKUP=3Dy
> +# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> +CONFIG_DETECT_HUNG_TASK=3Dy
> +# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> +CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> +CONFIG_SCHED_DEBUG=3Dy
> +# CONFIG_SCHEDSTATS is not set
> +# CONFIG_TIMER_STATS is not set
> +# CONFIG_DEBUG_OBJECTS is not set
> +# CONFIG_DEBUG_SLAB is not set
> +# CONFIG_DEBUG_KMEMLEAK is not set
> +# CONFIG_DEBUG_RT_MUTEXES is not set
> +# CONFIG_RT_MUTEX_TESTER is not set
> +# CONFIG_DEBUG_SPINLOCK is not set
> +CONFIG_DEBUG_MUTEXES=3Dy
> +# CONFIG_DEBUG_LOCK_ALLOC is not set
> +# CONFIG_PROVE_LOCKING is not set
> +# CONFIG_LOCK_STAT is not set
> +# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
> +# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> +# CONFIG_DEBUG_KOBJECT is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO=3Dy
> +# CONFIG_DEBUG_VM is not set
> +# CONFIG_DEBUG_WRITECOUNT is not set
> +# CONFIG_DEBUG_MEMORY_INIT is not set
> +# CONFIG_DEBUG_LIST is not set
> +# CONFIG_DEBUG_SG is not set
> +# CONFIG_DEBUG_NOTIFIERS is not set
> +# CONFIG_DEBUG_CREDENTIALS is not set
> +# CONFIG_BOOT_PRINTK_DELAY is not set
> +# CONFIG_RCU_TORTURE_TEST is not set
> +# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> +# CONFIG_BACKTRACE_SELF_TEST is not set
> +# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> +# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> +# CONFIG_FAULT_INJECTION is not set
> +# CONFIG_LATENCYTOP is not set
> +# CONFIG_SYSCTL_SYSCALL_CHECK is not set
> +# CONFIG_PAGE_POISONING is not set
> +CONFIG_HAVE_FUNCTION_TRACER=3Dy
> +CONFIG_TRACING_SUPPORT=3Dy
> +CONFIG_FTRACE=3Dy
> +# CONFIG_FUNCTION_TRACER is not set
> +# CONFIG_IRQSOFF_TRACER is not set
> +# CONFIG_SCHED_TRACER is not set
> +# CONFIG_ENABLE_DEFAULT_TRACERS is not set
> +# CONFIG_BOOT_TRACER is not set
> +CONFIG_BRANCH_PROFILE_NONE=3Dy
> +# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> +# CONFIG_PROFILE_ALL_BRANCHES is not set
> +# CONFIG_STACK_TRACER is not set
> +# CONFIG_KMEMTRACE is not set
> +# CONFIG_WORKQUEUE_TRACER is not set
> +# CONFIG_BLK_DEV_IO_TRACE is not set
> +# CONFIG_DYNAMIC_DEBUG is not set
> +# CONFIG_SAMPLES is not set
> +CONFIG_HAVE_ARCH_KGDB=3Dy
> +# CONFIG_KGDB is not set
> +CONFIG_ARM_UNWIND=3Dy
> +# CONFIG_DEBUG_USER is not set
> +# CONFIG_DEBUG_ERRORS is not set
> +# CONFIG_DEBUG_STACK_USAGE is not set
> +CONFIG_DEBUG_LL=3Dy
> +# CONFIG_EARLY_PRINTK is not set
> +# CONFIG_DEBUG_ICEDCC is not set
> +# CONFIG_OC_ETM is not set
> +
> +#
> +# Security options
> +#
> +# CONFIG_KEYS is not set
> +# CONFIG_SECURITY is not set
> +# CONFIG_SECURITYFS is not set
> +# CONFIG_DEFAULT_SECURITY_SELINUX is not set
> +# CONFIG_DEFAULT_SECURITY_SMACK is not set
> +# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
> +CONFIG_DEFAULT_SECURITY_DAC=3Dy
> +CONFIG_DEFAULT_SECURITY=3D""
> +CONFIG_CRYPTO=3Dy
> +
> +#
> +# Crypto core or helper
> +#
> +CONFIG_CRYPTO_ALGAPI=3Dy
> +CONFIG_CRYPTO_ALGAPI2=3Dy
> +CONFIG_CRYPTO_AEAD=3Dm
> +CONFIG_CRYPTO_AEAD2=3Dy
> +CONFIG_CRYPTO_BLKCIPHER=3Dy
> +CONFIG_CRYPTO_BLKCIPHER2=3Dy
> +CONFIG_CRYPTO_HASH=3Dy
> +CONFIG_CRYPTO_HASH2=3Dy
> +CONFIG_CRYPTO_RNG2=3Dy
> +CONFIG_CRYPTO_PCOMP=3Dy
> +CONFIG_CRYPTO_MANAGER=3Dy
> +CONFIG_CRYPTO_MANAGER2=3Dy
> +# CONFIG_CRYPTO_GF128MUL is not set
> +# CONFIG_CRYPTO_NULL is not set
> +CONFIG_CRYPTO_WORKQUEUE=3Dy
> +# CONFIG_CRYPTO_CRYPTD is not set
> +CONFIG_CRYPTO_AUTHENC=3Dm
> +# CONFIG_CRYPTO_TEST is not set
> +
> +#
> +# Authenticated Encryption with Associated Data
> +#
> +# CONFIG_CRYPTO_CCM is not set
> +# CONFIG_CRYPTO_GCM is not set
> +# CONFIG_CRYPTO_SEQIV is not set
> +
> +#
> +# Block modes
> +#
> +CONFIG_CRYPTO_CBC=3Dy
> +# CONFIG_CRYPTO_CTR is not set
> +# CONFIG_CRYPTO_CTS is not set
> +CONFIG_CRYPTO_ECB=3Dy
> +# CONFIG_CRYPTO_LRW is not set
> +CONFIG_CRYPTO_PCBC=3Dm
> +# CONFIG_CRYPTO_XTS is not set
> +
> +#
> +# Hash modes
> +#
> +CONFIG_CRYPTO_HMAC=3Dm
> +# CONFIG_CRYPTO_XCBC is not set
> +# CONFIG_CRYPTO_VMAC is not set
> +
> +#
> +# Digest
> +#
> +CONFIG_CRYPTO_CRC32C=3Dy
> +# CONFIG_CRYPTO_GHASH is not set
> +# CONFIG_CRYPTO_MD4 is not set
> +CONFIG_CRYPTO_MD5=3Dy
> +CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> +# CONFIG_CRYPTO_RMD128 is not set
> +# CONFIG_CRYPTO_RMD160 is not set
> +# CONFIG_CRYPTO_RMD256 is not set
> +# CONFIG_CRYPTO_RMD320 is not set
> +CONFIG_CRYPTO_SHA1=3Dm
> +# CONFIG_CRYPTO_SHA256 is not set
> +# CONFIG_CRYPTO_SHA512 is not set
> +# CONFIG_CRYPTO_TGR192 is not set
> +# CONFIG_CRYPTO_WP512 is not set
> +
> +#
> +# Ciphers
> +#
> +CONFIG_CRYPTO_AES=3Dy
> +# CONFIG_CRYPTO_ANUBIS is not set
> +CONFIG_CRYPTO_ARC4=3Dy
> +# CONFIG_CRYPTO_BLOWFISH is not set
> +# CONFIG_CRYPTO_CAMELLIA is not set
> +# CONFIG_CRYPTO_CAST5 is not set
> +# CONFIG_CRYPTO_CAST6 is not set
> +CONFIG_CRYPTO_DES=3Dy
> +# CONFIG_CRYPTO_FCRYPT is not set
> +# CONFIG_CRYPTO_KHAZAD is not set
> +# CONFIG_CRYPTO_SALSA20 is not set
> +# CONFIG_CRYPTO_SEED is not set
> +# CONFIG_CRYPTO_SERPENT is not set
> +# CONFIG_CRYPTO_TEA is not set
> +# CONFIG_CRYPTO_TWOFISH is not set
> +
> +#
> +# Compression
> +#
> +CONFIG_CRYPTO_DEFLATE=3Dy
> +# CONFIG_CRYPTO_ZLIB is not set
> +CONFIG_CRYPTO_LZO=3Dy
> +
> +#
> +# Random Number Generation
> +#
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +CONFIG_CRYPTO_HW=3Dy
> +# CONFIG_BINARY_PRINTF is not set
> +
> +#
> +# Library routines
> +#
> +CONFIG_BITREVERSE=3Dy
> +CONFIG_GENERIC_FIND_LAST_BIT=3Dy
> +CONFIG_CRC_CCITT=3Dy
> +CONFIG_CRC16=3Dy
> +CONFIG_CRC_T10DIF=3Dy
> +CONFIG_CRC_ITU_T=3Dm
> +CONFIG_CRC32=3Dy
> +CONFIG_CRC7=3Dm
> +CONFIG_LIBCRC32C=3Dy
> +CONFIG_ZLIB_INFLATE=3Dy
> +CONFIG_ZLIB_DEFLATE=3Dy
> +CONFIG_LZO_COMPRESS=3Dy
> +CONFIG_LZO_DECOMPRESS=3Dy
> +CONFIG_DECOMPRESS_GZIP=3Dy
> +CONFIG_DECOMPRESS_BZIP2=3Dy
> +CONFIG_DECOMPRESS_LZMA=3Dy
> +CONFIG_DECOMPRESS_LZO=3Dy
> +CONFIG_HAS_IOMEM=3Dy
> +CONFIG_HAS_IOPORT=3Dy
> +CONFIG_HAS_DMA=3Dy
> +CONFIG_NLATTR=3Dy
> diff --git a/recipes/linux/linux-igep2_2.6.28.10-0.bb b/recipes/linux/lin=
ux-igep2_2.6.28.10-0.bb
> index 092f6c1..807e89f 100644
> --- a/recipes/linux/linux-igep2_2.6.28.10-0.bb
> +++ b/recipes/linux/linux-igep2_2.6.28.10-0.bb
> @@ -5,7 +5,7 @@ KERNEL_IMAGETYPE =3D "uImage"
>
> =C2=A0COMPATIBLE_MACHINE =3D "igep0020"
>
> -DEFAULT_PREFERENCE_igep0020 =3D "1"
> +DEFAULT_PREFERENCE_igep0020 =3D "-1"
>
> =C2=A0SRC_URI =3D "http://downloads.myigep.com/sources/kernel/linux-omap-=
2.6.28.10-igep0020b-0.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://defconfig"
> diff --git a/recipes/linux/linux-igep2_2.6.33.7-0.bb b/recipes/linux/linu=
x-igep2_2.6.33.7-0.bb
> new file mode 100644
> index 0000000..57102e3
> --- /dev/null
> +++ b/recipes/linux/linux-igep2_2.6.33.7-0.bb
> @@ -0,0 +1,20 @@
> +require linux.inc
> +
> +DESCRIPTION =3D "2.6 Linux Kernel for IGEP based platforms"
> +KERNEL_IMAGETYPE =3D "uImage"
> +
> +COMPATIBLE_MACHINE =3D "(igep0020|igep0030)"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_igep0020 =3D "1"
> +DEFAULT_PREFERENCE_igep0030 =3D "1"
> +
> +KV =3D "${PV}-0"
> +
> +SRC_URI =3D "http://downloads.igep.es/sources/linux-omap-${KV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
> +
> +S =3D "${WORKDIR}/linux-omap-${KV}"
> +
> +SRC_URI[md5sum] =3D "61ce79815d2778d45082a33d9ebac779"
> +SRC_URI[sha256sum] =3D "a14af39dbb8f4c7d0748e858943069dc9a34a87a27f5147d=
f5881195142d6ea4"
> --
> 1.7.2.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


