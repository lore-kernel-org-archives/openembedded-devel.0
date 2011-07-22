Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QkJfF-00015J-TD for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 19:37:29 +0200
Received: from f053038164.adsl.alicedsl.de ([78.53.38.164]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QkJc9-0007rl-Se for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 17:34:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311354305-24120-1-git-send-email-a.sappia@biotechware.com>
References: <1311354305-24120-1-git-send-email-a.sappia@biotechware.com>
Date: Fri, 22 Jul 2011 19:33:21 +0200
Message-ID: <1311356001.3984.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v3]] dbus-glib-native and dbus-glib were not compiling. This patch corrects dbus-glib-native to install required files in order to let dbus-glib to compile on target.
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
X-List-Received-Date: Fri, 22 Jul 2011 17:37:30 -0000
X-Groupsio-MsgNum: 33295
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w6BunObgvl+5vLP6T0nZ"

--=-w6BunObgvl+5vLP6T0nZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alessandro,


Am Freitag, den 22.07.2011, 19:05 +0200 schrieb Alessandro Sappia:

unfortunately your commit message does not follow the commit policy [1].
Please take a look at the commit log example [2].

Could you please send a v4 with the proper returns included and style
followed.

> Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
> ---
>  recipes/dbus/dbus-glib.inc     |    8 ++++----
>  recipes/dbus/dbus-glib_0.86.bb |    7 +------
>  2 files changed, 5 insertions(+), 10 deletions(-)

[=E2=80=A6]


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Policy
[2] http://openembedded.org/index.php/Commit_log_example

--=-w6BunObgvl+5vLP6T0nZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4ptFwACgkQPX1aK2wOHVjbpwCfakFsxLmHYu2XgUEaiRlVhUfY
hZIAnj9scO60+AQFRcIuYPfa4wiug/Fq
=bDx8
-----END PGP SIGNATURE-----

--=-w6BunObgvl+5vLP6T0nZ--
