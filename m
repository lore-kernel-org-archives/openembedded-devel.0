Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZEcr-00068z-AU
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 01:15:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2C0DLcj029473
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 00:13:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29440-01 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 00:13:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2C0DEZq029465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 00:13:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080312014043.572c6a26@widy.localdomain>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com> <47D6AF65.1020007@am.sony.com>
	<20080312014043.572c6a26@widy.localdomain>
Date: Wed, 12 Mar 2008 00:13:17 +0000
Message-Id: <1205280797.16531.29.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 00:15:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2008-03-12 at 01:40 +0200, Paul Sokolovsky wrote:
> On Tue, 11 Mar 2008 09:12:21 -0700 Tim Bird <tim.bird@am.sony.com> wrote:
> > Just a data point...
> > Sony uses git as its in-house SCM for Linux-related work.
> 
> Well, that's no wonder. Linux uses git, so everyone who does Linux
> development uses git. But now people think that: 1) if Linux kernel
> uses it, that everyone else must use it; 2) just as for many years
> before people have been thinking that there's no other SCM except CVS
> which can do better, then now they think there's no other DSCM except
> GIT which can do better. 
> 
> The last similarity is very striking, and let's just hope that we won't
> have reasons to say something like "hopefully we can agree CVS is a
> pretty bad SCM and that proves said entities don't know what
> they're doing" in regard to GIT.

In 10 years time we probably will have a better alternative. Thats fine,
my computer is a bit different to the one I had 10 years ago too.

Here and now, CVS is bad, git has a lot of positives.

How about we goes back to the discussion at hand? Technical merits of
git vs. hg or votes for not switching.

Cheers,

Richard





