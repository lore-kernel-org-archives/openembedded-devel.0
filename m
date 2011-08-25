Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwUip-0007Vk-EU
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2011 09:51:31 +0200
Received: by fxg11 with SMTP id 11so1654051fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2011 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4k+tJBv1YjFgGtwxxH5r1IR1Xlm+2lcwRLG95K01bXM=;
	b=gLv2YxJ+9jIJTtf/x+sc5jxTx8QvuHFW0lph218eCfoZhmQjrkanuedy98WajqpYrJ
	Qt/YSx/BQjAJisvmWrL0ZLZskjUAhqjPqfVSoLasHDLxZg//SuMEmSpmY2KyZY0gb46y
	Sw0kXKdxhMOflLA9gxrNApJzHABEhutMrRaGk=
Received: by 10.223.1.14 with SMTP id 14mr3138797fad.47.1314258404098;
	Thu, 25 Aug 2011 00:46:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm259795faf.32.2011.08.25.00.46.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Aug 2011 00:46:42 -0700 (PDT)
Date: Thu, 25 Aug 2011 09:46:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110825074635.GB5081@jama.jama.net>
References: <1314173035-11491-1-git-send-email-noor_ahsan@mentor.com>
	<CA+M6bXmh3xAkAVYjDvpkaTe_pXyAZQpEgnpx0tX5_pbtLaf9Yg@mail.gmail.com>
	<j33flt$b50$1@dough.gmane.org>
	<989A078976CDAD4CB2DC976EEF70E2A5068A56C8@eu2-mail.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5068A56C8@eu2-mail.mgc.mentorg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v3] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Thu, 25 Aug 2011 07:51:31 -0000
X-Groupsio-MsgNum: 33828
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2011 at 09:40:22AM +0200, Ahsan, Noor wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of
> > Koen Kooi
> > Sent: Wednesday, August 24, 2011 11:25 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v3] lmbench: Add version 3.0-a9
> > (initial recipe)
> >=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Op 24-08-11 19:35, Tom Rini schreef:
> > > On Wed, Aug 24, 2011 at 1:03 AM, Noor, Ahsan <noor_ahsan@mentor.com>
> > wrote:
> > >> From: Noor Ahsan <noor_ahsan@mentor.com>
> > >>
> > >> * Imported from OE commit id
> > bac6441118e0b78d55c98afdc108f03b6c655909
> > >>
> > >> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> > >
> > > NAK, All of the patches are missing the patch header described in
> > http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
> > and I gave you some of the infos you need for the patches before :)
> >=20
> > And after fixing the patch headers, could you please combine the
> > patches into a single pull request?
>=20
> You mean to say I should send lmbench, iperf and dbench patch in single
> patch?

pull request !=3D patch

You just push all needed patches to some repository ie
meta-openembedded-contrib branch noor-benchmarks and generate pull
request with openembedded-core/scripts/create-pull-request

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5V/dsACgkQN1Ujt2V2gByDawCfWK3D6EsNy4mpXHOYVm985ez6
qAsAn3owxK0o+CBeKIBwJi4cU/KH/sF3
=jtS8
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
