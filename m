Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QykDN-0000YB-3N
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:48:21 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	14:43:26 +0200
Date: Wed, 31 Aug 2011 14:43:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110831124339.GA19917@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
	<62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 31 Aug 2011 12:48:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110831 14:36]:
> Op 31 aug. 2011, om 14:27 heeft Paul Eggleton het volgende geschreven:

> > On Wednesday 31 August 2011 13:16:50 Koen Kooi wrote:
> >> Op 31-08-11 13:55, Anders Darander schreef:
> >>> To sad. It's a lot easier to remember to bump the PR, when PR actually is
> >>> in the recipe. Thus, including PR=0 will often remove one issue with
> >>> patches.
> >> 
> >> That's what review is for, no?
> > 
> > Surely you'd rather people have a better chance of getting it right the first 
> > time rather than you having to remind them for every patch? The almost 
> > insignificant burden of a PR = "r0" in each recipe seems worthwhile to me if it 
> > even helps a single person remember.

> I've found that in .dev having PR = r0 in recipes is a bigger burden
> than not having them, especially when using shared .inc files like
> xorg. And there have been enough patches where people don't get PR
> bumps right even if there's a PR already in the recipe. So I'm
> unconvinced that it makes a real difference in "getting it right".

> Even in the extreme case that every packaging patch is missing a PR
> bump that, for me,  is less annoying than issues I faced in .dev with
> PR = r0 sprinkled throughout the metadata.

Just curious (and it might convince me and others) what issues have PR =
"r0" caused in .dev?

/Anders

-- 
Anders Darander
ChargeStorm AB


