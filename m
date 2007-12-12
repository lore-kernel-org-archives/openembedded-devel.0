Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J2XPE-0000rX-EY
	for openembedded-devel@openembedded.org; Wed, 12 Dec 2007 20:38:08 +0100
Received: from Powerbook-2.local (vpn006150.vpn.utwente.nl [130.89.6.150])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBCJXf0k023985 for <openembedded-devel@openembedded.org>;
	Wed, 12 Dec 2007 20:33:41 +0100
Message-ID: <47603795.1000207@student.utwente.nl>
Date: Wed, 12 Dec 2007 20:33:41 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <475A6B2A.9000103@dominion.kabel.utwente.nl>
In-Reply-To: <475A6B2A.9000103@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Webkit update patch
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
X-List-Received-Date: Wed, 12 Dec 2007 19:38:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> If people want to try a more recent revision of webkit, they should use
> this patch:
> 
> * update to sane-srcrevs.inc to move to the current head
> * add midori 0.13 to test the library
> * Merge dftables compile fix from poky
> * update .pro and .pri files
> * add comment in webkit.inc on how to enable HTML5 media support
> 
> This patch hasn't been applied yet since openmoko-browser2 and
> openmoko-feedreader2 still use the old non-WebView API. I asked Holger
> to update those apps. Once that happens this patch will go in.

Code-master Holger has done so, and this patch is in now, along with a
change that makes the webkit ipkg 500kiB smaller[1].

regards,

Koen

[1] http://dominion.thruhere.net/koen/cms/slimming-down-packages

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHYDeVMkyGM64RGpERAhtgAJsGn1ZXouou4DZMKoMcab2c9+45sACePae0
X/dFZ3emAaXdEWnPpJh/5w0=
=U9Sd
-----END PGP SIGNATURE-----


