Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tnstj-0007mn-QM
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 16:27:59 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so3472791eaa.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sJ51HT7TIhAsOBb180wHo+TdYX7zUVmzhAz3Cd7M3m0=;
	b=Cmer459wstBS1odbHWSQN2HInvG9LX2HcVKlFZvB/hkVoJwY7o2NtmVnQdzAhdP2di
	deV9CWgmUtgig//00uZqupLztmf/01IJYGnKpSpCGyl0/7OFbiPH3oRVndr4Yzkm2D7P
	9l0us3rzqffnmZfA8osYwgaj6R3U27NsZbNTKepzAzSIZFqtcC7mVzMVDO8DLTv/5a76
	WKrbJ4EZ3cLS1LkZmDh+dTOQR1zmF6oYHyPaZ47fLuo3eiXlMLAVhxqGNa0W5w4DBm4M
	qwmU0esZqrWKWhCffuOSxNrw3HhgXEDxymQAHBICFkws0/I5EC048OiA1JxJsInStBt9
	pS3A==
X-Received: by 10.14.0.133 with SMTP id 5mr69839811eeb.29.1356534787017;
	Wed, 26 Dec 2012 07:13:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm53783670eep.9.2012.12.26.07.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 07:13:06 -0800 (PST)
Date: Wed, 26 Dec 2012 16:13:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121226151310.GC8988@jama.palm1.palmone.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
	<20121226130115.GB8988@jama.palm1.palmone.com>
	<CALbNGRTvGC6_g9nRWjCuB8t-sLA35PWuPJKb8gT=NC_y2D5kOw@mail.gmail.com>
	<CALbNGRQwGorTBo7OOAABQVd_0Jmv7sS3W+NcDy2bocnw3eoKHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQwGorTBo7OOAABQVd_0Jmv7sS3W+NcDy2bocnw3eoKHg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xfce/meta-gnome 00/12] meta-xfce updates
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
X-List-Received-Date: Wed, 26 Dec 2012 15:27:59 -0000
X-Groupsio-MsgNum: 42419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a9msq94+WlNd0NRk"
Content-Disposition: inline

--a9msq94+WlNd0NRk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 26, 2012 at 03:59:33PM +0100, Andreas M=FCller wrote:
> On Wed, Dec 26, 2012 at 2:29 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Wed, Dec 26, 2012 at 2:01 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Sun, Dec 23, 2012 at 02:02:29PM +0100, Andreas M=FCller wrote:
> >>> The following changes since commit a623fd942f6561a425278cf9f114d212d0=
6e5982:
> >>>
> >>>   samba: disable avahi and build without acl (2012-12-21 16:45:28 +01=
00)
> >>
> >> No new issues in world build with this patchset applied.
> >>
> > I know - these patches just add some functionality for xfce. I check
> > for the gnome/libnotify problem next days. My assumption is that
> > host-headers are dragged in somewhere but I need to check that.
> >
> > 'Unfortunately' I got a raspberry-pi for Christmas so I need to take
> > care first :-)
> >
> I just checked: the gvfs patch dos not apply any more since the latest
> update. I'll rebase the git repo.

I already did (and said that in previous reply), see contrib/jansa/pull.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a9msq94+WlNd0NRk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDbFAYACgkQN1Ujt2V2gBydbQCeJsjgN65eOoDXpdgB7W/IMtwl
L00AoJMi0z3D6miYYVUS1hA06bauY6Ni
=8aVF
-----END PGP SIGNATURE-----

--a9msq94+WlNd0NRk--
