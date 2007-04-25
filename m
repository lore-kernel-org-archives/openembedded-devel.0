Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HgoW0-0008Dq-Kg
	for openembedded-devel@openembedded.org; Wed, 25 Apr 2007 22:55:04 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3PKkFLr019223 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2007 22:46:15 +0200
Message-ID: <462FBE16.9070805@dominion.kabel.utwente.nl>
Date: Wed, 25 Apr 2007 22:46:14 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HgoSJ-0008AG-St@linuxtogo.org>
In-Reply-To: <E1HgoSJ-0008AG-St@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev xtscal: attempt to fix miscalibrations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2007 20:55:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> xtscal: attempt to fix miscalibrations

Could people with one of:
"HP IPAQ H3600" | "HP IPAQ H3700" | "HP IPAQ H3900" | "HTC Universal" | *COLLIE | *POODLE
| *SPITZ | *AKITA | *BORZOI

check if calibration isn't 90 degrees of anymore?

If not, we most likely need to revert revision d18552e5056a026d8ed8959e135b2fa05c3e1b6b

thanks,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGL74WMkyGM64RGpERArL6AJ9650uuYRwFPYEiX6uhAxCkzjKGDwCgtrp1
xYkYIvAbAd0zasrxpkCcbvs=
=u97/
-----END PGP SIGNATURE-----


