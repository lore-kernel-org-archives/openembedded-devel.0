Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JTwNI-0000D7-Np
	for openembedded-devel@openembedded.org; Tue, 26 Feb 2008 10:45:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JTwMj-0004Y8-T0
	for openembedded-devel@openembedded.org; Tue, 26 Feb 2008 09:44:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 26 Feb 2008 09:44:49 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Feb 2008 09:44:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 26 Feb 2008 10:44:43 +0100
Message-ID: <fq0n2c$jl5$1@ger.gmane.org>
References: <c67f1650802251755t37cda022y48a0c52c9a3c4ad5@mail.gmail.com>
	<1204018153.8150.15.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
In-Reply-To: <1204018153.8150.15.camel@dax.rpnet.com>
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
Subject: Re: [Fwd: Android on OMAP wiki page]
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
X-List-Received-Date: Tue, 26 Feb 2008 09:45:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Mon, 2008-02-25 at 17:55 -0800, QMan wrote:
|>> -----Original Message-----
|>> From: openembedded-devel-bounces@lists.openembedded.org
|>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
|>> Behalf Of Philip Balister
|>> Sent: Monday, February 25, 2008 4:57 PM
|>> To: openembedded-devel@openembedded.org
|>> Subject: [oe] [Fwd: Android on OMAP wiki page]
|>>
|>> I'm not up on the Android situation, but some of you might be
|>> interestes in this web page.
|>>
|>> Philip
|> Anyone know how hard getting Android into the OE build system would be?
|
| The only public source code image wise is the goldfish kernel. I added
| that to Poky and was able to run Poky images inside the android
| emulator:
|
|
http://svn.o-hand.com/view/poky/trunk/meta-extras/conf/machine/android-goldfish.conf?rev=3143&view=auto
|
http://svn.o-hand.com/view/poky/trunk/meta-extras/packages/linux/linux-android-goldfish_2.6.23-rc20.bb?rev=3144&view=auto
|
| Since Android is a binary release other than this, I'm not sure what
| else you want to do with OE?

Maybe extracted goldfish patches (e.g. for /dev/binder) applied to
linux*_2.6.2*.bb?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHw9+LMkyGM64RGpERAgD4AJ9LvtEVAgF61SZhTsPuxhOZvt0BSgCgkX21
SfYKgLLyIL8mUy+rHFLqd9M=
=rMdG
-----END PGP SIGNATURE-----



