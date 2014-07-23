Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0366AC9D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:33:37 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so1280958wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Czpp9FeTs5II4lWWWVq2sawiUfNOajs6eFBFfqX4fLg=;
	b=OI+wYBqmXkjDlZcxPIHHSLS1QoiNa+BvHt7GPoIEac9y225WYhEnHNAGEUgSRyKmfH
	4yBA+tJegWFChZT4J/NShMrGrNv85YnYBSeZ+wrvRFUHtyXdkmtnHMIPsVjjpMOf1FVg
	QgIDDNsHIrs3WcJYcxd0aazFOT+bdXXE79N53JD9AwRZK2nMHbrRjX2JJ5sSgkSOrXTJ
	MiqGqI8hiAJ3RCK5bJE6La0VV1yVaqxtIXNDECq43oPt1TnyoCA13+o7tud4hc7xiEYS
	JbVkMafB5xp3SddhTg5EbK3lZfpG+zJtB/t9Y7q/RXvjnKACstDioGC8KiMOnwPveTA7
	l8Lw==
X-Received: by 10.194.5.103 with SMTP id r7mr2396531wjr.41.1406126018242;
	Wed, 23 Jul 2014 07:33:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id m3sm9891313wik.7.2014.07.23.07.33.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 07:33:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 16:33:54 +0200
To: Nilesh Kokane <nilesh.kokane@mindastoneridge.com>
Message-ID: <20140723143354.GE22875@jama>
References: <CAHURY+0mB2G3oGHNSBGAn+_jZ78uB4VLBS=817gdhL-WBjOMuw@mail.gmail.com>
	<20140723120746.GC22875@jama>
	<CAHURY+2vH57ZNh8RJxjw2=yt3kANmVuyLC8zOMQsPqSRR=MVaQ@mail.gmail.com>
	<CAHURY+0dvjJsXCh30Oq4Zx+Vs0_Jrn-eX5XH3RaDEVAOVaRDoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHURY+0dvjJsXCh30Oq4Zx+Vs0_Jrn-eX5XH3RaDEVAOVaRDoQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Qt5 using yocto on Wandboard-Error
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
X-List-Received-Date: Wed, 23 Jul 2014 14:33:41 -0000
X-Groupsio-MsgNum: 51211
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0k7NRaGPjSSxFfo/"
Content-Disposition: inline

--0k7NRaGPjSSxFfo/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 05:47:56PM +0530, Nilesh Kokane wrote:
> Hello,
>=20
>=20
> Thanks for your valuable reply
>=20
> I've  downloaded manually and placed it in the downloads folder as follows
>=20
> - cd /home/minda/bin/fsl-community-
> bsp/downloads
>  - wget manually(successfully)
> - touch qtbase-opensource-src-5.1.1.tar.xz.done
>=20
> Then I gave a bitbake following which i got the errors as shown in the
> previous mail.
>=20
>=20
>=20
> Please can u suggest.

Download the right packages qtdeclarative and qtgraphicaleffects not
qtbase.

>=20
>=20
> Thanks
> Nilesh Kokane
>=20
>=20
>=20
> On Wed, Jul 23, 2014 at 5:43 PM, Nilesh Kokane <
> nilesh.kokane@mindastoneridge.com> wrote:
>=20
> > Hello,
> >
> >
> > Thanks for your valuable reply
> >
> > I've  downloaded manually and placed it in the downloads folder as foll=
ows
> >
> > - cd /home/minda/bin/fsl-community-bsp/downloads
> >  - wget manually(successfully)
> > - touch qtbase-opensource-src-5.1.1.tar.xz.done
> >
> > Then I gave a bitbake following which i got the errors as shown in the
> > previous mail.
> >
> >
> >
> > Please can u suggest.
> >
> >
> >
> >
> >
> >
> > On Wed, Jul 23, 2014 at 5:37 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> On Wed, Jul 23, 2014 at 05:07:03PM +0530, Nilesh Kokane wrote:
> >> > Hello ,
> >> >
> >> >
> >> >
> >> > I've created a yocto image using the following URL
> >> >
> >> >
> >> http://wiki.wandboard.org/index.php/Getting_started_with_Yocto_on_Wand=
board
> >> >
> >> >
> >> > And  trying to bring in Qt on wandboard using the following link
> >> >
> >> >
> >> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandbo=
ard
> >> >
> >> >
> >> > Every thing goes fine until i give the following command
> >> >
> >> >  bitbake core-image-minimal
> >> >
> >> > It pops out with following errors.
> >> >
> >> >
> >> > WARNING: Failed to fetch URL
> >> >
> >> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodul=
es/qtgraphicaleffects-opensource-src-5.1.1.tar.xz
> >> ,
> >> > attempting MIRRORS if available
> >> >
> >> > ERROR: Fetcher failure: Fetch command failed with exit code 4, no ou=
tput
> >> > ERROR: Function failed: Fetcher failure for URL: '
> >> >
> >> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodul=
es/qtgraphicaleffects-opensource-src-5.1.1.tar.xz
> >> '.
> >> > Unable to fetch URL from any source.
> >> > ERROR: Logfile of failure stored in:
> >> >
> >> /home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-p=
oky-linux-gnueabi/qtgraphicaleffects/5.1.1-r0/temp/log.do_fetch.29384
> >> > ERROR: Task 1283
> >> > (/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> >> > qtgraphicaleffects_5.1.1.bb, do_fetch) failed with exit code '1'
> >> > WARNING: Failed to fetch URL
> >> >
> >> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodul=
es/qtdeclarative-opensource-src-5.1.1.tar.xz
> >> ,
> >> > attempting MIRRORS if available
> >> >
> >> > ERROR: Fetcher failure: Fetch command failed with exit code 4, no ou=
tput
> >> > ERROR: Function failed: Fetcher failure for URL: '
> >> >
> >> http://download.qt-project.org/official_releases/qt/5.1/5.1.1/submodul=
es/qtdeclarative-opensource-src-5.1.1.tar.xz
> >> '.
> >> > Unable to fetch URL from any source.
> >> > ERROR: Logfile of failure stored in:
> >> >
> >> /home/minda/bin/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-p=
oky-linux-gnueabi/qtdeclarative/5.1.1-r0/temp/log.do_fetch.29383
> >> > ERROR: Task 1270
> >> > (/home/minda/bin/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> >> > qtdeclarative_5.1.1.bb, do_fetch) failed with exit code '1'
> >> >
> >> >
> >> > Please can anybody suggest.
> >>
> >> Can you download it manually?
> >>
> >> The URL seems correct, so maybe something wrong with your network setu=
p.
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >
> >
> > --
> > Thanks
> >
> >
>=20
>=20
> --=20
> Thanks
>=20
> --=20
> =E2=80=9CThe contents of this e-mail message and any attachments are conf=
idential=20
> and are intended solely for addressee. The information may also be legall=
y=20
> privileged. This transmission is sent in trust, for the sole purpose of=
=20
> delivery to the intended recipient. If you have received this transmissio=
n=20
> in error, any use, reproduction or dissemination of this transmission is=
=20
> strictly prohibited. If you are not the intended recipient, please=20
> immediately notify the sender by reply e-mail or phone and delete this=20
> message and its attachments, if any.=E2=80=9D



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0k7NRaGPjSSxFfo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPx9IACgkQN1Ujt2V2gByVZwCfUV94gVpc+B5QzJCX/rRKnGnk
q7YAn3DGUg7KTwDBQJIGuFcy0/K6u30w
=5sK3
-----END PGP SIGNATURE-----

--0k7NRaGPjSSxFfo/--
