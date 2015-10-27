Return-Path: <andrei@gherzan.ro>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id B640F607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 09:12:51 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so58330445lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan_ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EiVKNj+Xy6tL7BEA6zF1HtfvaSq9Cp2ZZRgI5+iIdKc=;
	b=Q9I2a2G3jSq+ac8sdlQSeLF+T2qAwCAY14qHJNBJMWjeXkgaqsjnBIqXu6/EcyHdvj
	SqxYw8XZmzLU2dWYTIuOQf+Wkg1RopWpK9k5MHcUjg92sUTAs56n7iKZZX6t79I2wVxl
	P1L97QlfwjtORvYfnWmy38qSFFHPsqBcBYJEod6JH7809Zw1KNZmPJpcr+oLIqxdP0lZ
	Kny7jiWPXyzrH2cGDe2wDdnv2L9t2DBBvryxYgberEU5XlNiq1UZ775fyK3K1Zo4iRLP
	NS5H3aXLM8y2xGRJ+XN+GM1qEqAOYFwLXpmcARuEhrK5pjpLjR9sgszyUw/9R5HknOII
	ajyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=EiVKNj+Xy6tL7BEA6zF1HtfvaSq9Cp2ZZRgI5+iIdKc=;
	b=PmPV1O1mbwxHrxc+wovNJ09g6yI1pZq0aQeA6hEqux97ruBh+owyMm0hrxlkNYsKDj
	ykFOt5c2RXFoqq2O4N5l+6CEZQq5JKPNhXDRnbsRCd9gz/7+EzIO6rdRJ6mzlOJKVsPK
	8NGg8QQ3CsYIPgYdHclFFdMMa201QJiCOW6Rkn7Iz1FijfeTxV4Uza+d3veYKpSacYiL
	yLuBI89py4UZ9F+Gv7W3Iqs6YJdugPfduuzRGzOCyx9mwafSj56jodTXM/7gL0fysFqn
	E+lVpMTI7kbwYaW0z1ToUHnj7F91VxkbaegnhSmFVm1zqDyUFXQDM1tCSGAxdDuN/kUh
	jNFA==
X-Gm-Message-State: ALoCoQld3UdEeRn1o2kQGa0+ZQEFmzwcICV4vwsWeDA+DfOlRbFwmFcMfZFghrr8DPOx8iPHv6EF
X-Received: by 10.112.87.69 with SMTP id v5mr19390676lbz.70.1445937169996;
	Tue, 27 Oct 2015 02:12:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.71 with HTTP; Tue, 27 Oct 2015 02:12:10 -0700 (PDT)
X-Originating-IP: [88.67.185.162]
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 27 Oct 2015 10:12:10 +0100
Message-ID: <CAK18fxH92ozj2miOuBhz1sv=8wd3R3-f+woMq7UjQzD=F9AeJg@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Oct 2015 09:12:54 -0000
Content-Type: text/plain; charset=UTF-8

--
Andrei Gherzan


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
> How long have you been using OE?  __4__
>
> How do you use OE/Yocto?
> [ X] product development
> [ X] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [ X] Poky
> [  ] Angstrom
> [ X] nodistro or custom
>
> How do you organize multiple git repos?
> [  ] Git submodules
> [ X] Repo
> [  ] Other
>
> What packaging system?
> [  ] OPKG
> [ X] RPM
> [  ] Other
>
> What GUI toolkits?
> [ X] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [ X] systemd
> [ X] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [ X] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [ X] develop on PC, test on target
> [  ] Other
>
> What language do you primarily use for custom applications?
> [ X] C
> [  ] C++
> [ X] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [ X] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
>
> _no____________________
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

