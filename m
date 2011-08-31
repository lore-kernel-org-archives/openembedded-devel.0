Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QyjzH-0008Lx-B9
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:33:47 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	14:28:53 +0200
Date: Wed, 31 Aug 2011 14:29:06 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110831122905.GD3273@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j3l8ni$kr3$1@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:33:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110831 14:17]:
> Op 31-08-11 13:55, Anders Darander schreef:
> > * Koen Kooi <koen@dominion.thruhere.net> [110831 12:24]:
> >> Op 31-08-11 12:06, Paul Menzel schreef:
> >>> Am Mittwoch, den 31.08.2011, 09:15 +0200 schrieb Koen Kooi:
> >>>> please remove PR in new recipes
> >>> Actually I would favor to leave them in.
> >> Well I don't, and atm I decide if it goes in or not.
> > 
> > To sad. It's a lot easier to remember to bump the PR, when PR
> > actually is in the recipe. Thus, including PR=0 will often remove
> > one issue with patches.

> That's what review is for, no?

Sure, but if we can reduce the need for one extra comment, isn't that
good? Especially when it comes to newcommers.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


