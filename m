Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BF613760AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 10:25:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so3154592wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mFE6vjxWD3BjY/x4wo9ugohfVJkD+IQ8nme53CZVj+Q=;
	b=V3SJs8e7mKckTeG+XB9GXz3yJo29CpvKRqjYaR3UWO/EO8gIqAHdyKHF6kIL4QK4TB
	zR1I3jTwlHfj9/GFvpEaOJDSyL3uUqlysp+AiiFdu3MHXzsiR+eT5liNv3qSjpIIaQ9F
	HJ3uaQNlE77EwX2QKjKriiZJl2ITORqaUh+eYtH+MUehyL5c2QzU28jjW8JDeeHZ0lqM
	NhSmLIqPFRDKT5Mt3tuTTAGqGXiAnP8SV9FBU1HYCWq7/63wo+yzUZ/wV7yEXE0iT40j
	+dLJ7y5m0WMTjTJfGNgULn7yNDKDTQOR7P7iFEQU0VszVPeJgTcerYHYmLOSzqGviQ5N
	q4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mFE6vjxWD3BjY/x4wo9ugohfVJkD+IQ8nme53CZVj+Q=;
	b=bj9BgB7fDN8Ds7CsWct0G8NY/bShMSma8zlFMFya1sikx/UAy4EFVmN2XZxmCNlcwv
	g51JmN/Hf+cZX4gGfl6Nkw22/6B6gmoWsmfN0297aiBSbWwP0cgUQ/Uec3C17xMmXrNT
	rjJxwjaqHUQo1KyA/Mc89I/jjf6XEKhRjAuqlEkgVbwDe2/YdfKmHRZ8JD44sA3dLFAu
	VCtlyQLUBPFtORXehnX6c5GzvHI9OnVWtnW5UuCq0vN5uLsSHETDBICiHAXDRT0xZ3M7
	nXSSWkWqG6jLDjCiFibq52jXa6RcLK6gwDxugLRalAa2nNoBLgqUBSn+cYyRLFu9DTu1
	VnmQ==
X-Gm-Message-State: AEkooutXtB8VO7SLbs7TOCOoeoy1WoieCM/ojssi3o87bAAv2mY8WwJ/QOFiHfWFGymPnw==
X-Received: by 10.194.23.39 with SMTP id j7mr71664752wjf.4.1470392759401;
	Fri, 05 Aug 2016 03:25:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	vv2sm5828583wjc.29.2016.08.05.03.25.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Aug 2016 03:25:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Aug 2016 12:26:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160805102607.3vjn6rnrd4gpnllc@jama>
References: <1470297259-25322-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1470297259-25322-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH] ntp: make ntp and alternative for ntpd
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
X-List-Received-Date: Fri, 05 Aug 2016 10:26:00 -0000
X-Groupsio-MsgNum: 62443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vyisg2cfay6nquy6"
Content-Disposition: inline

--vyisg2cfay6nquy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2016 at 09:54:19AM +0200, Pascal Bach wrote:
> This way ntp can be used as an alternative to ntpd from busybox

It was upgraded to 4.2.8p8 almost 2 months ago, please rebase and
test your changes on recent master branch before sending them!

OE @ ~/meta-openembedded $ git show -1 --pretty=3Dfuller 13db3c6
commit 13db3c65f525a6c87cd51961c3c1816e059478b9
Author:     fan.xin <fan.xin@jp.fujitsu.com>
AuthorDate: Tue Jun 7 18:18:26 2016 +0900
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Wed Jun 15 19:52:21 2016 -0400

    ntp: Security fixes via Upgrade to 4.2.8p8

>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.8p7.bb
> index ff4ba64..63e7d60 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> @@ -125,7 +125,7 @@ RCONFLICTS_ntpdate +=3D "ntpdate-systemd"
> =20
>  RSUGGESTS_${PN} =3D "iana-etc"
> =20
> -FILES_${PN} =3D "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/in=
it.d/ntpd ${libdir} \
> +FILES_${PN} =3D "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir=
}/init.d/ntpd ${libdir} \
>      ${NTP_USER_HOME} \
>      ${systemd_unitdir}/ntp-units.d/60-ntpd.list ${libexecdir}\
>  "
> @@ -158,3 +158,9 @@ pkg_postinst_ntpdate() {
>      fi
>  }
> =20
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> +ALTERNATIVE_${PN} =3D "ntpd"
> +ALTERNATIVE_LINK_NAME[ntpd] =3D "${sbindir}/ntpd"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vyisg2cfay6nquy6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlekaWYACgkQN1Ujt2V2gBxvewCfer6IwRC32x+uQGhLdERE319O
aYwAoIBzFLbEwgnScLrxtdd6vhgexTpM
=bCD1
-----END PGP SIGNATURE-----

--vyisg2cfay6nquy6--
