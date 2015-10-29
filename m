Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB2A75A38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:36:42 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so44534431pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UNdVqE+KsTRm6GVwwdUPA5QotmunAutOki7GQSJF8P0=;
	b=lOcacY1oznJ5YxpJ4ycg78aNebo5sGJc7CrffyQCZoxWjcdfGMOvVGUKMSCL52+z1+
	nDPXL2yYpOovVaaWv/cVgxcH+KY+Ro9TC+wrLYGqOLRmV9dYfITEEE5NIf8+QSATBrmA
	1217QcPemFyQUde8r0jVepk9LCUtE5rdBfCRSyPDtC3MYrAW+rsEsaY0kxDGNLrEHzGr
	EcxDm7KKK/o8qerRQkmWr5oUnuB45dyv4WpxlJm30YEAKPGdnNfNv4GnqCaZmxSw+gBz
	k9reY3hkxh2ob1oprQLiEgTEmV8nGr9ZW+MXYeHfVUI5y5UfXd66D8p9fo6IkWt79g7R
	sK8g==
MIME-Version: 1.0
X-Received: by 10.68.191.194 with SMTP id ha2mr2266461pbc.3.1446129403434;
	Thu, 29 Oct 2015 07:36:43 -0700 (PDT)
Received: by 10.66.14.33 with HTTP; Thu, 29 Oct 2015 07:36:43 -0700 (PDT)
In-Reply-To: <20151029115949.GC27480@ad.chargestorm.se>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
	<20151029115949.GC27480@ad.chargestorm.se>
Date: Thu, 29 Oct 2015 23:36:43 +0900
Message-ID: <CACrLJgA1e0Pf=itoV8s52ba2_qDAA8cL5wzR3AEn9Yue7i1JdQ@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
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
X-List-Received-Date: Thu, 29 Oct 2015 14:36:43 -0000
Content-Type: text/plain; charset=UTF-8

How long have you been using OE?  __3___


How do you use OE/Yocto?

[X] product development

[  ] hobby/research/education/yocto core developer, etc


What distro do you use?

[X] Poky

[  ] Angstrom

[X] nodistro or custom


How do you organize multiple git repos?

[  ] Git submodules

[  ] Repo

[X] Other


What packaging system?

[X] OPKG

[X] RPM

[  ] Other


What GUI toolkits?

[X] Qt

[  ] Gtk

[  ] EFL

[  ] HTML5/JS

[  ] Other


What init system?

[X] systemd

[  ] sysvinit

[  ] busybox init

[X] Other


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

[  ] C++

[  ] Python

[  ] Javascript

[  ] Lua

[X] Other


What do you use for Continuous Integration?

[  ] Buildbot

[X] Jenkins

[  ] Other


Do you use any any of the tooling projects

(https://www.yoctoproject.org/tools-resources/projects) such as ADT,

Hob, Toaster, etc?

2015-10-29 20:59 GMT+09:00 Anders Darander <anders@chargestorm.se>:

>
> How long have you been using OE?  6 years
>
> How do you use OE/Yocto?
> [ x ] product development
> [  ] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [  ] Poky
> [  ] Angstrom
> [ x ] nodistro or custom
>
> How do you organize multiple git repos?
> [ x ] Git submodules
> [  ] Repo
> [  ] Other
>
> What packaging system?
> [ x ] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [ x ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [ x ] systemd
> [  ] sysvinit
> [ x ] busybox init
> [  ] Other
>
> What libc?
> [ x ] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [ x ] application-SDK
> [  ] devshell
> [ x ] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [ x ] C
> [ x ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [ x ] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?  None yet.
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

