Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbgjX-00049w-Ll
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 19:40:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbgjT-0007KL-3W
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 18:40:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 18:40:19 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 18:40:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 19:40:11 +0100
Message-ID: <frp2aa$2j5$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>
	<frojpb$m6j$1@ger.gmane.org>	<20080318181236.GF30966@smtp.west.cox.net>
	<87fxunkia6.fsf@frontier.dottedmag.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <87fxunkia6.fsf@frontier.dottedmag.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 18:40:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mikhail Gusarov schreef:
| Twas brillig at 11:12:36 18.03.2008 UTC-07 when Tom Rini did gyre and
gimble:
|
|  TR> So:
|  TR> - Maintained system (yay)
|  TR> - PGP signing
|
|  TR> Anything else, yet?
|
| http://wiki.openmoko.org/wiki/Opkg
|
| From "New Features":
|
| * Mark packages that were installed to satisfy dependancies (auto
installed)
| * Additional command line option to remove "auto installed" packages
| * Support for faceted classification (similar to debtags)

And medium-term I hope this patch gets ported to ipkg:

https://dev.openwrt.org/browser/trunk/package/busybox/patches/524-memory_usage.patch?rev=10125

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4AyLMkyGM64RGpERAqUpAJ4iokTOFFhXStpP59lszHoEqxPIlgCePyMu
p4CUez+wnMnNUqk61zdQtFs=
=gopi
-----END PGP SIGNATURE-----



