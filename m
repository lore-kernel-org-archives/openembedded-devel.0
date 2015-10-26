Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 14EB16013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 23:04:03 +0000 (UTC)
Received: by ioll68 with SMTP id l68so204405450iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OlPcxLWVIu5oklmkVZPbhS6FC8g0f4F8cG1M5zzbaho=;
	b=PHdWemqSeJQmwcwthjRRdYkaFp7cyvuBlqRSeKSm7uD1/4kp4URLlyZwAKD/o6ifUc
	6Kjrnf0LLBJUEIgytAAhTnNkqwx0KbpQf/vNpjs+aYoSdqEhL4iIMdQZbXhnDQpMGIfj
	itUGU05+QfD6YhzX2Y2F1x9yqiZJPC3FuevnUauPov1Ph5yroEx0xu44u6Sb2EVZ8sm2
	wGfvHrHh9SgR91uMcUQRxgdgafMvxEoSNKlvWIyv8nTgixUo4gzQy8BWk+W+KlLC0Ni8
	lttDbJxV5pD/Yi+OQFuD/EnHCCFit2fXqgaADc7/zG18b2ROJkbdsZ20tRNrhzcM8zsx
	jkhw==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr33449152iod.148.1445900643824; 
	Mon, 26 Oct 2015 16:04:03 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Mon, 26 Oct 2015 16:04:03 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Date: Tue, 27 Oct 2015 00:04:03 +0100
Message-ID: <CALbNGRTSTCrQm6NtmjBze+fRyt-PVmXWmD51-Jqe-1XFifwV5Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 26 Oct 2015 23:04:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 26, 2015 at 8:18 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
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
> [x] product development
> [x] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [  ] Poky
> [x] Angstrom
> [  ] nodistro or custom
>
> How do you organize multiple git repos?
> [x] Git submodules
> [  ] Repo
> [x] Other
>
> What packaging system?
> [x] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [x] Qt
> [x] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [x] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [x] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [x] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [x] C
> [x] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [x] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
>
> _______________________

Andreas

