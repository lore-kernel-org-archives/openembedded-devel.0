Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GkeDs-0004vn-Sk
	for openembedded-devel@openembedded.org; Thu, 16 Nov 2006 11:11:56 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAGA9dLr011670 for <openembedded-devel@openembedded.org>;
	Thu, 16 Nov 2006 11:09:39 +0100
Message-ID: <455C38E0.7060809@dominion.kabel.utwente.nl>
Date: Thu, 16 Nov 2006 11:09:36 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <427d64720611160200n179c885cme530417c46cd492e@mail.gmail.com>
In-Reply-To: <427d64720611160200n179c885cme530417c46cd492e@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: minimo Segmentation fault on pxa270 board
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
X-List-Received-Date: Thu, 16 Nov 2006 10:11:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

axel lin schreef:
> hi list,
>     Is anyone sucessfuly run minimo on pxa270 board? ( I'm using
> angstrom disrto)
>     I always got "Segmentation fault" when start minimo.

You should have catchsegv, strace and gdb present in your rootfs :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFXDjgMkyGM64RGpERAm5iAJ9j8SN8y6hXTa2nD8gfwvdRbehF0gCdEszt
G0JnJv+bPC/5pNzVz2ehFOQ=
=mu8N
-----END PGP SIGNATURE-----


