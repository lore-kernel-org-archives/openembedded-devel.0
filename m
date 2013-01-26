Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzEA7-0005r7-Ud
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2013 23:24:16 +0100
Received: by mail-wi0-f175.google.com with SMTP id hq12so29787wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2013 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=et23A02AKqbPhQ0yWgIeQNtETe77MKeAimINVgdzAjM=;
	b=rXlGIKpFQeiYMR9HV2Trg1VBqekbXin1t+XUiEAr7rUEyHIaeQ8PcnB8G3blN27dh7
	CS0iraS2BbHVtpqMfFmL6NB/HFEIz7xW4LDCqJQfAQ9Lxgk61gAWv3ZyQpQl7qO/RuFU
	UwI5mqtAi8YDKNC0UntJRrLFxFtt47JNylVyznMDN+1BPU3GUEVwhigkX4pSl/vZrKre
	vY6U8wIn1P3l4JVzde2KiOtmVl3ATd5emRoGMhBZRi03B/NwP4nos20MDasQkdzfysK8
	miz2uO/prmsFOqmN2csP3gxl7Jy816/ZMlxBVSeumKYQK18EgGrKvfWjFa3l/t5mQNlV
	2Q5A==
X-Received: by 10.180.107.130 with SMTP id hc2mr3426186wib.12.1359238091672;
	Sat, 26 Jan 2013 14:08:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id do1sm5170456wib.7.2013.01.26.14.08.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 26 Jan 2013 14:08:10 -0800 (PST)
Date: Sat, 26 Jan 2013 23:08:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130126220812.GI16904@jama.palm1.palmone.com>
References: <20130122122421.A87761034C@opal>
	<20130126114633.GG16904@jama.palm1.palmone.com>
	<ke0uf5$nr5$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ke0uf5$nr5$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Koen Kooi : apcupsd: add 3.14.10
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
X-List-Received-Date: Sat, 26 Jan 2013 22:24:19 -0000
X-Groupsio-MsgNum: 42855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Content-Disposition: inline

--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 26, 2013 at 04:58:39PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 26-01-13 12:46, Martin Jansa schreef:
> > On Tue, Jan 22, 2013 at 12:24:21PM +0000, git@git.openembedded.org
> > wrote:
> >> Module: meta-openembedded.git Branch: master Commit:
> >> be12fb6c0762fe474a4d7cda94e814c0c622dfb5 URL:
> >> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D=
be12fb6c0762fe474a4d7cda94e814c0c622dfb5
> >>
> >>
> >>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> >> Date:   Sun Jan 20 11:32:05 2013 +0000
> >>=20
> >> apcupsd: add 3.14.10
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> Signed-off-by:
> >> Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > There is new QA warning, can you fix that?
> >=20
> > apcupsd-3.14.10: apcupsd: Files/directories were installed but not
> > shipped /usr/share/hal /usr/share/hal/fdi /usr/share/hal/fdi/policy=20
> > /usr/share/hal/fdi/policy/20thirdparty=20
> > /usr/share/hal/fdi/policy/20thirdparty/80-apcupsd-ups-policy.fdi
>=20
> Yes, I was planning to just rm it in do_install_append since we don't have
> HAL in OE anymore. OK?

Sure

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEEU8wACgkQN1Ujt2V2gBzmVQCcCEmeW1cXBnVfOKU6ZLZqTSHS
MsMAn0BhnmPqeYvgSFwb1TCszJtvldIK
=7V1A
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
