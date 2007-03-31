Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HXb2S-0002Kx-6o
	for openembedded-devel@openembedded.org; Sat, 31 Mar 2007 12:42:28 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2VAgOox000693 for <openembedded-devel@openembedded.org>;
	Sat, 31 Mar 2007 12:42:25 +0200
Message-ID: <460E3B0E.7040307@dominion.kabel.utwente.nl>
Date: Sat, 31 Mar 2007 12:42:22 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <74d0deb30703300644n6462aa90kaaa06f199c3c0483@mail.gmail.com>
In-Reply-To: <74d0deb30703300644n6462aa90kaaa06f199c3c0483@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: X11R7.2 / epoch support
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
X-List-Received-Date: Sat, 31 Mar 2007 10:42:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> Hi openembedded-devel,
> 
> Yesterday we added the Xorg X11R7.2 release to OpenEmbedded. It is
> noteworthy that the packages make use of bitbake/OE's new epoch
> support. They drop the temporary X11R7.x_-prefix from their PV version
> and instead set the epoch to PE = "1".

With bitbake trunk, angstrom-2007.1 and various devices I haven't noticed any bugs with
epoch handling (buildtime and runtime) yet.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGDjsOMkyGM64RGpERAsBXAJ9amxuQM5VEitlG+z3UxBcdOlqeGQCgs/QU
u6gO4kRsdsEqfHnicFT6CfE=
=mEek
-----END PGP SIGNATURE-----


