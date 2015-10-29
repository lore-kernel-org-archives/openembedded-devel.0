Return-Path: <coldnew.tw@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E32B675D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 06:01:41 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so9845266qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LtM9jRJTxL7nrEkelSfuPPYndh/q6VNQMO9Uh1VgYGw=;
	b=FOXTvdvHz62uzUB7SMH+1mOqWPcQeg5hQMHaJU2wejm4JC426yybj8kniZNfT3YkQC
	2bl4mgbSisIwe4MmZTkutCL7TzXzL1pFaM3+rfd617gHieKwYzeTMzNSoTH1+VOCI/Fu
	hik3c5c4mbtB0AQIohnikloFVtaPZ1YXeoVtNp9DgU+vShJ2Yh/LKUnr+kDufyjKPlnI
	LVjZVvAXf/WwaMp06FduXHTW0Y+OBdzEyjtwae01upc5JeEbqgcM7DnwP+A4H5IN52qV
	lMuatxwe2dgtoqz1FAU7U658Zi92QpBDQKv6cn+oO7KkuIMUri660bzCMHxssSqY/Vbm
	87Zw==
MIME-Version: 1.0
X-Received: by 10.55.200.220 with SMTP id t89mr62297284qkl.78.1446098501661;
	Wed, 28 Oct 2015 23:01:41 -0700 (PDT)
Received: by 10.55.165.202 with HTTP; Wed, 28 Oct 2015 23:01:41 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Date: Thu, 29 Oct 2015 14:01:41 +0800
Message-ID: <CAF6djU8XkOUyq1qUcb3B8oTQrGWWPrDu8SnPrcLGV6EV5W9DMQ@mail.gmail.com>
From: =?UTF-8?B?5b2l55G+?= <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 29 Oct 2015 06:01:42 -0000
Content-Type: text/plain; charset=UTF-8

How long have you been using OE?  __3 years _

How do you use OE/Yocto?
[X] product development
[  ] hobby/research/education/yocto core developer, etc

What distro do you use?
[  ] Poky
[  ] Angstrom
[X] nodistro or custom

How do you organize multiple git repos?
[  ] Git submodules
[X] Repo
[  ] Other

What packaging system?
[X] OPKG
[  ] RPM
[  ] Other

What GUI toolkits?
[X] Qt
[  ] Gtk
[  ] EFL
[  ] HTML5/JS
[  ] Other

What init system?
[  ] systemd
[  ] sysvinit
[X] busybox init
[  ] Other

What libc?
[X] glibc
[  ] uclibc
[  ] musl
[  ] Other

How do you develop custom applications?
[  ] application-SDK
[  ] devshell
[X] develop on PC, test on target
[  ] Other

What language do you primarily use for custom applications?
[  ] C
[X] C++
[  ] Python
[  ] Javascript
[  ] Lua
[  ] Other

What do you use for Continuous Integration?
[  ] Buildbot
[X] Jenkins
[  ] Other

Do you use any any of the tooling projects
(https://www.yoctoproject.org/tools-resources/projects) such as ADT,
Hob, Toaster, etc?

Toaster

2015-10-27 3:18 GMT+08:00 Cliff Brake <cbrake@bec-systems.com>:

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
> How long have you been using OE?  _____
>
> How do you use OE/Yocto?
> [  ] product development
> [  ] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [  ] Poky
> [  ] Angstrom
> [  ] nodistro or custom
>
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [  ] Other
>
> What packaging system?
> [  ] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [  ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [  ] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [  ] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [  ] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [  ] C
> [  ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [  ] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
>
> _______________________
>
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
>
> Thanks,
> Cliff
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

