Return-Path: <wbx@uclibc-ng.org>
Received: from helium.waldemar-brodkorb.de (helium.waldemar-brodkorb.de
	[89.238.66.15])
	by mail.openembedded.org (Postfix) with ESMTP id 002E07022A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 19:35:22 +0000 (UTC)
Received: by helium.waldemar-brodkorb.de (Postfix, from userid 1000)
	id 41FD0104DE; Mon, 21 Jul 2014 21:35:23 +0200 (CEST)
Date: Mon, 21 Jul 2014 21:35:23 +0200
From: Waldemar Brodkorb <wbx@uclibc-ng.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20140721193522.GK4431@waldemar-brodkorb.de>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
	<CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
	<20140721204239.61b225fe@free-electrons.com>
	<CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
X-Operating-System: Linux 3.2.0-4-amd64 x86_64
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	openwrt-devel <openwrt-devel@openwrt.org>,
	uclibc-mailing list <uclibc@uclibc.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	buildroot <buildroot@buildroot.org>
Subject: Re: [OpenWrt-Devel] uClibc-ng
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
X-List-Received-Date: Mon, 21 Jul 2014 19:35:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Florian,
Florian Fainelli wrote,

> To speak my mind, I think uClibc has no future in the next 2 or 3
> years, musl is a much more active project, with multiple embedded
> projects starting to use it, on the other end, (e)glibc has remedied
> its own problems and its useful again.

I am on your site here. But the 2-3 years must be become such a bad
time for embedded users? 
We already have separate repositories for ARC and NPTL support and for
Xtensa and NPTL. We have different projects all using different
patch sets on top of 0.9.33.x. Buildroot, OpenWrt, OpenEmbedded,
Freetz, Bering-Uclibc, OpenADK, Aboriginal (musl switch is in work).

I do not see such a bad split-off in musl. Why? Because musl have a 
responsive and active maintainer. 
 
> Bottom line is, I believe uClibc is a (relatively speaking) dead
> project already, forking it might be useful to keep the existing user
> base alive, but I expect all of them to transition to something active
> and maintained, whether that's glibc or musl.

Sure, and that is totally okay for me. I just wanna make the
existing userbase happy for the time, they can not switch to musl or
glibc. Why not make the transition smooth?

best regards
 Waldemar


