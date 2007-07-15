Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1IA4EC-000089-4y
	for openembedded-devel@openembedded.org; Sun, 15 Jul 2007 15:33:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IA4Dp-0003KA-1z
	for openembedded-devel@openembedded.org; Sun, 15 Jul 2007 15:33:13 +0200
Received: from 62-50-199-121.client.stsn.net ([62.50.199.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 15 Jul 2007 15:33:13 +0200
Received: from koen by 62-50-199-121.client.stsn.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Jul 2007 15:33:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 15 Jul 2007 14:33:07 +0100
Message-ID: <f7d7mi$v0p$1@sea.gmane.org>
References: <468C7B11.8050809@openhardware.net>	<200707091643.00611.openembedded@hrw.one.pl>
	<469A20F8.2040707@openhardware.net>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: 62-50-199-121.client.stsn.net
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <469A20F8.2040707@openhardware.net>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: howto? Build something but not deploy in root image
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
X-List-Received-Date: Sun, 15 Jul 2007 13:33:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom Walsh schreef:

> Yes, that is what I was trying to avoid: building a custom image 
> recipe.  It just seemed that it should be possible to thwart the copy of 
> the kernel image into /boot from setting a variable or something.  The 
> OE system changes quite frequently and I found myself in trouble with my 
> own image recipe where I was "away" for several months and "returned".

You are highlighting the exact reason why not submitting your work for inclusion into OE
is bad.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGmiITMkyGM64RGpERAok3AJ9oXLOIVJaL1E9S/Dj3RousCPNY7QCdHHL1
wtaaFQRvQ8pwr9XCTLmdgR4=
=eKIP
-----END PGP SIGNATURE-----



