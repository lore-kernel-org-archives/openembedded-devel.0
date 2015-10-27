Return-Path: <marc@cpdesign.com.au>
X-Greylist: delayed 1722 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Oct 2015 08:38:04 UTC
Received: from s36.web-servers.com.au (s36.web-servers.com.au [118.127.46.63])
	by mail.openembedded.org (Postfix) with ESMTP id 132B9755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:38:04 +0000 (UTC)
Received: from ppp59-167-120-30.static.internode.on.net ([59.167.120.30]:34718
	helo=dev2.localnet) by s36.web-servers.com.au with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.86)
	(envelope-from <marc@cpdesign.com.au>) id 1ZqzJo-003cdK-MP
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2015 19:09:20 +1100
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2015 19:08:34 +1100
Message-ID: <3871259.KM6vijoE1d@dev2>
User-Agent: KMail/4.14.9 (Linux/3.16.7-24-desktop; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - s36.web-servers.com.au
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cpdesign.com.au
X-Get-Message-Sender-Via: s36.web-servers.com.au: authenticated_id:
	marc@cpdesign.com.au
X-Authenticated-Sender: s36.web-servers.com.au: marc@cpdesign.com.au
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
X-List-Received-Date: Tue, 27 Oct 2015 08:38:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Cliff,

On Monday, October 26, 2015 03:18:54 PM Cliff Brake wrote:
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
> How long have you been using OE?  _3 years
> 
> How do you use OE/Yocto?
> [ x] product development
> [  ] hobby/research/education/yocto core developer, etc
> 
> What distro do you use?
> [  ] Poky
> [x ] Angstrom
> [x ] nodistro or custom
> 
> How do you organize multiple git repos?
> [  ] Git submodules
> [  ] Repo
> [x ] Other
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
> [  ] busybox init
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
> [x  ] develop on PC, test on target
> [  ] Other
> 
> What language do you primarily use for custom applications?
> [  ] C
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
> Hob, Toaster, etc?
> 
> _______________________

None.

We've not modified our initial product image for a few years now, apart from 
our specific app, so I haven't had any time to play with these newer tools.


HTH,

Cheers,
Marc


