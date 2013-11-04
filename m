Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9F26CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 21:46:27 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id d49so1395694eek.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2013 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vfSA6wSWNNUj/vRePDVQNtCaqZb4PTaY486HGm2GEwc=;
	b=nzI2auR5ahH7eFltbfOSg7h2v6XkR7KMP2NjlCzobI6XOnvLskR8PO+j6kookXZie/
	vL3UtW5bfMa/1G3aRxw7x3IfEZ9k7DmF5m2hfoZwvSeD4LbxR8fUX1dk/4Ep2XD3Xbut
	n6id2WeLy2aHhULcOlqy6CikYm2+mndL8qwd93MjJK9qqZ8JAjO0nrvnzVqnmkE/RnTE
	yDK1CFLWftkLmCPcvuRPgX0YpxwhcpzcuXs19ORyqncQlvbl41S5R4wzPlpxCYZLMa8+
	wklEBmboT5sTWyWHU2D+B5TijQqLxLwC12jVVeJ1xDmqUA+pZAH9msSXtuDVA8WQqVEs
	Hc1w==
X-Received: by 10.15.73.130 with SMTP id h2mr7022726eey.56.1383601589103;
	Mon, 04 Nov 2013 13:46:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e13sm51707318eeu.4.2013.11.04.13.46.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Nov 2013 13:46:28 -0800 (PST)
Date: Mon, 4 Nov 2013 22:46:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131104214636.GF3684@jama>
References: <CAFZh4h9pmB59YS7wRKD1ubui2_yf1Hjg5NgtW-nDr9eC8im1dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h9pmB59YS7wRKD1ubui2_yf1Hjg5NgtW-nDr9eC8im1dA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: Still getting gd-2.0.36RC1.tar.gz errors in meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
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
X-List-Received-Date: Mon, 04 Nov 2013 21:46:28 -0000
X-Groupsio-MsgNum: 47009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline

--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 04:09:22PM -0500, Brian Hutchinson wrote:
> Hi,
>=20
> This has been going on for the last month or two.  Apparently this upstre=
am
> project name changed and it no longer available at the URL.  I looked into
> it several weeks ago but it didn't look like a simple URL path fix as it
> looked like other stuff depends on it.  I've been coping the file from an
> earlier build to my downloads directory to get my builds to complete.

grab copy from
http://ring.u-toyama.ac.jp/archives/graphics/gd/
and put it on your PREMIRROR.

>=20
> Regards,
>=20
> Brian
>=20
> Loading cache: 100%
> |########################################################################=
###########################################################################=
#|
> ETA:  00:00:00
> Loaded 1877 entries from dependency cache.
> Parsing recipes: 100%
> |########################################################################=
##########################################################################|
> Time: 00:00:00
> Parsing of 1471 .bb files complete (1470 cached, 1 parsed). 1876 targets,
> 96 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
>=20
> Build Configuration:
> BB_VERSION        =3D "1.21.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Debian-7.1"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "am180x-evm"
> DISTRO_VERSION    =3D "oe-core.0"
> TUNE_FEATURES     =3D "armv5 thumb dsp"
> TARGET_FPU        =3D "soft"
> toolchain-layer
> meta-oe
> meta-multimedia
> meta-networking
> meta-webserver    =3D "master:4d62e7f575e2a87197c74ab4639561b45eec0e60"
> meta-ti           =3D "master:15243e8ec3ce0652f7ddb7542df022306f40d888"
> meta              =3D "master:0636093711547957a8f5b25322bd3e0da367cfc4"
>=20
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL
> http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz, attempting MIRRORS if
> available
> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://libgd.bitbucket.org/releases/gd-2.0.36RC1.tar.gz:
> 2013-11-04 15:43:25 ERROR 404: NOT FOUND.
>=20
> ERROR: Function failed: Fetcher failure for URL: '
> http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz'. Unable to fetch URL
> from any source.
> ERROR: Logfile of failure stored in:
> /home/hutch/arago_11_1_2013/tisdk/build/arago-tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/gd/2.0.35+2.0.36rc1-r5/temp/log.do_fetch.32535
> ERROR: Task 1136
> (/home/hutch/arago_11_1_2013/tisdk/sources/meta-openembedded/meta-oe/reci=
pes-support/gd/gd_2.0.35+
> 2.0.36rc1.bb, do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1581 tasks of which 1119 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 1 task failed:
>=20
> /home/hutch/arago_11_1_2013/tisdk/sources/meta-openembedded/meta-oe/recip=
es-support/gd/gd_2.0.35+
> 2.0.36rc1.bb, do_fetch
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ4FbwACgkQN1Ujt2V2gBzNoQCfZCZ8EuT7/kQr24m2jUGElvl3
xZMAnA/g3u44fHwiVAJ63nMoj7PPOdR5
=s2oC
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--
