Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IZtbU-0005WM-Br
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 21:28:24 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8OJNvxW003679 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 21:23:58 +0200
Message-ID: <46F80ECE.5050403@student.utwente.nl>
Date: Mon, 24 Sep 2007 21:23:58 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46F587F7.4060501@balister.org>	<c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>	<46F7DDF7.8060804@am.sony.com>
	<c384c5ea0709241104x576bc208p10184b5a9ec408cb@mail.gmail.com>
In-Reply-To: <c384c5ea0709241104x576bc208p10184b5a9ec408cb@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 19:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:

> I think (feel) that OE target development is driven by two main drivers:
> - target board availability for the enthousiasts (give free boards
> away to them!)

And PSUs for the boards! I'm running low on 12V ones ;)

> - support for a certain target architecture mixed with the automation
> leverage of OE. We mainly need arch and toolchain expertise here. If
> that's in place, the rest is easy.
> 
> I'm still thinking about how any funding could be spent wisely, but I
> would like to sleep a night on that.

On top of my wishlist:

Having (or access to) an autobuilder with enough diskspace to do multimachine build for
glibc, eglibc and uclibc for all machines in OE (About 100GB peak when using rm_work)
would be great. It would need >=1GB ram, access to a source mirror and have plenty diskspace.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG+A7OMkyGM64RGpERAk3pAJ9l6GLdSpQFTNhSZF0SJY9SOUBnUQCgtj1u
gW/WzvsTu35j8SZ3imxHFFg=
=r/3/
-----END PGP SIGNATURE-----


