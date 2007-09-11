Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>)
	id 1IVBVg-0006p3-23; Tue, 11 Sep 2007 21:34:56 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8BJVmYY005139; Tue, 11 Sep 2007 21:31:48 +0200
Message-ID: <46E6ED26.6050208@student.utwente.nl>
Date: Tue, 11 Sep 2007 21:31:50 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IV99C-0000MV-IX@linuxtogo.org>
In-Reply-To: <E1IV99C-0000MV-IX@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev linux-handhelds-2.6: Update defconfig for	h2200 from defconfigman r377.
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
X-List-Received-Date: Tue, 11 Sep 2007 19:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pfalcon commit schreef:
> linux-handhelds-2.6: Update defconfig for h2200 from defconfigman r377.
> * This temporarily undos changes to enable USB and PCMCIA-Ether drivers,
> they will be re-added later (consistently for all devices which offer such 
> functionality). PCMCIA-WiFi support should be intact.

That is *unacceptable*. If you are going to fix it 'soon', leave the working defconfig
intact and commit your fixed version, instead of adding a broken one in between!

*disapproved*
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG5u0mMkyGM64RGpERAjDjAKC0DtaWN9fzthSIBplT2wIcaKNdYACfeD6P
hybv7MVipvsqtXUTq/Rj+LA=
=o4EQ
-----END PGP SIGNATURE-----


