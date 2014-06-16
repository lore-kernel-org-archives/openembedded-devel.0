Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 955C36FED0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:48:25 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id n15so4105525wiw.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mHJE6WSJfOPExfvxwF6JSxRov+DVt3OgnDW/BQ7GupY=;
	b=rpNSRDkHkPZgq5YkDNaRtf598PVqKdfZlKYqZQ2qzS3TcKsRIHQ+5MYk2MzaUpcUfQ
	Pzm19+Stk/sjDpugqW7GiwlvcZZoVQE8/0yfxQFrEE2xlpl/A+U3YAOPUimsCILIV3wb
	zgzjHh7YgQHXNnJ8EF3UfsB3M/ztaPHH00JZ7YOMX49YSvQ7sRUVhtG282ZzIBUF0ds1
	typd0BW6R4oZ4S62dc/Ucxi8zJnXBBmtVwZPmHDpaqOF9E9SsEBHjQSgqbNIQeItOBnS
	UjvovBGhZ8JTQKvZNqBNcx/Ij/v4hSMFl4NqW1dlDTQKktbJ45ZAchiptaLtNdhl1RgH
	YZaA==
X-Received: by 10.181.8.67 with SMTP id di3mr27550640wid.8.1402926505881;
	Mon, 16 Jun 2014 06:48:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm3292157eeg.35.2014.06.16.06.48.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 06:48:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Jun 2014 15:48:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140616134850.GP2428@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama>
MIME-Version: 1.0
In-Reply-To: <20140511145337.GE22774@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Mon, 16 Jun 2014 13:48:32 -0000
X-Groupsio-MsgNum: 50352
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GTGEtWEe6jD60dxL"
Content-Disposition: inline

--GTGEtWEe6jD60dxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2014 at 04:53:37PM +0200, Martin Jansa wrote:
> On Wed, May 07, 2014 at 11:32:34AM -0700, Philip Balister wrote:
> > On 05/05/2014 09:45 AM, Martin Jansa wrote:
> > > On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
> > >> Hi JaMa, what does it take to be a maintainer?
> > >>
> > >> Do I need to build check all the packages everyday?
> > >=20
> > > Definitely no everyday, there are more patches coming in just after t=
he
> > > release, but later it's something like 1-5 patches in month.
> > >=20
> > > So it doesn't need much time, but it's always good when it's done by
> > > someone else then master maintainer (to setup separate builds etc).
> > >=20
> > > Possibly more time is spent on watching the ML, because many people
> > > don't read README file and instead of following the proper procedure =
for
> > > backports to relase branches they just say somewhere in ML "BTW: also
> > > merge this to dora".
> > >=20
> > > You can also have some co-maintainer if you find way to split the work
> > > without duplicating it.
> >=20
> > Adam,
> >=20
> > I'd be glad to help scan the list for backport requests.
>=20
> Can one of you send README update patch?

There are first few backport requests and we still don't have official
daisy maintainer and README update.

Can anyone please volunteer and send README update patch?

--GTGEtWEe6jD60dxL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOe9cIACgkQN1Ujt2V2gBxBqACeKeZkgtYlad7mrKD6hqQCSTfa
GqcAmQF4NRNtOSwvhiG2/NVFyszd+ok2
=niV5
-----END PGP SIGNATURE-----

--GTGEtWEe6jD60dxL--
