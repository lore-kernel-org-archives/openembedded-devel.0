Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JgFQu-0002ew-Or
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 10:32:00 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 479F73A80189684C for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 11:27:57 +0200
Received: from [192.168.95.62] (unknown [192.168.95.62])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id EDEA323E57
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 10:31:57 +0200 (CEST)
Message-ID: <47F0A180.3060508@bolloretelecom.eu>
Date: Mon, 31 Mar 2008 10:32:00 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47ED3CE1.7020000@bolloretelecom.eu> <47ED41B3.9050403@gmx.de>
In-Reply-To: <47ED41B3.9050403@gmx.de>
X-Enigmail-Version: 0.94.2.0
Subject: Re: uImage generation: kernel.bbclass vs linux.inc
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
X-List-Received-Date: Mon, 31 Mar 2008 08:32:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> This one is easy:
> KERNEL_IMAGE_BASE_NAME and KERNEL_IMAGE_SYMLINK_NAME should be '?=3D' s=
o
> that kernel recipes can overide it.
OK, I have commited this change.

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH8KGACL1n3lVB9EYRAudWAKCGMQcpozrc1mdpjLJjLi8qHQaJXACg3hdh
k5uLshIo8YT31DYD45tLIGI=3D
=3DJ9/h
-----END PGP SIGNATURE-----



