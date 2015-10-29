Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4656675D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:08:32 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so217774823wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 22:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZFEiaA0zI3ekyE9UPK31j3yZhH6TybuO+GuFx1LSW4k=;
	b=qUPsnN46ujiHlxP6OuFNdFjGRe6Z7ueYbk0YZoixU+RKUQ++eV9KfP+FjqHgWU1Yzo
	r6tVcvcbPDtBjLmz1Pu9gvLA6IBMeebvtKsfjueKGSqS3cHr30NiESEabAOTYxRperad
	uHGd7GW6JpDVAumxGtumw72ledEUjCZ8DBLlQ45QygA1oZuhgYE2C4K0ZnmPsxK85KMG
	Jmk8QOMUjZ70nSu2ywoidg/VYjEnGDDDJTErkuY4RqtJTNpxSNMzMBbgK9itet/rbB0c
	agSUyE1CdoZwlj/cSo9fREgu5MN8eGqdm7392GjBi6kCxsgp5fpTLJEWL1r26dZtXNsD
	m3Ig==
X-Received: by 10.194.82.166 with SMTP id j6mr39229064wjy.63.1446095312643;
	Wed, 28 Oct 2015 22:08:32 -0700 (PDT)
Received: from [192.168.50.198] (ip-88-152-21-93.hsi03.unitymediagroup.de.
	[88.152.21.93]) by smtp.googlemail.com with ESMTPSA id
	5sm7157984wmg.14.2015.10.28.22.08.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 22:08:31 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Message-ID: <5631A9FF.4090605@gmail.com>
Date: Thu, 29 Oct 2015 06:09:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Subject: Re: OE/Yocto developer survey
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 05:08:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



Am 26.10.2015 um 20:18 schrieb Cliff Brake:
> Hi,
> 
> I'd like to get some feedback on the following questions -- feel free
> to respond to list, or directly to me, and I'll withhold your
> name/company from any results.
> 
> I would like to collect feedback until 2015-11-02, and will summarize
> the results after that.
> 
> My goal with this survey is to get a sense for best practices and what
> is most commonly used among Yocto/OE developers so I can better advise
> clients using Yocto/OE.  Hopefully this will also generate some
> interesting discussions.
> 
> How long have you been using OE?  __2012__
> 
> How do you use OE/Yocto?
> [ x] product development
> [  ] hobby/research/education/yocto core developer, etc
> 
> What distro do you use?
> [  ] Poky
> [ x] Angstrom
> [  ] nodistro or custom
> 
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [ x] Other
> 
> What packaging system?
> [ x] OPKG
> [  ] RPM
> [  ] Other
> 
> What GUI toolkits?
> [  ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
> [ x] None
> 
> What init system?
> [ x] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
> 
> What libc?
> [ x] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
> 
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [ x] develop on PC, test on target
> [  ] Other
> 
> What language do you primarily use for custom applications?
> [ x] C
> [  ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [ x] Other
> 
> What do you use for Continuous Integration?
> [  ] Buildbot
> [ x] Jenkins
> [  ] Other
> 
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
> 
> _____________No________
> 
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
> 
> Thanks,
> Cliff
> 

