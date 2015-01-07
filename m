Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 68A72729BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:42:45 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so923029wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VMDgTY7YVsPXE4djth3jb6YPGpVAu/f6vKPU+E7cDtQ=;
	b=qz9Gck7s2JMzr5/1s++YLUbP5nzE8TgbyUSGFaNgWggj14ikM8pRXWtMwxvRbfJjc5
	Tngo7zS2a/qgmb/f0x1PBsDCkYAv6ZMWH155uJ6/QxfL8sW90snBE08FDp2E9em4nPob
	LA/g+YDvq7puf79rq08yK68OwxiW2DoZS4oQFVFIBhLWnUAk92li/upphqf1XEbA80Po
	dvUFcO77DNkSjTrrvr66nGGszXa6utaMAGOJqZJY3dBoMudiXLujd910M2V4rUXneafw
	x5mXKRdPsW8XQeNoNqgJ+jS5n84mig84JIXdoESEPJZaI6zd2m35F9Eth1VQ4QKv7nbl
	5Jvg==
X-Received: by 10.194.85.197 with SMTP id j5mr4786097wjz.106.1420627365381;
	Wed, 07 Jan 2015 02:42:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fx6sm1601668wjc.39.2015.01.07.02.42.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:42:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:42:47 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150107104247.GK29986@jama>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
	<20150105115922.GF2484@jama> <20150107101423.GH29986@jama>
	<2715569.PMW4haZ672@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2715569.PMW4haZ672@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-webserver][PATCH v2 00/11] Merge modphp into php and upgrade
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
X-List-Received-Date: Wed, 07 Jan 2015 10:42:49 -0000
X-Groupsio-MsgNum: 53726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vk/v8fjDPiDepTtA"
Content-Disposition: inline

--vk/v8fjDPiDepTtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 10:34:43AM +0000, Paul Eggleton wrote:
> On Wednesday 07 January 2015 11:14:23 Martin Jansa wrote:
> > On Mon, Jan 05, 2015 at 12:59:22PM +0100, Martin Jansa wrote:
> > > Thanks for v2
> > >=20
> > > Please remember to update your old series as superseded when pushing
> > > newer version, it would help me a lot when sorting the pending patche=
s.
> >=20
> > Something is wrong:
> >=20
> > php-5.5.20: php requires
> > /tmp/work/core2-64-oe-linux/php/5.5.20-r0/image/usr/bin/php, but no
> > providers in its RDEPENDS [file-rdeps]
>=20
> That is very strange. Do you perhaps have any information on how you migh=
t=20
> reproduce that? I did not receive any QA warnings when building this.

Nothing special, it's shown in world builds as described in
http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vk/v8fjDPiDepTtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStDacACgkQN1Ujt2V2gBwBygCgooIfC+BvepitTVVv5vf11G5l
0BwAniOsK/0Pt3/MnR4N3VtLGZxPRpeF
=n8iz
-----END PGP SIGNATURE-----

--vk/v8fjDPiDepTtA--
