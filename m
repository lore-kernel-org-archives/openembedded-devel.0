Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IOCQM-0001J1-Gd
	for openembedded-devel@openembedded.org; Thu, 23 Aug 2007 15:08:39 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7ND7Kj1005880 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 15:07:21 +0200
Message-ID: <46CD869F.5070009@dominion.kabel.utwente.nl>
Date: Thu, 23 Aug 2007 15:07:43 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1ILHR9-0002dq-K3@linuxtogo.org>
In-Reply-To: <E1ILHR9-0002dq-K3@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev bluez-utils: Fix breakage of bluetooth on	htcuniversal by re-adding essential patch.
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
X-List-Received-Date: Thu, 23 Aug 2007 13:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

florian commit schreef:
> bluez-utils: Fix breakage of bluetooth on htcuniversal by re-adding essential patch.

bluez utils 3.15 (again) breaks that patch, so it isn't applied. The people that care
about it should rediff and submit it upstream (again).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGzYafMkyGM64RGpERAqtHAKCSq74pSaL/IWQ2K38Fl3c19WS2jgCfXVi0
Drr7BF7YZVOnj+wBrOeZ5bA=
=1L99
-----END PGP SIGNATURE-----


