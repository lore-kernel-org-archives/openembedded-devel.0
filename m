Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0jy0-00070O-Fe
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 21:38:36 +0100
Received: from Powerbook-2.local (vpn006044.vpn.utwente.nl [130.89.6.44])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB7KYeiq029959 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2007 21:34:40 +0100
Message-ID: <4759AE61.2070803@student.utwente.nl>
Date: Fri, 07 Dec 2007 21:34:41 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <145452892.20071207195745@vanille-media.de>
In-Reply-To: <145452892.20071207195745@vanille-media.de>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: monotone merge flood
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
X-List-Received-Date: Fri, 07 Dec 2007 20:38:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> All,
> 
> I have seen a monotone merge flood these days. Let me please remind
> you to mtn pull && mtn update before mtn push'ing.

That doesn't help to avoid merges, since you already committed the
changes. The safest way to avoid a merge flood is to leave merging to
the OE automerger.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWa5hMkyGM64RGpERAkAgAKCVw01oVJoyj66ifnlL5OmWmOSqWgCfcElV
Nm3CEc6KS3C/GSbC228Psdw=
=znji
-----END PGP SIGNATURE-----


