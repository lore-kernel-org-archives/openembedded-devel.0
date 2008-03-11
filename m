Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ4jQ-0001nK-GE
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 14:41:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ4hU-00081F-T8
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 13:39:28 +0000
Received: from wlan141019.mobiel.utwente.nl ([130.89.141.19])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 13:39:28 +0000
Received: from koen by wlan141019.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 13:39:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 14:39:16 +0100
Message-ID: <fr6224$r42$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<200803111126.04715.openembedded@haerwu.biz>	<fr5ntp$n0v$1@ger.gmane.org>	<20080311114938.GM30267@ibawizard.net>	<20080311142330.35139ee1@widy.localdomain>
	<47D687F5.90604@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan141019.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47D687F5.90604@kernelconcepts.de>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 13:41:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Florian Boor schreef:
| Hi,
|
| Paul Sokolovsky schrieb:
|> That's because you don't know hg. Scientific studies has proven it to
|> be 27.92% easier.
|
| I'm tempted to agree blindly ;) Where did you find this?
| *If* the user interaction of hg is much better than git then this
would be a
| reason to prefer hg.

When I tested hg during the previous scm round it was way easier to use
than git, most likely because it's modeled after mtn, without the
annoying bugs like non-content conflicts and slowness.

Have a look at
http://www.ivy.fr/mercurial/ref/v1.0/Mercurial-QuickStart-v1.0-120dpi.png

btw, sun picked hg for their opensolaris stuff.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1ouDMkyGM64RGpERAjstAJ99n8IfV0DX2zpVcri9nZbDGH3PQwCgrpCI
ZR7nyf2/jXJtOUfo05Ltk8Q=
=wUS/
-----END PGP SIGNATURE-----



