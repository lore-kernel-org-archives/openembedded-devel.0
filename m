Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0A40573285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:27:21 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1bk9He-0001ft-3t from Joe_MacDonald@mentor.com ;
	Wed, 14 Sep 2016 05:27:22 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 14 Sep 2016 05:27:21 -0700
Received: by burninator (Postfix, from userid 1000)	id ADAE45807FB; Wed, 14
	Sep 2016 08:27:20 -0400 (EDT)
Date: Wed, 14 Sep 2016 08:27:20 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Message-ID: <20160914122720.GD25499@mentor.com>
References: <1473829173-3175-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1473829173-3175-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lksctp-tools: 1.0.16 -> 1.0.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 12:27:22 -0000
X-Groupsio-MsgNum: 63112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline

--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] lksctp-tools: 1.0.16 -> 1.0.17] On 16.09.14 =
(Wed 00:59) Wang Xin wrote:

> Upgrade lksctp-tools from 1.0.16 to 1.0.17.
>=20
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>

Is this any different than the one you sent out on Monday?  It looks
like an accidental re-send, but I thought I'd ask in case you intended
to send something different.

-J.

> ---
>  .../lksctp-tools/{lksctp-tools_1.0.16.bb =3D> lksctp-tools_1.0.17.bb}   =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.16=
=2Ebb =3D> lksctp-tools_1.0.17.bb} (94%)
>=20
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.=
bb
> similarity index 94%
> rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0=
=2E16.bb
> rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.1=
7.bb
> index e6a84cc..11c43ff 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
>      file://v6test.sh \
>  "
> =20
> -SRC_URI[md5sum] =3D "708bb0b5a6806ad6e8d13c55b067518e"
> -SRC_URI[sha256sum] =3D "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4=
f972f8deae351f26"
> +SRC_URI[md5sum] =3D "68e9b8fa4d4e331029b247b72d46d7a5"
> +SRC_URI[sha256sum] =3D "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c=
0a8ca9b10533aa15"
> =20
>  #| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=
=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home/jenkins/oe/world/shr-c=
ore/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/c=
onnectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .l=
ibs/recvmsg.o    -march=3Darmv5te -marm -mthumb-interwork --sysroot=3D/home=
/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-sc=
ript=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnu=
eabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o =
=2Elibs/libsctp.so.1.0.16
>  #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symb=
ol sctp_connectx has undefined version
> --=20
> 2.7.4
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJX2UIoAAoJEEn8ffcsOfaWQ00IAML985XA35bknqeuw79eOHbE
+UKAvRfQJcx1KO7na9XJNKFfpS6IM70HCN8SYjG1JmgFp87bIqj36tzrM2BqYoqR
ib/gBrQ584nAU4fzD2SlS5ZLH7IEQMnKesNiAeInOg6zLyNBE3wAyqLZJfV2TAvo
SQkL6Mtyr+kkP6VCVHkpFLXJMFqXERX4LUZl8AGfQmpmdhFHe1/YCf52f5ObDvP8
LaJJSSGEvgPOhfjQU+Q2wqdn3l3Y944gM5/16qkBbYsafsHMiQ3LFIpyy9ww9rQJ
wlTgGb06R2s+DyImf6QhtE/wwQsUdcmEI3oLo41ncrpA90rohiCDdr/SzADoKMk=
=eheU
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
