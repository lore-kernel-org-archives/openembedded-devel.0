Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H19LV-0002U4-Or
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 23:40:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVMd8ls011721
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 22:39:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11203-07 for <openembedded-devel@openembedded.org>;
	Sun, 31 Dec 2006 22:39:05 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVMd1eC011712
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 22:39:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1167495233.4160.20.camel@ip6-localhost>
References: <1162936801.4808.78.camel@ip6-localhost>
	<1163273077.4395.96.camel@ip6-localhost>
	<1167491568.4160.16.camel@ip6-localhost>
	<459687A6.9020202@dominion.kabel.utwente.nl>
	<1167495233.4160.20.camel@ip6-localhost>
Date: Sun, 31 Dec 2006 22:39:03 +0000
Message-Id: <1167604743.5592.30.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: cross-compiling for x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Dec 2006 22:40:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2006-12-30 at 17:13 +0100, Patrick Ohly wrote:
> On Sat, 2006-12-30 at 16:37 +0100, Koen Kooi wrote:
> > Patrick Ohly schreef:
> > > Hi all,
> > > 
> > > I have had some time over the holidays to investigate this again and
> > > have come up with patches that solves the problem for me. I'm attaching
> > > them in the hope that someone else will find them useful and/or commit
> > > them on dev.
> > 
> > Could you attach them to the bugtracker? The mailinglist has a really short memory for
> > patches...
> 
> Done: see http://bugs.openembedded.org/show_bug.cgi?id=1728

Thanks.

> I wasn't sure whether you'd want work which seems to be unrelated to
> what everyone else does with OE in your tracker.

You're doing it with OE which means there is at least one user :).
Hopefully it will get merged. Even if it doesn't its easier to find in
the bugzilla if anyone has similar issues/needs.

Cheers,

Richard



