Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RG8kZ-00024d-Ur
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 14:26:32 +0200
Received: by bkat8 with SMTP id t8so785786bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/6piuDup65bgyWvdlBKSekwmjcUWZZaiZfv6OlXUXuE=;
	b=upI3KzQMbO0c31uISCDZ/d/3Wxusz3tTOTCGQgH+tikvv/Pny9z/kWDCmdKH91eb7K
	jrhcOb/gTuj+oAVHWVgL8Pb2tOYwRo4yobGCvMV55RLk84rMiplcoHcMYW0YeiA5Zj79
	QYXBTeniTYofBIXUpmnj9izYrXtBeijcM2JGc=
Received: by 10.204.136.131 with SMTP id r3mr1623239bkt.60.1318940442393;
	Tue, 18 Oct 2011 05:20:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm1919071bkv.8.2011.10.18.05.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 05:20:41 -0700 (PDT)
Date: Tue, 18 Oct 2011 14:20:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018122034.GF20678@jama.jama.net>
References: <1318852253-4171-1-git-send-email-schnitzeltony@gmx.de>
	<j7jma5$kg2$1@dough.gmane.org>
	<20111018114340.GC20678@jama.jama.net>
	<j7jpfj$c64$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7jpfj$c64$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: All patches in patchwork archived? Was: [meta-efl][V3] epdfview: add initial recipe with version 0.1.8
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
X-List-Received-Date: Tue, 18 Oct 2011 12:26:32 -0000
X-Groupsio-MsgNum: 34856
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Content-Disposition: inline

--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 01:55:31PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 18-10-11 13:43, Martin Jansa schreef:
> > On Tue, Oct 18, 2011 at 01:01:25PM +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >>=20
> >> Op 17-10-11 13:50, Andreas M=FCller schreef:
> >>> initial source taken from oe-classic epdfview_0.1.7.bb commit=20
> >>> 44985d56bc556786812a0a02d6219afd31a7381d
> >>>=20
> >>> run tested on overo
> >>>=20
> >>> Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de>
> >>=20
> >> Martin, do you want to put this in your next pull request or do you
> >> want me to takes this directly?
> >=20
> > I have only webkit-efl and eve changes in my queue and I would like to=
=20
> > get them applied upstream first. So please take this directly, I've=20
> > tested it here too and it looks fine.
>=20
> Done. And patchwork updated itself! THIS IS THE FUTURE!!!!one!!!

Nice, but did it accidentally mark all oe-core patches in=20
http://patchwork.openembedded.org/project/oe-core/list/
as Archived?

Because such patches are not shown by default even when they are in
state New.

If it's only because of pw upgrade and won't mark them archived after
every push then fine :).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dbxIACgkQN1Ujt2V2gBx0HACggZBeJnn/yKWXAITaksH5tCQp
l2YAmgPRS2qcbTd8kXuJn/17l2fYeo7w
=z6ly
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
