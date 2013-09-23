Return-Path: <joe@deserted.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 33387610D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:22:07 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1969164eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 11:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=a9w9ZYMHjjU5UFWxyjMhQQKtU4zqr1CZMDUqYKZl6Ms=;
	b=EgSm1R3XWaQzJ6/WV2hJcPIOPf/6mV3qdE1CiczDwI6u+cNhF/l/wXcSm5x3hVSwnl
	eI3viATcITta+JW9TXeFAuNZdmVokWdE4OBQsvSBj09p8i8S8Tbm45MyhECFJ+ytshNr
	nUXg9h2rVy2qpY370YwWqam4PFd76q6a6vajCOSldI5Cvc7cos9b+INLRCfO/YszH/pK
	X78SL9k9hDXaNgbjyt0V549D50VSu3qT9hb+zT5WzYpHQDzvGVxxlEOm52Q5CPWXZ0LT
	Ylb5m8MCFs2vW2z7tE66LXP53Fjg+b8swoXHRs/bHSK4Qdk8hyrKGPms4q/QBsyP5IkE
	D2JQ==
X-Gm-Message-State: ALoCoQk6qc2BkZ4xhGKGVbjilysVpQqvHvh1zmceYb4ABl/XxbqNtqBFIETV4+/kmYJ5to/87no5
X-Received: by 10.14.246.11 with SMTP id p11mr39583730eer.9.1379960527749;
	Mon, 23 Sep 2013 11:22:07 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	y47sm44396812eew.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 11:22:06 -0700 (PDT)
Date: Mon, 23 Sep 2013 14:22:02 -0400
From: Joe MacDonald <joe@deserted.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130923182159.GA30829@deserted.net>
References: <1379927191-21769-1-git-send-email-b40290@freescale.com>
	<20130923171338.GC25887@deserted.net> <10075581.zIxvIPmXvh@helios>
MIME-Version: 1.0
In-Reply-To: <10075581.zIxvIPmXvh@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] snort: add recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 18:22:07 -0000
X-Groupsio-MsgNum: 46311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Paul,

[Re: [oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.23 (Mon =
18:56) Paul Eggleton wrote:

> All,
>=20
> I'm a bit confused; is this recipe supposed to be going into
> meta-networking or meta-security? Because patches have been sent
> recently to add it to both.

I had mentioned that I would accept snort into meta-networking if it
wasn't a good fit for meta-security since it was something I'd started
working on integrating anyway a while back.  I assumed that was the case
since it was sent to the list for meta-networking today.

I don't think we need copies in both places, though, and since it was
first aimed at meta-security, if it gets merged there, I won't merge it
here.

Hopefully nothing I've said here contradicts what the meta-security
maintainers would want to see.

--=20
-Joe MacDonald.
:wq

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJAhscACgkQwFvcllog0XyUWwCgkK0PKeAkjtJIV6i8DGpJeJkD
MOYAni1JvhlRDPl08yoKPW0+gFXWm5Jk
=mC8c
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
