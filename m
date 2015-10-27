Return-Path: <ajlennon@dynamicdevices.co.uk>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Oct 2015 08:48:36 UTC
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id B5EB87570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id D27D427E3D8;
	Tue, 27 Oct 2015 08:40:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eeeiZBKG56TP; Tue, 27 Oct 2015 08:40:30 +0000 (UTC)
Received: from [192.168.0.2] (cpc47-live22-2-0-cust92.17-2.cable.virginm.net
	[86.17.157.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 8D04B27E3D6;
	Tue, 27 Oct 2015 08:40:29 +0000 (UTC)
To: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Message-ID: <562F387C.1020108@dynamicdevices.co.uk>
Date: Tue, 27 Oct 2015 08:40:28 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Subject: Re: [yocto] OE/Yocto developer survey
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
X-List-Received-Date: Tue, 27 Oct 2015 08:48:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 26/10/2015 19:18, Cliff Brake wrote:
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
> [X ] product development
> [X ] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [X ] Poky
> [  ] Angstrom
> [  ] nodistro or custom
>
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [X ] Other
>
> What packaging system?
> [  ] OPKG
> [X ] RPM
> [X ] Other
>
> What GUI toolkits?
> [  ] Qt
> [  ] Gtk
> [  ] EFL
> [X ] HTML5/JS
> [X ] Other
>
> What init system?
> [  ] systemd
> [X ] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [X ] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [X ] devshell
> [X ] develop on PC, test on target
> [X ] Other
>
> What language do you primarily use for custom applications?
> [X ] C
> [  ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [X ] Other
>

Visual Studio C# .NET + Mono

> What do you use for Continuous Integration?
> [  ] Buildbot
> [  ] Jenkins
> [X ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?

No

> _______________________
>
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
>
> Thanks,
> Cliff


