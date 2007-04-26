Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hh6pz-0003oZ-JH
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 18:28:55 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3QGK1Lr004186 for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 18:20:01 +0200
Message-ID: <4630D132.4070700@dominion.kabel.utwente.nl>
Date: Thu, 26 Apr 2007 18:20:02 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4630CBF2.1080107@dominion.kabel.utwente.nl>
In-Reply-To: <4630CBF2.1080107@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Checksum problems with js package
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
X-List-Received-Date: Thu, 26 Apr 2007 16:28:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> The source checker errorred out on js-1.5.tar.gz, and I'm wondering if checksums.ini is
> correct. I need this patch to make the checker happy:
> 
>  [http://ftp.mozilla.org/pub/mozilla.org/js/older-packages/js-1.5.tar.gz]
> -md5=7736c915a4949e7f6891f6c64a5ce495
> -sha256=1faa36039d64e2ec24a02a58794fda237479111b55197450fe4710c73d0b44ba
> +md5=863bb6462f4ce535399a7c6276ae6776
> +sha256=ef72a154320c9949f8de0732e8dbfa186b83feb0a5e890d90807757de9998585
> 
> Is there a guideline/policy for disputing the checksums?

Same thing, Xorg:

NOTE: The MD5Sums did not match. Wanted: 'ea291c89e68832d570d9d5e007218bd6' and Got:
'2d59fd4e5f2756fed3717b93ec0e5df6'
NOTE: Task failed: Checksum of
'http://xorg.freedesktop.org/releases/individual/xserver/xorg-server-1.2.0.tar.bz2' failed
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGMNEyMkyGM64RGpERAkudAKCQttxZ/kDhRqmSQG+4MS66WaIkBwCgkTi0
f/O/YmCV3OFpPcjZeU5ycDw=
=zCKr
-----END PGP SIGNATURE-----


