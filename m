Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B27B76D5A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 21:49:43 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id l10so1313875eei.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xaXmtzAbOUM5drc/Bhcp2A7ez4EQyuG/i5r66STlMJ0=;
	b=sdI3cFCfhlm+g5pYmTqyD8svsZN6t3R2r5lYHvnLA5HoSbk/Pk+c1WJlCh9KofkFzk
	pYXtS3nMttzUDO+hI8zaEXVCp4ynLwlQswApwJ9iozK1zXMWo3MCDBDWqsi/sh1RnN9m
	IpHjegeNsn3yIfZiKOyQ3ZlErPijaMMhbGE+v9sA2FILRYGq8WzKX7MEZ5tLUPSDXmFh
	c36JR15aeGLHgPS3YxsixjFqDvKWLl0MF8keFEcVYoQvlbLY+9gMzz6TkYiEJxax4mAu
	R42iGju5fCM8Vdz/CtcX15fF+S48ISfwnjsUZkyr5pug8UqyasgtNbQ0OGv+0WmVxC5c
	7tRA==
X-Received: by 10.14.220.70 with SMTP id n46mr1679577eep.126.1384552185118;
	Fri, 15 Nov 2013 13:49:45 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	u46sm10163939eep.17.2013.11.15.13.49.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 13:49:44 -0800 (PST)
Date: Fri, 15 Nov 2013 22:50:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131115215010.GF31430@jama>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
	<CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
	<CAFeBWL7fDEJtkHosrJJUx76ssMiau+bb3EtATWoybNWyb=1FGA@mail.gmail.com>
	<CALbNGRQcVwRpqKvWpgnNBpN-4bn+kJSj6m8j=eV0zme0md8j9w@mail.gmail.com>
	<CAFeBWL5uKWtT2QBdqXucnG2Wpj+ye72xStus396_Q8Swp1_sAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL5uKWtT2QBdqXucnG2Wpj+ye72xStus396_Q8Swp1_sAQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Fri, 15 Nov 2013 21:49:44 -0000
X-Groupsio-MsgNum: 47155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline

--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:28:04PM -0800, Adam Lee wrote:
> There is a pull request on this -
> https://github.com/openembedded/meta-oe/pull/15

Andreas already sent patches to oe-devel ML (for master where they need
to be applied first and only after that cherry-picked to release
branches).

Please don't use pull requests on github.com (most OE developers don't
watch/review them there).

> On Thu, Nov 14, 2013 at 1:48 PM, Andreas M=FCller <
> schnitzeltony@googlemail.com> wrote:
>=20
> > On Thu, Nov 14, 2013 at 8:41 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > > Thanks Otavio. Quick question - is there a reason not to use the
> > upstream?
> > > - http://www.musicpd.org/download/mpd/stable/
> > >
> > > Thanks,
> > >
> > > Adam
> > >
> > patches welcome - but please check for xfce4-mpc-plugin and xfmpc are
> > still building with mpc.
> >
> > Andreas
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKGlxIACgkQN1Ujt2V2gBxrzQCeMy5YKe2NDHlzjUe3xi7oFPkH
lxsAmwUFcgqxXsNywSj4FN76BJfEanEm
=Wyy1
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--
