Return-Path: <lchristina26@hotmail.com>
Received: from BAY004-OMC4S7.hotmail.com (bay004-omc4s7.hotmail.com
	[65.54.190.209])
	by mail.openembedded.org (Postfix) with ESMTP id 52A5572AD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:45:23 +0000 (UTC)
Received: from BAY168-W55 ([65.54.190.201]) by BAY004-OMC4S7.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Fri, 19 Dec 2014 12:43:22 -0800
X-TMN: [bTpSa5xEKpuMzvrkG25HZ5SBbNTm/HE8]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BAY168-W55F4DA0A3698FD6B08B449D66B0@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Dec 2014 13:43:21 -0700
Importance: Normal
In-Reply-To: <BAY168-W86B0FE2F269A2A25D84C5FD66B0@phx.gbl>
References: <BLU436-SMTP19311B478F533B1CE52EB1BD66A0@phx.gbl>,
	<20141219191538.GB2461@jama>,
	<BAY168-W86B0FE2F269A2A25D84C5FD66B0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Dec 2014 20:43:22.0625 (UTC)
	FILETIME=[6DFBEF10:01D01BCC]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] cyassl: updated to version 3.3.0, removed 3.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Dec 2014 20:45:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If you could explain exactly what I need to do to get just 3.3.0 added=2C n=
ot the previous version (3.2.0) which was never officially added=2C that wo=
uld be great.=20

From: lchristina26@hotmail.com
To: openembedded-devel@lists.openembedded.org
Subject: RE: [oe] [meta-networking][PATCH] cyassl: updated to version 3.3.0=
=2C removed 3.2.0
Date: Fri=2C 19 Dec 2014 13:39:36 -0700

=0A=
=0A=
=0A=
I'm a bit confused=2C why can't the version I submitted be added? I version=
 3.2.0 which was never officially submitted to meta-networking but switched=
 it to 3.3.0 so that 3.3.0 is added instead. I no longer want version 3.2.0=
 to be added=2C just 3.3.0.=20

From: martin.jansa@gmail.com
Date: Fri=2C 19 Dec 2014 20:15:38 +0100
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-networking][PATCH] cyassl: updated to version 3.3.0=
=2C removed 3.2.0

On Thu=2C Dec 18=2C 2014 at 01:20:33PM -0700=2C lchristina26 wrote:
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
=20
There isn't 3.2.0 version in meta-networking=2C so this doesn't apply
again.
=20
http://patchwork.openembedded.org/patch/81639/ wasn't applied because
updated patch wasn't sent (or was missed in patchwork).
=20
> ---
>  .../recipes-connectivity/cyassl/{cyassl_3.2.0.bb =3D> cyassl_3.3.0.bb}  =
| 4 ++--
>  1 file changed=2C 2 insertions(+)=2C 2 deletions(-)
>  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.2.0.bb =3D>=
 cyassl_3.3.0.bb} (81%)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> similarity index 81%
> rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index 508bab4..b6f852d 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -11=2C8 +11=2C8 @@ LIC_FILES_CHKSUM =3D "file://COPYING=3Bmd5=3Db234ee=
4d69f5fce4486a80fdaf4a4263"
> =20
>  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> =20
> -SRC_URI[md5sum] =3D "9f076e82d32bea986651ada34c49f6c0"
> -SRC_URI[sha256sum] =3D "c9e97cd3fa4697e55328c2016965ac4b304fcef45a10559c=
af540c42f1d5e93a"
> +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d4c=
05506aa98a296fe3"
> =20
>  inherit autotools
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
=20
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

-- =0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel 		 	   		=
   		 	   		  =

