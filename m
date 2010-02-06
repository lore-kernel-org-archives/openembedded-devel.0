Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ndfha-0004tq-KV for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 09:07:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NdffA-0002Lg-7b for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 09:05:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 09:05:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 09:05:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 06 Feb 2010 09:04:46 +0100
Message-ID: <hkj7qt$183$1@ger.gmane.org>
References: <20100206062304.GC25236@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <20100206062304.GC25236@denix.org>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom on Archos 5IT
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
X-List-Received-Date: Sat, 06 Feb 2010 08:07:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-02-10 07:23, Denys Dmytriyenko wrote:
> Angstrom on Archos 5IT:
> 
> http://www.archos.com/products/imt/archos_5it/dualoslinux.html

The first batch is already in:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1fa0831219bd3fe19e07005b35d370a7d45689e3

Feel free to add in the updated (e.g. the 2.6.27 kernel).

This is one of the few examples where a company is a better opensource
citizen than the "open source" commuity around their devices.

If only those openoas dudes weren't so hellbent on keeping their fixes
to themselves and pushed them back to angstrom and OE :(

So, GPE dudes, if you want lots of fixes for GPE software, go through
http://dev.openaos.org/browser/trunk/openembedded/build/openaos

I've tried contacting the openaos people, but no response whatsoever :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLbSKeMkyGM64RGpERAmv1AKCzkePkV9V34UFdFpVjBfAHrkx3vQCeOp/U
1E4POwdO9G7EYRGloVMCH8I=
=SBae
-----END PGP SIGNATURE-----



