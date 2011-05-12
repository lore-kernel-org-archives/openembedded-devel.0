Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKeBV-0007CX-19 for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 00:16:41 +0200
Received: from f053044015.adsl.alicedsl.de ([78.53.44.15]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKeA9-00089k-DI for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 22:15:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimdLk4S_0zjM8NTwXSxrTU_epdC+Q@mail.gmail.com>
References: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
	<1305236006.13652.41.camel@mattotaupa>
	<BANLkTimdLk4S_0zjM8NTwXSxrTU_epdC+Q@mail.gmail.com>
Date: Fri, 13 May 2011 00:13:53 +0200
Message-ID: <1305238433.13652.47.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Thu, 12 May 2011 22:16:41 -0000
X-Groupsio-MsgNum: 31963
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-x5IwvwfHe3WKYa3/UB8v"

--=-x5IwvwfHe3WKYa3/UB8v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin,


Am Donnerstag, den 12.05.2011, 17:54 -0400 schrieb Martin Bures:

> I will take a look at the policy and try to update the patch tomorrow.

thanks.

> As for your questions/comments about .config.  That was how the recipe wa=
s
> when I found it - I was just trying to make minimal modifications from wh=
at
> was there to get it working.  I agree that it could be changed to use
> defconfig.  As with the patch submission guidelines, I will take a look a=
nd
> see if this change as-suggested works correctly tomorrow and modify and
> resubmit the patch accordingly.

Please also take a look at commit aa35ba5c [1] and maybe even CC the
author and committer.

        commit aa35ba5cf7e1bf30fb2edb1408c0b599ec89290a
        Author: Steve Sakoman <steve@sakoman.com>
        Date:   Tue Apr 19 08:40:52 2011 -0700
       =20
            wpa-supplicant: Enable CONFIG_CTRL_IFACE_DBUS and CONFIG_CTRL_I=
FACE_DBUS_NEW
           =20
            Signed-off-by: Steve Sakoman <steve@sakoman.com>
            Signed-off-by: Koen Kooi <koen@openembedded.org>

I do not know what build configuration you use. Please remember to write
down what version you are using and what distribution and machine.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Daa35ba5=
cf7e1bf30fb2edb1408c0b599ec89290a

--=-x5IwvwfHe3WKYa3/UB8v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3MW6EACgkQPX1aK2wOHVg1ZACeIlCkTWi6RC6YtPeTE6kbd4Bd
VaoAmgKHrXtdbjBemt3dxlCpymCee58f
=B4Rc
-----END PGP SIGNATURE-----

--=-x5IwvwfHe3WKYa3/UB8v--
