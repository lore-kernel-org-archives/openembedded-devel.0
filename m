Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D43657725B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:03:07 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so270443434wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OtNcqCOLFw0lf2R5XZqhc0iNLTPwSGz1wRoTfiVA+Xk=;
	b=nwppH5vtUqiy0j+vNT/ElMKt6EnHuatBty1uMpg5OM0WXa0tsZCMrqsNZACVKTuDzu
	Jme4nRJK5k0hkGmCm67MiFZEpJuRIahuWZxEx85OrZYeaiwontO6W1pJdPXEJwO9qXeg
	yJc6kc1I/El85HsKQrxqsnN6lopcjLgyJHnD7UKxyzFhvmFs1UvgEwGDUkxKfXIPE4dw
	+NLyXe8LXc4ztvQrTwrOgKZfsm4pjEeDUJMg849pEpapEB5myur2v6xj36hHpx70wifr
	ihRHFowvcvNfSkZ3x2/uUrb8Z6Cy4fyDK1Y4aI52gAWXClvtF1++jTdbfT1wFWsFqmQn
	oAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=OtNcqCOLFw0lf2R5XZqhc0iNLTPwSGz1wRoTfiVA+Xk=;
	b=YfYF61yewUzgN97elw1OJ+NFlkP+IZX+8DeSYHKbLIls3YSYoADFhVlqc9y1hErPSL
	gtHFJ3a3XT9MaxcVp1v1QBUEQmoD4bRHmn1bTwsPT2X8inYqdXkrhfmLXX10oBVM+BjA
	KehG/hHW5ZYNHDrwkooVEJJD6IaS8svWCdRbH1F7DLSzrl35P4d62ydK74IJowi6LYck
	9SNcwUJO9XCiVckWrnThxC+GzMZfMDRWC1aXec00jwZfeEbzaHHsoppXjTBQbUKLQA2M
	OV3ePAuKWTOjKLNU2C5bOWoJVETL/SjdBf0HIQq3IVRJXXcqJSnod0+/EczlS4jB671g
	cNGQ==
X-Gm-Message-State: AG10YOTdeboStR9riVjlgG1dg3U1Um7mQUZYAAIQwIc3dtHI0h6143JldPiM7Z3NR7gqWA==
X-Received: by 10.194.92.174 with SMTP id cn14mr45422468wjb.66.1456318987872; 
	Wed, 24 Feb 2016 05:03:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t3sm2966658wjz.11.2016.02.24.05.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:03:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:04:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224130413.GD7560@jama>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-8-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1456148105-9644-8-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-python][PATCH 08/11] python-mock: update to 1.3.0
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
X-List-Received-Date: Wed, 24 Feb 2016 13:03:09 -0000
X-Groupsio-MsgNum: 60180
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 08:35:02AM -0500, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

Do we need to use https for pypi? All these new versions are failing
with:

WARNING: python-mock-1.3.0-r0 do_fetch: Failed to fetch URL https://pypi.py=
thon.org/packages/source/m/mock/mock-1.3.0.tar.gz, attempting MIRRORS if av=
ailable
ERROR: python-mock-1.3.0-r0 do_fetch: Fetcher failure: Fetch command failed=
 with exit code 4, output:
OpenSSL: error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown protocol
Unable to establish SSL connection.

ERROR: python-mock-1.3.0-r0 do_fetch: Function failed: Fetcher failure for =
URL: 'https://pypi.python.org/packages/source/m/mock/mock-1.3.0.tar.gz'. Un=
able to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/python-mock/1.3.0-r0/temp/log.do_fetch.22=
652
NOTE: recipe python-mock-1.3.0-r0: task do_fetch: Failed

  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-mock_1.3.0.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-tornado-redis_2.4.18.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-ujson_1.35.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-monotonic_0.6.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-msgpack_0.4.7.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-flufl-enum_4.1.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-feedparser_5.2.1.bb, do_fetch

> ---
>  .../python/{python-mock_1.0.1.bb =3D> python-mock_1.3.0.bb}           | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-mock_1.0.1.bb =3D> py=
thon-mock_1.3.0.bb} (54%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb b/m=
eta-python/recipes-devtools/python/python-mock_1.3.0.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python-mock_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python-mock_1.3.0.bb
> index d336f61..8a7894c 100644
> --- a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python-mock_1.3.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "A Python Mocking and Patching Library for Testing"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D80e5ba73891255687dff3bee2=
b4cbb16"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dde9dfbf780446b18aab11f00b=
aaf5b7e"
> =20
> -SRC_URI[md5sum] =3D "c3971991738caa55ec7c356bbc154ee2"
> -SRC_URI[sha256sum] =3D "b839dd2d9c117c701430c149956918a423a9863b48b09c90=
e30a6013e7d2f44f"
> +SRC_URI[md5sum] =3D "73ee8a4afb3ff4da1b4afa287f39fdeb"
> +SRC_URI[sha256sum] =3D "1e247dbecc6ce057299eb7ee019ad68314bb93152e81d9a6=
110d35f4d5eca0f6"
> =20
>  inherit pypi setuptools
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNqkwACgkQN1Ujt2V2gBwpFwCgrcuSW1Mo8b260fp0gnxWqUUp
EhAAn3HwN5zP7rwodZARE5oZ5Vexi7kV
=xJ//
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
