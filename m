Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7qb2-0007X9-TU
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 16:54:08 +0200
Received: by fxm19 with SMTP id 19so1980054fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bLUAZ59UYmAEZ2D42TuxG8UZ5/LYBDIe0MQt64Y6jzE=;
	b=LOmeMu45Gj+i9PmNnUqNQzl0HL5dq862cdEmFgmpRsjHq9l8OjpQxXjEjmgBpTlCCP
	xruf49w1Yn5laJ8rkKWklH56a5d+8B4uwUkqqvW1kn+f5VGCYs7/xDe14M1mxS/EzmuP
	4y0PKLaw3LiJS2IDRymYWJjEGI8N2srYBUACU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ELwKMKFlkByEUWvkM6pjkqPJsmkcZO9ZTTH/RvQDVaZ3ksqPOahS85NvZ+EgRkNvZc
	QNN2iU0f7UMNzOqE5tp4HqNg1UCl/lx4fIX99Pop9kG08RxO6Ocv/4nbh0fzMSUa2xwk
	X078y9mLme6IK+AZca6gr8GvP6j1FUSgNrlNc=
Received: by 10.223.15.141 with SMTP id k13mr1016047faa.30.1302187915690;
	Thu, 07 Apr 2011 07:51:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p16sm506551fax.45.2011.04.07.07.51.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 07:51:54 -0700 (PDT)
Date: Thu, 7 Apr 2011 16:51:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110407145147.GK30816@jama.jama.net>
References: <inkeui$jpv$1@dough.gmane.org>
 <inkiks$c0i$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <inkiks$c0i$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance] Pull request #13
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
X-List-Received-Date: Thu, 07 Apr 2011 14:54:09 -0000
X-Groupsio-MsgNum: 31021
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjSGHOmKKB2VUiQn"
Content-Disposition: inline

--KjSGHOmKKB2VUiQn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2011 at 04:44:44PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 07-04-11 15:41, Koen Kooi wrote:
> > Tom,
> >=20
> > Please pull the 13 commits from here:
> >=20
> > URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> > Branch: 2011.03-maintenance
> >=20
> >=20
> > Koen Kooi (1):
> >       pixman: add 0.21.6 + fixes
> >=20
> > Michael Jones (1):
> >       base-files: write Angstrom as =C5ngstr=F6m in the issue file.
> >=20
> > Siddharth Heroor (6):
> >       ti-sysbios: Add missing License field.
> >       ti-sysbios: Copy installer unpack to recipe versions.
> >       ti-sysbios: Update Installer unpack commands.
> >       ti-sysbios: Add version 6.31.04.27.
> >       linux-omap3: Add PSP recipe for ti816x devices.
> >       u-boot: Add PSP version for ti816x devices.
> >=20
> > chase maupin (5):
> >       linux-omap4: Add support for am45x-evm machine
> >       u-boot: Add support for am45x-evm machine
> >       sort: Add support for am45x-evm machine type
> >       alsa-state: Add support for am45x-evm machine type
> >       am45x-evm: Add am45x-evm machine configuration
> >=20
> > You can view the branch online at
> > http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3D2011.03=
-maintenance
> >=20
> > These are all cherry-picks[1] from .dev. The AM4x and sysbios stuff was
> > only build tested, no proper hw on my desk yet.
>=20
> The pixman change was runtime tested on beagle and hawk  FWIW

and om-gta02, nokia900 FWIW :)

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNnc3cMkyGM64RGpERAoY9AJ9VYuQelZQ1781aPAtAmiMWtY1oQACdEDLs
> VfiVMIbYAWF37IC4LgWlv4o=3D
> =3DFPuA
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KjSGHOmKKB2VUiQn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2dz4MACgkQN1Ujt2V2gBwbyACgq8mcCIeXwUe5WZY+ls6h/Opf
4FgAoJupCvQLkKCRAWuAT6LqVxvYg/88
=m+29
-----END PGP SIGNATURE-----

--KjSGHOmKKB2VUiQn--
