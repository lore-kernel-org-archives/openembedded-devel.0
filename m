Return-Path: <wbx@uclibc-ng.org>
Received: from helium.waldemar-brodkorb.de (helium.waldemar-brodkorb.de
	[89.238.66.15])
	by mail.openembedded.org (Postfix) with ESMTP id 6A74161FE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 19:23:50 +0000 (UTC)
Received: by helium.waldemar-brodkorb.de (Postfix, from userid 1000)
	id 4B11D104DE; Mon, 21 Jul 2014 21:23:49 +0200 (CEST)
Date: Mon, 21 Jul 2014 21:23:49 +0200
From: Waldemar Brodkorb <wbx@uclibc-ng.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20140721192348.GJ4431@waldemar-brodkorb.de>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
	<CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
X-Operating-System: Linux 3.2.0-4-amd64 x86_64
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openwrt-devel@openwrt.org, buildroot@buildroot.org,
	openembedded-devel@lists.openembedded.org,
	uclibc-mailing list <uclibc@uclibc.org>
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
X-List-Received-Date: Mon, 21 Jul 2014 19:23:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Florian,
Florian Fainelli wrote,

> Hello,
> 
> (adding uclibc and Bernhard)
> 
> 2014-07-20 12:13 GMT-07:00 Waldemar Brodkorb <wbx@uclibc-ng.org>:
> > Hello Embedded Linux Hackers,
> >
> > it seems there is no plan to release a new uClibc version.
> > The current maintainer does not response on any public or private mails
> > about a plan to do a needed release. Therefore most of you carrying a lot
> > of patches against uClibc 0.9.33.2 to make it work in your project.
> > A really ugly situation.
> 
> Although I do welcome your action, and stepping in to offer a solution
> to this, I feel like forking might have the potential of making this
> situation worse, including, but not limited to:
> 
> - creating confusion between uclibc and uclibc-ng

What kind of confusion. uClibc-ng frontpage clearly states it is a
spin-off of uClibc.

> - pissing off Bernhard

May be I am already pissed off by him? In the past I send a patch
for mips64 n64 with no answer. After a ping a month later it got
applied. A bug report about broken sparc support never got a
response. Public mails of the buildroot project missing a release
got ignored. A private mail from me to Eric and Bernhard, response
from Eric that he is no longer involved, no answer from Bernhard.
So the selective answers of Bernhard are a problem, at least for me.

> - duplicating existing infrastructure instead of gaining access to it

I asked Bernhard if he wants to give up maintainership.

> - what if you end up in the same situation as uClibc, we all have busy lives?

So what is the situation of uClibc? The problem is lack of
communication. I would be fine if Bernhard would answer any mails
regarding non-technical issues with uClibc. A short mail "I am busy,
no release this year." would be at least a fair statement.
Or "I am very busy, having a new job, can someone make a release?"
 
> Thomas and I talked to Khem Raj about this uClibc situation during ELC
> back in June, and Khem offered some help to see if we could:
> 
> - make Bernhard aware of the lack of release situation
> - use his uclibc.org access to facilitate a 0.9.34? release

Nothing happened. Should I whine another year on the mailinglist
about a new release?
As an old OpenBSD user I am following:
Shutup and hack!
 
best regards
 Waldemar

