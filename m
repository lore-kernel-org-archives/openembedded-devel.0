Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RG8kT-00024C-Ho
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 14:26:25 +0200
Received: from ad.chargestorm.se (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.83.0;
	Tue, 18 Oct 2011 14:19:24 +0200
Date: Tue, 18 Oct 2011 14:19:36 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111018121936.GA23902@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com>
	<20111018062814.GA3751@ad.chargestorm.se>
	<4E9D6B7C.5000404@telia.com>
MIME-Version: 1.0
In-Reply-To: <4E9D6B7C.5000404@telia.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 12:26:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Ulf Samuelsson <ulf_samuelsson@telia.com> [111018 14:06]:
> 2011-10-18 08:28, Anders Darander skrev:
> > * Ulf Samuelsson<ulf_samuelsson@telia.com>  [111017 22:45]:
> >> If anyone is interested...
> > Build stats are always interesting... ;)

> >> Same machine in two different configurations.
> >> .........................................................#1...........................#2
> >> P8Z68V Pro
> >> Core-i7 2600K @                             3.4 GHz..................4.4 GHz
> >> 8 GB @ ...........................................1333
> >> MHz...............1640 MHz
> >> 1TB WD Black 7200 RPM
> >> Ubuntu 11-10
> >> Almost all source code already in source directory
> > This would severely restrict the usefulness of the comparison. I'd guess
> > that this means that in one case the source will be downloaded, while
> > it'll already be downloaded in the second test. Could you redo the
> > statistics with all sources downloaded?
> I had already built it once before running the first test then updated
> and I think one additional package was downloaded over a 100 MBps line
> so it affects a little, but not too much.

Ok, just curious. Not least as you had one image fail in the first
configuration, which you attributed to a failed download. That remark
made me wonder...

Cheers,
Anders

> I think the conclusion:
>      Increasing the CPU speed by 30% and the memory frequency by 20%
>      gives 10-15% faster build time is OK.

> >> Building meta-toolchain is 13% faster with overclocking.
> > Was the overclocking test run after the non-overclocking?


-- 
Anders Darander
ChargeStorm AB / eStorm AB


