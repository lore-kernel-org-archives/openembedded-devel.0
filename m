Return-Path: <aguirre.nicolas@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 73398755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 17:09:56 +0000 (UTC)
Received: by vkgy127 with SMTP id y127so31229253vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cOWpRSqkjz+jCRvkPZzJ6cKvqdzCHkxVD3QzyaeTfwI=;
	b=nIx7Lhh0x8L5MrFWdr/XZ8ZGll9TKZxXswP5SUjUJtm4AT12Ex4nMkvKGvrA0vJ0j3
	ujWGfyeVNaJ0UiR5wXYlzYwgEELIBpAK/QjYkkqikNNkIxsKZlPT/DrXFNbiNNIpSNAb
	Q65MBkiTWG9ypq+4uEV+btFe7skceZFkxjetDKPLa87K/eHWs4ii1YIJupc6HAast/NP
	uPjm4hWsGlu9e9Y4Rlv1NlKZrljF1jd5KOxOZUOP2Gf/pa0A+YRIfowFzBeY+bi8qrnf
	FCeDkUr0pzJrH/bqOoiZ9nouaHjr4aeHBt13Y7C2Ks1os57D7duJ8hIsxjI7VwepE+y6
	s9Lg==
X-Received: by 10.31.33.75 with SMTP id h72mr2062346vkh.144.1446138596300;
	Thu, 29 Oct 2015 10:09:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.5.205 with HTTP; Thu, 29 Oct 2015 10:09:36 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Thu, 29 Oct 2015 18:09:36 +0100
Message-ID: <CAHTvVMf52FECRo1SPeuSPmK6sUA_ycAysOCTNy+CbZkx1ObXdw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:09:59 -0000
Content-Type: text/plain; charset=UTF-8

2015-10-26 20:18 GMT+01:00 Cliff Brake <cbrake@bec-systems.com>:
> Hi,
>

How long have you been using OE? 5 years

How do you use OE/Yocto?
[x] product development
[x] hobby/research/education/yocto core developer, etc

What distro do you use?
[  ] Poky
[  ] Angstrom
[x] nodistro or custom

How do you organize multiple git repos?
[  ] Git submodules
[  ] Repo
[x] Other

What packaging system?
[x] OPKG
[  ] RPM
[  ] Other

What GUI toolkits?
[x] Qt
[  ] Gtk
[x] EFL
[  ] HTML5/JS
[  ] Other

What init system?
[x] systemd
[  ] sysvinit
[  ] busybox init
[  ] Other

What libc?
[x] glibc
[  ] uclibc
[  ] musl
[  ] Other

How do you develop custom applications?
[x] application-SDK
[  ] devshell
[  ] develop on PC, test on target
[  ] Other

What language do you primarily use for custom applications?
[x] C
[x] C++
[  ] Python
[  ] Javascript
[  ] Lua
[  ] Other

What do you use for Continuous Integration?
[  ] Buildbot
[x] Jenkins
[  ] Other

-- 
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://www.calaos.fr
Blog: http://dev.enlightenment.fr/~captainigloo/

