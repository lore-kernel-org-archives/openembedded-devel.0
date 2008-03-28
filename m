Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JfHH2-00009l-PY
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 17:17:48 +0100
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 479F73A8017F041D for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 18:13:54 +0100
Received: from [192.168.95.62] (unknown [192.168.95.62])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 07CD223E57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2008 17:17:46 +0100 (CET)
Message-ID: <47ED1A29.5090109@bolloretelecom.eu>
Date: Fri, 28 Mar 2008 17:17:45 +0100
From: =?ISO-8859-2?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<200803272104.30232.openembedded@haerwu.biz>
In-Reply-To: <200803272104.30232.openembedded@haerwu.biz>
X-Enigmail-Version: 0.94.2.0
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Fri, 28 Mar 2008 16:17:48 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


>
> So creation of "opkg-nogpg":
>
> require opkg_svn.bb EXTRA_OECONF +=3D "--disable-gpg"
+1 for providing a gpg-less opkg

My main reason for not wanting gpg is not size (in my case gcrypt &
friends
get pulled into my image anyhow), it's that there is no indication of how
Packages.sig should be generated!

=3D> does package_ipk.bbclass need updating to generate Packages.sig?

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH7RopCL1n3lVB9EYRAkHkAKCrqjdCAdHw6QAZ72L3XzyATJN2hQCgw6uP
lotiZINAIi0I4mQr15gUxEs=3D
=3D8anQ
-----END PGP SIGNATURE-----



