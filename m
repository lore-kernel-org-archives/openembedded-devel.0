Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDcRq-00081e-FD
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:09:41 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so520151pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Qa21c1lpewueznIjg7pR4dpP4+0vNTZZ/iMalWis3WQ=;
	b=l1okeGulJgOxIMx76SWQxWoMmRpW46O84Y3DaVCcs23YHBy6m4EMrgQrlNj26OzgL4
	JKLESPnOLGYCbE1THb2nnJdKbYQfx4ZTQcjJTuRVGjYlMOkagAcH9Tt79v0bW3W6sSmU
	WRRCzzJiT9waFcwMeAlhzLnBgPgxePpNqRixllzDPesFK5JDooPeIZkdnNRD+45usbFZ
	Nm7xqUgZEVYxb81nCrzlnHm+r4jbo8QEDUJbRNetpr/oxbaVu6MCRd5B73BguscFn207
	tAoMyFJV2UDiKxAW/RPw0bHpi3syqX7avayCAWZIzLdYRX1xr/xvggZ6PalkDBona4hW
	vyDw==
X-Received: by 10.68.252.193 with SMTP id zu1mr53439116pbc.175.1362667981627; 
	Thu, 07 Mar 2013 06:53:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i10sm1952907pbd.1.2013.03.07.06.52.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 06:53:00 -0800 (PST)
Date: Thu, 7 Mar 2013 15:52:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130307145255.GM32228@jama.dyndns-home.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
	<9088096.rvOOlWx1VE@helios>
	<CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:09:42 -0000
X-Groupsio-MsgNum: 43426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fNagykWcDoSVAmSd"
Content-Disposition: inline

--fNagykWcDoSVAmSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 11:41:07AM -0300, Otavio Salvador wrote:
> On Thu, Mar 7, 2013 at 11:35 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 07 March 2013 15:03:17 Koen Kooi wrote:
> >> Op 7 mrt. 2013, om 14:04 heeft Martin Jansa <martin.jansa@gmail.com> h=
et
> >> volgende geschreven:
> >> > It would be nice to know yocto-1.4 release name in advance and name =
it
> >> > the same as branch in oe-core/meta-oe will be (denzil, danny, ...), =
but
> >> > I guess it can be renamed later.
> >>
> >> For angstrom I'm going to use 'yocto-1.4' in the branch name, I have t=
rouble
> >> remembering which names maps to which release. And the Yocto compliance
> >> program talks about 1.3, .14 etc, not about codenames.
> >
> > Wouldn't it be worth us trying to standardise rather than all doing our=
 own
> > thing and users having to figure out what matches up between different =
layers?
> > If others feel the same as you, then maybe we should all be using that =
schema.
>=20
> Or we use a codename or we don't.
>=20
> For me, codenames work fine but for users it is sometimes confusing as
> the website and marketing people talk about Yocto 1.3 or 1.4 while the
> involved people talk about codenames. So I find myself explaining it
> over and over again.

Yes I usually need to use both names, because some people want to hear
"Yocto".=20

But "Yocto 1.3" alone sometimes does not work in sentences like=20
"Update oe-core to latest revision in danny branch (Yocto 1.3)"
"Update bitbake to latest revision in 1.16 branch which is compatible with =
danny branches (Yocto
1.3)"

So I agree it's confusing, like in this pull-request
https://github.com/openwebos/build-webos/pull/25

Yes, I always forget to add "Project" :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fNagykWcDoSVAmSd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4qccACgkQN1Ujt2V2gBwfLgCcDUQZyogI9wv1g8yeoD1tPg0B
JLwAoIh1sbgVafYMp6scE0H3W5JbIEJh
=0KcY
-----END PGP SIGNATURE-----

--fNagykWcDoSVAmSd--
