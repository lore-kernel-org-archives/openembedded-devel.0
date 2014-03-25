Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA556F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 07:54:50 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so95717eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4AFmHKikLvTS31ObOWxmpMWsdX05MJiC1JUqhdr5tc8=;
	b=vUWaN8aX5f3g0bak2/UyzFwv7tPyn0YgKbBBuj7EpT+gzEVRhKXmV/QiE9r1K+2nYV
	nN/0ltXlIa7O+/SdJY+9Q6D4wzTnpc5A1GNY29r3zEArH0ToBgwX7fd3IRAxMro2FsAC
	w2Nkzp32z+KBjsk9ElZadNZ7UNXj7W5RyksFKajlBA299Bdm1PznOFGQqJrmDIqGXESP
	nxrQ08/bxLyLaBVMdLCoY1bZHb/fQeF94bsaOgusnJIMCbObrLOG7hL8daqeUakNplTA
	7Pw3VivlLm+20YnE2FhY+EuQy6fYtg+J4kPdzdI/+kdyXis3f+8lh75paW1yfr8JEFL7
	Ac2Q==
X-Received: by 10.15.73.134 with SMTP id h6mr49886488eey.3.1395734090879;
	Tue, 25 Mar 2014 00:54:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm38574436eew.19.2014.03.25.00.54.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 00:54:49 -0700 (PDT)
Date: Tue, 25 Mar 2014 08:54:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140325075448.GB3710@jama>
References: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B5754DF69@COSNADEXC13.usr.ingenico.loc>
	<CAMKF1so5GBMH7JehZ1wRt7A+x12_zr7yDEsUS_uPngn7JnfipQ@mail.gmail.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B5754E493@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B5754E493@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] terminus-font: add new recipe for version 4.38
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
X-List-Received-Date: Tue, 25 Mar 2014 07:54:54 -0000
X-Groupsio-MsgNum: 48815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2014 at 07:36:05AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> > ?=3D is better fit here.
> It's because there is only one option ?
>=20
> Do you want me to repost patch?
> The problem is that it is already on meta-openembedded git master-next br=
anch.

I'll amend it there (it's faster for me than replacing it with v2 from
patchwork).

So you don't need to repost it.

Thanks.

>=20
> Matthieu
>=20
>=20
> -----Message d'origine-----
> De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembe=
dded-devel-bounces@lists.openembedded.org] De la part de Khem Raj
> Envoy=E9=A0: lundi 24 mars 2014 18:16
> =C0=A0: openembeded-devel
> Objet=A0: Re: [oe] [meta-oe][PATCH] terminus-font: add new recipe for ver=
sion 4.38
>=20
> On Mon, Mar 24, 2014 at 12:38 AM, Matthieu CRAPET <Matthieu.CRAPET@ingeni=
co.com> wrote:
> > Most recipes are using ??=3D and not ?=3D
> > What is a best way?
>=20
> ?=3D is better fit here.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMxNkgACgkQN1Ujt2V2gBxuGwCfSokmMxFEYiTARVzNJjkuc+Fz
tkwAn2cpIUbcRNl4U1IYXyEj16HxVWen
=gAOs
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
