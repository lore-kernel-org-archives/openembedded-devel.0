Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JzEYr-0000eZ-Nn
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 19:26:41 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 482DD1D90025E404 for openembedded-devel@lists.openembedded.org;
	Thu, 22 May 2008 20:31:04 +0200
Received: from [192.168.95.168] (unknown [192.168.95.168])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 6F90023E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2008 19:23:57 +0200 (CEST)
Message-ID: <4835AC2D.1070805@bolloretelecom.eu>
Date: Thu, 22 May 2008 19:23:57 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.14eol) Gecko/20080509 Thunderbird/1.5.0.14eol
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48346060.1030101@bolloretelecom.eu>
	<48352F30.1070202@linuxdevelopment.de>
In-Reply-To: <48352F30.1070202@linuxdevelopment.de>
X-Enigmail-Version: 0.94.2.0
Subject: Re: oestats: build statistics for OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 May 2008 17:26:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> Is it possible to sort the buildreports on machine`s and also add
> which host was used ( i686 or i686-64 ) ? and which target was
> build ( gpe-image - task-boot ) ???
>
For now you can filter by the following criteria:

- - build machine (e.g.: http://oestats.jerryweb.org/builders/waffle/)
- - package (e.g. http://oestats.jerryweb.org/builders/task-boot/)

Custom sorting is not yet implemented.

I will add some other variables like the architecture of the build
machine ASAP.

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFINawtCL1n3lVB9EYRAv6jAKDeZBxQg6B4APC+4Ga7GWqtL4zIVACdEfwQ
vHSEY0IaOwFelV8Wv3422hg=3D
=3DpqPl
-----END PGP SIGNATURE-----



