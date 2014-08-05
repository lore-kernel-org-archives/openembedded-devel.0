Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C4C4E609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 07:49:47 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so559135wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Aug 2014 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZCUat9oGvBFA8zW2+SrABzxgsDJlvK1FxUPOOcbgqgA=;
	b=qDh/1Un6jPrnlxV4LhtuS1efP/kbFuuza5B1iL6vFgyS0Lq73GofqlmULEdx+4e2rR
	jVf6kBh+MidpwkEtSTpmtoNok3BMgKnuT7Bw6GqD/pims94CYGvlffX2HhHmFdbtCIhj
	4iulGtIKqEWsPIKOgT9rQ3FTpwaDmP0dHF2uRdJBLMdRp+oIXS1NCjejIMek578dI+ym
	OrTjPfS+uTW+pT0Q1Pl72PKi5TWM40hD9lpUKKLfq43N89B0gjwxYVokEIEHt7NMceg5
	QIK7mgIUq2nUI6jdSw/qZyDW/nWw+33z1k6K7J48zh5EsbvhVkf9rVoSuMJ9odHb/a1M
	yVsA==
X-Received: by 10.194.123.105 with SMTP id lz9mr3179829wjb.122.1407224988021; 
	Tue, 05 Aug 2014 00:49:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi15sm2336102wjc.20.2014.08.05.00.49.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Aug 2014 00:49:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Aug 2014 09:50:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140805075013.GG2465@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
	<20140720214725.GG22875@jama> <20140725100507.GS2492@jama>
	<CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
	<CAEaCVQhOqybiwMXyAX=jA2B12cvehYUkNsiDGhHMbB_5+ORLww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQhOqybiwMXyAX=jA2B12cvehYUkNsiDGhHMbB_5+ORLww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Tue, 05 Aug 2014 07:49:50 -0000
X-Groupsio-MsgNum: 51422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline

--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2014 at 01:57:21PM -0600, Eduardo Silva wrote:
> Hi Martin,

Hi,

> Is this something OE specific or something in your own environment ?

It's IPK specific, see my last reply in this thread with explanation:
"Directories in CONFFILES Was: [oe] [meta-webserver][PATCHv4] monkey:
new v1.5.1 release."

> best
>=20
>=20
> On Sat, Jul 26, 2014 at 9:03 AM, Eduardo Silva <eduardo@monkey.io> wrote:
>=20
> > hi Martin,
> >
> >
> >> > My builds are using "distroless" setup, if you're using poky then it=
's
> >> > possible that there is still sysvinit added in your DISTRO_FEATURES
> >> > somewhere (check bitbake -e monkay) so the sysv init script isn't
> >> > removed in the end for you.
> >>
> >> I've just noticed that CONFFILES is set to
> >> ${sysconfdir}/monkey/
> >>
> >> so it's not caused by missing init.d script but whole
> >> ${sysconfdir}/monkey/ is empty in PN, can you check what's installed
> >> there in your builds?
> >>
> >> It's either not installed when some dependency is missing or it's
> >> included in different package in my build (knowing which file to look
> >> for would help).
> >>
> >>
> > thanks for tracking this. In my build using Poky i get installed the
> > following files:
> >
> > root@qemux86:~# find /etc/monkey/
> > /etc/monkey/
> > /etc/monkey/sites
> > /etc/monkey/sites/default
> > /etc/monkey/plugins.load
> > /etc/monkey/monkey.conf
> > /etc/monkey/monkey.mime
> > /etc/monkey/plugins
> > /etc/monkey/plugins/fastcgi
> > /etc/monkey/plugins/fastcgi/fastcgi.conf
> > /etc/monkey/plugins/logger
> > /etc/monkey/plugins/logger/logger.conf
> > /etc/monkey/plugins/mandril
> > /etc/monkey/plugins/mandril/mandril.conf
> > /etc/monkey/plugins/dirlisting
> > /etc/monkey/plugins/dirlisting/dirhtml.conf
> > /etc/monkey/plugins/dirlisting/themes
> > /etc/monkey/plugins/dirlisting/themes/guineo
> > /etc/monkey/plugins/dirlisting/themes/guineo/entry.theme
> > /etc/monkey/plugins/dirlisting/themes/guineo/footer.theme
> > /etc/monkey/plugins/dirlisting/themes/guineo/header.theme
> > /etc/monkey/plugins/cgi
> > /etc/monkey/plugins/cgi/cgi.conf
> > /etc/monkey/plugins/auth
> > /etc/monkey/plugins/auth/monkey.users
> > /etc/monkey/plugins/auth/README
> > /etc/monkey/plugins/proxy_reverse
> > /etc/monkey/plugins/proxy_reverse/proxy_reverse.conf
> > /etc/monkey/plugins/cheetah
> > /etc/monkey/plugins/cheetah/cheetah.conf
> >
> > if you need any extra info let me know,
> >
> > best
> >
> >
>=20
>=20
>=20
> --=20
> Eduardo Silva
> Monkey Software
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPgjLUACgkQN1Ujt2V2gBzKswCgkvtg2OUcIvDxj030LPnPTRg3
ETsAoJ+NP4vnD5P/3oNXIT64/HKhyV7B
=Si4J
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--
