Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1Qvlhr-0001wy-RA
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 09:47:32 +0200
Received: (qmail invoked by alias); 23 Aug 2011 07:35:26 -0000
Received: from 11.118.101.84.rev.sfr.net (EHLO [192.168.42.71]) [84.101.118.11]
	by mail.gmx.net (mp059) with SMTP; 23 Aug 2011 09:35:26 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18FczlFtRMFUzEpd4axV9hd1s5jNbieoMtucP3Kvs
	SWqwA6Mzqf5B58
Message-ID: <4E53583A.3030405@gmx.net>
Date: Tue, 23 Aug 2011 09:35:22 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de>
In-Reply-To: <4E5356B2.3060908@dresearch-fe.de>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Tue, 23 Aug 2011 07:47:32 -0000
X-Groupsio-MsgNum: 33785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6DA4AAC181E7ECD3A48EC987"

--------------enig6DA4AAC181E7ECD3A48EC987
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 23.08.2011 09:28, schrieb Steffen Sledz:
>>> | Making all in native
>>> | make[3]: Entering directory `/home/sledz/work/angstrom-setup-script=
s/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99=
=2E3-r11/cacao-0.99.3/src/native'
>>> | Making all in include
>>> | make[4]: Entering directory `/home/sledz/work/angstrom-setup-script=
s/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/cacao-0.99=
=2E3-r11/cacao-0.99.3/src/native/include'
>>> | /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/s=
ysroots/x86_64-linux/usr/bin/cacaoh-0.99.3/cacaoh -bootclasspath ../../..=
/src/classes/classes:/home/sledz/work/angstrom-setup-scripts/build/tmp-an=
gstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/classpath/=
glibj.zip -d . java.lang.Class
>>> | java.lang.ClassNotFoundException: java/lang/Object
Can you check the mentioned glibj.zip file whether it really contains a
java/lang/Object.class file and whether the path is right, etc.?

>> I'm not a java expert, but could this be related to <http://icedtea.cl=
asspath.org/bugzilla/show_bug.cgi?id=3D344>?
Quickly looking at it I'd say its not related as it is about building
cacao as part of icedtea7.

Regards,
Robert


--------------enig6DA4AAC181E7ECD3A48EC987
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk5TWDwACgkQG9cfwmwwEtqTSgCeIL91FUFQjU/gI1WMsc6Wr+HM
rDcAnA7/md4d++ezaK2bcCHekn5my16B
=JL9z
-----END PGP SIGNATURE-----

--------------enig6DA4AAC181E7ECD3A48EC987--
