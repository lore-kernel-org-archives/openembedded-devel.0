Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IIKyh-0000hk-Mr
	for Openembedded-devel@openembedded.org; Tue, 07 Aug 2007 11:03:47 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7791D1R014573; Tue, 7 Aug 2007 11:01:13 +0200
Message-ID: <46B834D5.20106@dominion.kabel.utwente.nl>
Date: Tue, 07 Aug 2007 11:01:09 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <19c1b8a90708070143m4d96e7a4l83f5bf02feafc395@mail.gmail.com>
In-Reply-To: <19c1b8a90708070143m4d96e7a4l83f5bf02feafc395@mail.gmail.com>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Openembedded-devel@openembedded.org
Subject: Re: Patch to enable eglibc-intermediate
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
X-List-Received-Date: Tue, 07 Aug 2007 09:03:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef:
> Hi Koen
> 
> This patch is needed to select eglibc-intermediate when eglibc is
> selected right now the defines from angstrom-eglibc.inc gets
> overridden.

I solved it differently a few minutes ago :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGuDTVMkyGM64RGpERArpwAJ9slpG1kWHn+ngOpXWGU4AhgBu6DgCgsOYX
LJz1oELs5g0/oZT1TXmD88U=
=CGlU
-----END PGP SIGNATURE-----


