Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ixkd1-0002Nq-02
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 15:44:35 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lATEfUiq003487 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 15:41:30 +0100
Message-ID: <474ECF9A.6050603@student.utwente.nl>
Date: Thu, 29 Nov 2007 15:41:30 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <474EA852.7090306@whitby.id.au>
In-Reply-To: <474EA852.7090306@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
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
X-List-Received-Date: Thu, 29 Nov 2007 14:44:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Some machines don't have consoles, so the only way to access them on the
> first boot after a reflash is via the network.
> 
> Of course, an 'auto' keyword is required for this, and netbase currently
> has none.
> 
> Is there any reason why at least eth0 should not have an 'auto' keyword?
> 
> Should this be OE-wide, only for Angstrom (koen thinks eth0 and eth1
> should be auto), or only for specific machines (in which case, does
> anyone object to ixp4xx having auto eth0)?

+1 for OE wide


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHTs+aMkyGM64RGpERAtsvAJ9C+VMaervzVWZLtxXU6jKp7BTPyACcDAdM
fjkhfc+Tflx0X5v42JKwjxY=
=bBvk
-----END PGP SIGNATURE-----


