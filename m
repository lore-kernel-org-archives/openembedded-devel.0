Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JPgOw-0004GN-Iq
	for openembedded-devel@openembedded.org; Thu, 14 Feb 2008 16:53:30 +0100
Received: from Powerbook-2.local (vpn006019.vpn.utwente.nl [130.89.6.19])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1EFrCnr008675 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 16:53:13 +0100
Message-ID: <47B463E8.303@student.utwente.nl>
Date: Thu, 14 Feb 2008 16:53:12 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1JPfZq-0006fI-Ky@linuxtogo.org>
	<74d0deb30802140736j45e629dfr717549c267c0db53@mail.gmail.com>
In-Reply-To: <74d0deb30802140736j45e629dfr717549c267c0db53@mail.gmail.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev angstrom 2008: start lockdown file based on openmoko versions
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
X-List-Received-Date: Thu, 14 Feb 2008 15:53:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
| On Thu, Feb 14, 2008 at 4:00 PM, koen commit

|>   #Prefer a newer GTK+ and friends
|>  -PREFERRED_VERSION_gtk+                 = "2.12.3"
|>  -PREFERRED_VERSION_glib-2.0              = "2.14.4"
|>  -PREFERRED_VERSION_pango                 = "1.18.1"
|>  +PREFERRED_VERSION_gtk+                 ?= "2.12.3"
|>  +PREFERRED_VERSION_glib-2.0              ?= "2.14.4"
|>  +PREFERRED_VERSION_pango                 ?= "1.18.1"
|
| Why the change to ?= and why are those not in -preferred-versions.inc?

Because they will be in the -preferred-versions.inc in the future
(volunteers?).

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHtGPnMkyGM64RGpERAvEmAJ4yN5kAEYVKQSHpXOG/Lp4eZBC7ywCfTx6d
h+2LPlAerEirqlNLBugc4lg=
=d+8M
-----END PGP SIGNATURE-----


