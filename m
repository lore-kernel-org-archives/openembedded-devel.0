Return-Path: <joe@deserted.net>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id D53BF6E908
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 02:48:48 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl1so1086355igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 18:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=+hp+6iEdA1wHnOLezYP7G4lG7EHAny0O9LoLCoWB4S0=;
	b=WfA1bnq/ZfpDKZQGznGxkYfCLq2tNMiABwQIdO8QMdALl93Tg65jqLnkZJLzalbthR
	bYqhQuSsvfa/QIXgx/EKISwOdXxOfemY4aRFi6L1VWQpZc4sEnzHjmgtLEefiaF/6vpC
	Br1W6SPC4ZI5zvrmpcyl4Uq3EJXkCpTNojMuJSMJMY7nSITE6BCqNaN9rzn8tG7/VyrO
	TF1gGAbgiQ08k0AK0X2FKe14Ewg9XEaJd7uTDF01GqIGoHOLXHpENyX8cf7pp1b9mSPD
	8UIb3Y/guDoqkpvPN0lKi0Cz24KX7YfwEyeLbvbPfXsj3RHv6bodR4rmWiKvxQQhYf4v
	j/4A==
X-Gm-Message-State: ALoCoQm2kpmeMNfv7uTLJbebk/A9Na3QNXJYUFyFv0qUnOY/LeSCBbHYu0WJRYHWWyfXtkbW5++8
X-Received: by 10.50.136.162 with SMTP id qb2mr23785879igb.11.1393382929585;
	Tue, 25 Feb 2014 18:48:49 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	v5sm43991264igb.0.2014.02.25.18.48.48 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 18:48:48 -0800 (PST)
Date: Tue, 25 Feb 2014 21:48:46 -0500
From: Joe MacDonald <joe@deserted.net>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20140226024843.GB7489@deserted.net>
References: <1B858668EC6A94408DCA5225FDFA85AAA33E98A1@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAA33E98A1@ALA-MBA.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Wed, 26 Feb 2014 02:48:54 -0000
X-Groupsio-MsgNum: 48354
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] strongswan: update verion to 5.1.1] On 1=
4.02.25 (Tue 12:19) Huang, Jie (Jackie) wrote:

>=20
>=20
> >=20
> >=20
> > -------- Original Message --------
> > Subject: 	Re: [oe] [meta-networking][PATCH] strongswan: update verion t=
o 5.1.1
> > Date: 	Wed, 12 Feb 2014 20:02:22 -0500
> > From: 	Joe MacDonald <joe@deserted.net>
> > Reply-To: 	<openembedded-devel@lists.openembedded.org>
> > To: 	<jackie.huang@windriver.com>
> > CC: 	Paul Eggleton <paul.eggleton@linux.intel.com>, <openembedded-
> > devel@lists.openembedded.org>
> >=20
> >=20
> > [Re: [oe] [meta-networking][PATCH] strongswan: update verion to 5.1.1] =
On 14.01.22 (Wed 12:29)
> > Otavio Salvador wrote:
> >=20
> > > On Tue, Jan 21, 2014 at 12:50 AM, jhuang0 <jackie.huang@windriver.com=
> wrote:
> > > >
> > > >
> > > > On 1/20/2014 10:56 PM, Paul Eggleton wrote:
> > > >>
> > > >> On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wrot=
e:
> > > >>>
> > > >>> * Add rdepends on strongswan-plugins.
> > > >>
> > > >>
> > > >> Is this really correct? Does strongswan not work without the plugi=
ns?
> > > >
> > > >
> > > > Yes, without the plugins, the ipsec_starter fails to start:
> > > >
> > > > root@qemu0:~# ipsec start
> > > > Starting strongSwan 5.1.1 IPsec [starter]...
> > > > root@qemu0:~# tail /var/log/auth.log -n 4
> > > > 2014-01-21T02:46:57.175940+00:00 qemu0 ipsec_starter[926]: Starting
> > > > strongSwan 5.1.1 IPsec [starter]...
> > > > 2014-01-21T02:46:57.653396+00:00 qemu0 ipsec_starter[935]: charon h=
as quit:
> > > > initialization failed
> > > > 2014-01-21T02:46:57.656916+00:00 qemu0 ipsec_starter[935]: charon
> > > > refused to be started
> > > > 2014-01-21T02:46:57.661374+00:00 qemu0 ipsec_starter[935]: ipsec
> > > > starter stopped
> > >
> > > So why to split it?
>=20
> Sorry for late response since I lost lots of Emails in my broken hard dis=
k.=20
>=20
> Actually I didn't know why it was split to plugins, the original version =
5.0.0 in meta-networking did that,=20
> I just kept what it was and did some necessary changes in the uprev.

so, a bit of digging turns up that  it looks like this was done as part
of addressing a QA issue.  That's when FILES_${PN}-plugins appears to
have been introduced.  That almost certainly seemed like the cleanest
approach at the time (in the absence of any other information, it's
certainly what I would've done) but knowing that strongswan is
non-functional without the plugins, I think the right thing to do is
remove the split rather than introduce an RDEPENDs.

-J.

>=20
> Thanks,
> Jackie
>=20
> >=20
> > ping
> >=20
> > --
> > -Joe MacDonald.
> > :wq
> >=20
> >=20
>=20

--=20
-Joe MacDonald.
:wq

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMNVgEACgkQwFvcllog0XzxFwCdGXnrZK4yU8RGzoQgIhFIO7wa
tFAAoIuLeW1MmE5q8MMVTFIUkXIoBPCq
=HHfD
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
