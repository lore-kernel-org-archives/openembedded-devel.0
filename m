Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qykls-00029n-9T
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:24:00 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	15:18:55 +0200
Date: Wed, 31 Aug 2011 15:19:08 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110831131908.GB19917@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<201108311327.01907.paul.eggleton@linux.intel.com>
	<62BBB5B2-363D-49EA-AD5D-B67123C0F908@dominion.thruhere.net>
	<20110831124339.GA19917@chargestorm.se>
	<j3lba3$7a9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j3lba3$7a9$1@dough.gmane.org>
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
X-List-Received-Date: Wed, 31 Aug 2011 13:24:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110831 15:01]:
> Op 31-08-11 14:43, Anders Darander schreef:
> > Just curious (and it might convince me and others) what issues have PR = 
> > "r0" caused in .dev?

> The most recent one in .dev was xorg .inc files. Some recipes had PR, some
> didn't, and some had INC_PR. In this specific case there should have been
> only one PR (or INC_PR) in the .inc.

> And of course the good old "add PR=r0 to the .inc, making older recipes go
> backwards" thing.

> In OE-core/meta-oe the most recent annoyance were the gcc recipes, which now
> finally have a centrally managed PR.

> No situation is perfect, but my *personal* experience is that not adding
> PR=r0 is *less* annoying than adding it.

Thanks for the sum up.

At least I have a lot better understanding of your position now. (And
I'll have to ponder a little bit, to see if my opion should change or
not).

Thanks!
Anders

-- 
Anders Darander
ChargeStorm AB


