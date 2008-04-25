Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JpPR7-0001eM-Fp
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 17:02:05 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 47F1FE37008FCC14 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 18:01:49 +0200
Received: from [192.168.95.63] (unknown [192.168.95.63])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 64E8323E38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2008 17:01:49 +0200 (CEST)
Message-ID: <4811F25C.7040402@bolloretelecom.eu>
Date: Fri, 25 Apr 2008 17:01:48 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
In-Reply-To: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 15:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am not sure whether this is the same issue but some time ago I filed
a bug report (with patch) because some of the configure.ac files did
not respect the PKG_CONFIG env variable and hence called the wrong
pkg-config:

https://bugs.freedesktop.org/show_bug.cgi?id=3D8185

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIEfJcCL1n3lVB9EYRArU8AKCiDqW6sTv+Dki8jabJEsrcI9JIKwCg1eRu
UWVU4XaSUis2GSQfudkJgDc=3D
=3DeWmG
-----END PGP SIGNATURE-----



