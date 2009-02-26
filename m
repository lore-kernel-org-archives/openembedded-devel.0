Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lcm6B-0003Md-Sr
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 20:40:49 +0100
Received: from [192.168.1.105] (e180159253.adsl.alicedsl.de [85.180.159.253])
	by drlauer-research.com (Postfix) with ESMTP id 9052458415A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 21:01:39 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
Organization: Vanille-Media
Date: Thu, 26 Feb 2009 20:37:26 +0100
Message-Id: <1235677046.2621.226.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: OE breakages, was: Re: fakeroot fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Feb 2009 19:41:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 26.02.2009, 18:20 +0100 schrieb Frans Meulenbroeks:
> > Maybe it's time for OE to consider whether it really wants a zillion
> > commits per day or only a few tested commits per day.

I think we want both, given the right branches. Let me again propose a
structure such as org.openembedded.{stable,testing,unstable} where only
cherry-picking from the more unstable to the lesser unstable branch is
allowed.

Note that this doesn't conflict with your idea of reviews, someone/some
people still need to decide which revs are good to cherry-pick.

> BTW, I noticed that there are a lot of bugs in bugzilla about packages
> that do not build. Most of these are old. Guess the bugs are fixed but
> no-one seems to close them.

I regularly scan the bugtracker doing my share of cleaning, more people
should do that.

-- 
:M:



