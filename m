Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0VDs-00007M-26
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 09:39:52 +0100
Received: by bwz10 with SMTP id 10so2967129bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MACKJ4y5BeKJaOY/E0vrzJXAV1tdphVv04SknNkC9BI=;
	b=WGgc5n/WAvI3zQB6Jl4EALcVi4Tsw7Ak1JQh4HpVKEh9TKCzTUaA3nhrzkcayY5/mM
	DqMqmJxMflRKC+O5YZVP4GBnm8bQoZQsOnmO9o8kgU42+lgFjGARhsI1np4/DN23TNH7
	0jPUR/HCvcymOYrKFMqn4eUv4kbXdftVKq91Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jXaHwHUw/HOmHh73L6XSXHaIpORKP69YXKmdSEL1ohYTqWyasNtxYvz/3dkPIWKTO0
	kaRR6L0Jf71Rn1fJO82z+8fJRqyhDbf7ZqaE41+PS7vJeCCLpLuo36Od7LQVH7F/gmk6
	IfcX2tKVYgHbY2QHrtGD5lU9MW8bO43FeB3k4=
Received: by 10.204.152.137 with SMTP id g9mr700353bkw.3.1300437485945;
	Fri, 18 Mar 2011 01:38:05 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm1948007bkx.19.2011.03.18.01.38.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 01:38:04 -0700 (PDT)
Date: Fri, 18 Mar 2011 09:38:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110318083802.GA17785@jama.jama.net>
References: <1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
	<4D8061DE.6030106@gmail.com>
	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
	<20110316080500.GA3414@jama.jama.net>
	<989A078976CDAD4CB2DC976EEF70E2A505479928@eu2-mail.mgc.mentorg.com>
	<989A078976CDAD4CB2DC976EEF70E2A505479ABD@eu2-mail.mgc.mentorg.com>
	<989A078976CDAD4CB2DC976EEF70E2A505479B8C@eu2-mail.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A505479B8C@eu2-mail.mgc.mentorg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Fri, 18 Mar 2011 08:39:52 -0000
X-Groupsio-MsgNum: 30382
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2011 at 08:41:40AM +0100, Ahsan, Noor wrote:
> Hello Martin/Frans and Khem,
> Any recommendation after following analysis that how should I proceed.
> Should I send the patches to community?

Maybe koen will reply with more info about xml2po issue he found, imho
it wasn't in xml2po build but while using xml2to to generate docs in some
other recipe.
=20
IIRC I had similar issue in some other recipe, but unfortunatelly don't=20
remember which one.

Regards,

>=20
> Regards,
> Noor
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Ahsan, Noor
> Sent: Thursday, March 17, 2011 3:41 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Python-native dependency in libxml2
>=20
> Hello,
>=20
> Today I got the fresh stuff and tried to build gnome-doc-utils-native
> (to build xml2po package). I am building on Ubuntu host 9.10. First it
> gave me an error that it could not find intltoolize command. You can see
> the attached build log "build_intltool_error,log". So I added intltool
> package in gnome-doc-utils-native DEPENDS so it built successfully. You
> can see the build log "build_intltool_fix.log". Then I removed all the
> build stuff from build DIR and commented DEPENDS_virtclass-native =3D
> "python-native" and XPY_virtclass-native =3D "
> --with-python=3D${PYTHON_DIR}" in libxml2.inc file. Rebuild
> gnome-doc-utils-native. It built successfully again. The build log is
> also attached "build_no_python.log". I think there is no need of python
> dependency in libxml2 package. Kindly correct me if I am doing anything
> wrong.
>=20
> We need to fix gnome-doc-utils-native recipe, so that it does not show
> intltoolize error.
>=20
> Regards,
> Noor
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Ahsan, Noor
> Sent: Wednesday, March 16, 2011 1:39 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Python-native dependency in libxml2
>=20
> Hello,
>=20
> I made 2 changes, first one was to remove python-native from DEPENDS and
> second was commented out XPY_virtclass-native =3D "
> --with-python=3D${PYTHON_DIR}". Moreover I removed all the stuff from
> build dir, so there were not python-native for me. After kicking this
> build libxml2-native build fine.
>=20
> I was looking for xml2po recipe, I couldn't find it. Can you tell me how
> to build xml2po package so that I can reproduce the problem.
>=20
> Regards,
> Noor
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, March 16, 2011 1:05 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Python-native dependency in libxml2
>=20
> On Wed, Mar 16, 2011 at 08:28:39AM +0100, Frans Meulenbroeks wrote:
> > 2011/3/16 Khem Raj <raj.khem@gmail.com>:
> > > On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
> > >>
> > >> Hello,
> > >>
> > >> I was looking at the libxml2 package. While going through the
> recipes I
> > >> came to know that its native package depends on python-native
> package as
> > >> well. This dependency is defined in libxml2.inc file.
> > >>
> > >> DEPENDS_virtclass-native =3D "python-native"
> > >>
> > >> This package build fine after removing this dependency. I am not
> clear
> > >> why this dependency is being added in libxml2 package. Can somebody
> > >> clear that to me. While looking at the git log I came to know that
> this
> > >> change is coming from libxml2-native.inc file. But I am not clear
> why
> > >> this dependency was added as this package build fine without it.
> > >>
> > >> Please help me in understanding this dependency. Thanks.
> > >
> > > Try to build this recipe from scratch and see if it still works then
> we can
> > > remove the dep
>=20
> That's not enough, libxml2-native builds fine.. but then xml2po
> will fail if there isn't libxml2-native built with python support.
>=20
> see a25f07ca6159e1cd5b8a215ca5da8405fb1b9053
>=20
> So yes.. for such tests you should build recipe from scratch _and_ check
> if resulting package/sysroot is still the same.
>=20
> Regards,
>=20
> > I'm not sure if that is the right way.
> > It might well be that typically python-native is already there in a
> > scratch build because some earlier package needed it (or even because
> > of the scheduling of build steps.
> >=20
> > Probably a better way is to build with packaged staging (with staging
> > dir outside TMPDIR) then rm TMPDIR and bake the package.
> > Alternately peek into the package to see if it needs python. If it is
> > needed then the DEPENDS should stay.
> >=20
> > Looking at the issue at hand maybe the best person to ask is Martin
> > Jansa as he last touched that line according to git blame:
> > 3cd9ddbf recipes/libxml/libxml2.inc  (Martin Jansa
> > 2010-02-26 12:32:53 +0100  5) DEPENDS_virtclass-native =3D
> > "python-native"
> >=20
> > The other thing is that further on in the .inc file I see:
> > XPY_virtclass-native =3D " --with-python=3D${PYTHON_DIR}"
> >=20
> > This strongly suggests a hard dependency on python, so removing the
> > DEPENDS "because it builds without it" does not seem to be a good plan
> > to me.
> >=20
> > My strong feeling is that recipes should be self-contained (so should
> > list all packages they need to build, minus the ones that are
> > inherited from classes (and maybe a few implicit ones like maybe make)
> >=20
> > Frans
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2DGeoACgkQN1Ujt2V2gBx9KACgqECQJnRY5yvwgzcquvB4aIGW
ufYAn3soISnk8Ov9PMJ3iCBVESeOqTkl
=zmQ9
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
