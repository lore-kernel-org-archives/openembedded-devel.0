Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 156806BD6A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 10:53:44 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so817363eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 03:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r1Q1/hF1Irh640/GpMREmO/21/Z0+TXd3z5t8Tt2TLY=;
	b=GB6NSoaYXLHgdAhj0p3IXAtg+3xBNisB3s0EvcUPbemIbEwmsHtcFMVJFNxrLefS81
	iD7cowCYEjdCFMaLF0Q7k3nUvaGjmmezyCUpbgQxpa7PdiNNC9aMgkmZG66bwxyV+TPF
	aQ/DUKhW2qWmKOn+AiloXAiJYqzy+PacvXaXDSNiI4uj7xYXpeRRrl9yAcX06BCO2mdQ
	eZX3NCN0s2BJ0mBUo3X6Gjb4mGGQuKkHDs5OT8nSDlPoV85+ZuYuw6UiMEO4OT2LhOLl
	O7jKnU9erWXNLxH3JZou9fSvdp2tBwa1xKonABscloaPXrokASPSKF/dDGI2Ah6r0wlG
	B1cQ==
X-Received: by 10.15.48.67 with SMTP id g43mr11852976eew.17.1377860025363;
	Fri, 30 Aug 2013 03:53:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm53677948eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 03:53:44 -0700 (PDT)
Date: Fri, 30 Aug 2013 12:54:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130830105458.GV3544@jama>
References: <1377824151-7538-1-git-send-email-net147@gmail.com>
	<20130830090146.GS3544@jama> <522075F2.7070804@gmail.com>
MIME-Version: 1.0
In-Reply-To: <522075F2.7070804@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] qt-creator: update to 2.8.1
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
X-List-Received-Date: Fri, 30 Aug 2013 10:53:45 -0000
X-Groupsio-MsgNum: 45995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xoUDadTz98C4LPSf"
Content-Disposition: inline

--xoUDadTz98C4LPSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 08:37:38PM +1000, Jonathan Liu wrote:
> On 30/08/2013 7:01 PM, Martin Jansa wrote:
> > On Fri, Aug 30, 2013 at 10:55:51AM +1000, Jonathan Liu wrote:
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >>   .../qt-creator/{qt-creator_2.8.0.bb =3D> qt-creator_2.8.1.bb}       =
    | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>   rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb =3D> qt-cr=
eator_2.8.1.bb} (87%)
> >>
> >> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-=
oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> >> similarity index 87%
> >> rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> >> rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> >> index a95ad5a..21d5264 100644
> >> --- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> >> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> >> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LGPL_EXCEPTION.TXT;md5=3D=
eb6c371255e1262c55ae9b652a90b5
> >>   SECTION =3D "qt/app"
> >>  =20
> >>   SRC_URI =3D "http://download.qt-project.org/official_releases/qtcrea=
tor/2.8/${PV}/${BP}-src.tar.gz"
> >> -SRC_URI[md5sum] =3D "5aacdad4491b7dda9758a81384d8da79"
> >> -SRC_URI[sha256sum] =3D "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1=
df924d6e895e99f45d2"
> >> +SRC_URI[md5sum] =3D "79ef6c6ece0c00035ef744c9d6e3bd3b"
> >> +SRC_URI[sha256sum] =3D "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a=
6cfb9cb297f50c364b9"
> > Hi, does it fix build on arm?
> I tested for x86 target. I haven't tested on ARM.=20
> https://codereview.qt-project.org/#change,61264 hasn't been merged yet=20
> and I don't see any ARM build fixes in the logs between v2.8.0 and=20
> v2.8.1 so I am guessing compiling for ARM isn't fixed yet.
> >
> > One issue was missing cpuid.h
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-August/=
091952.html
> >
> > and then there were some warning causing build failure with -Werror.
> Is -Werror standard or added through a conf option?

I haven't spent much time on this one so I don't know from where -Werror
was passed, but you can see the error in
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30829_131018.log/min_failed/qt-creator

|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr=
/include/qt4/QtCore/qsharedpointer_impl.h:336:11:
error: 'product' may be used uninitialized in this function
[-Werror=3Dmaybe-uninitialized]


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xoUDadTz98C4LPSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIgegIACgkQN1Ujt2V2gBz1fwCgrxSOyVkH22nUI+9ktR0MO8dC
nRgAn10uD4Vg0SPzq8Gz1G7BrpCXeZY+
=jTiP
-----END PGP SIGNATURE-----

--xoUDadTz98C4LPSf--
