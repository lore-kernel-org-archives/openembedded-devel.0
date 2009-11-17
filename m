Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NAO3K-0000Co-Dq
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 14:25:05 +0100
Received: from w1771.wlan.rz.tu-bs.de ([134.169.206.247] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NAO1q-0003JO-9L by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 14:23:41 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1NAO1p-000316-Kg
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 14:23:29 +0100
Date: Tue, 17 Nov 2009 14:23:29 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117132329.GC31694@excalibur.local>
References: <200911171337.35127.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200911171337.35127.marcin@juszkiewicz.com.pl>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Geode machines support changes
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
X-List-Received-Date: Tue, 17 Nov 2009 13:25:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hallo.

On Tue, 2009-11-17 at 13:37, Marcin Juszkiewicz wrote:
>
> - "xo"             - OLPC XO v1

As I added this I skip in here.

> I would like to do few changes:
> 
> 1. drop "geodelx" kernel and machine config.
> 2. rename "alix" to "geodelx" and use Alix defconfig
> 3. move all target related flags from machine configs to tune-geode.inc
>    - TARGET_ARCH
>    - glibc tune (GLIBC_ADDONS, GLIBC_EXTRA_OECONF)
> 
> Then we can consider changing TARGET_ARCH to i586 for Geode machines.
> 
> Opinions? suggestions?

I have no problems with this. I haven't tested with my XO for quite some time
and I don't think anyone else is doing it. From my side just go ahead and we can
fix problems later if they occur.

regards
Stefan Schmidt


