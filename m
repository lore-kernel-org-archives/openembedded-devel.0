Received: from mail-pd0-f173.google.com ([209.85.192.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USCHU-0008UH-Ow
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 22:15:10 +0200
Received: by mail-pd0-f173.google.com with SMTP id v14so467753pde.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WjN05OvlpbjUHGT/Qcp+bJXrfOLMpzg5w9L1qqpf4tg=;
	b=DjPlh4L1tKaw4bx/MNkeQYELrhep8wWwc7Gchb78el3AVKpwWn8QUFpqYgPhkfrnGe
	GWgVgYjU5obMRJxQX0mhJFQi86jRtVwU4X2Cx0elgbECArKBHSSHSdVaq5nSEik0JZF1
	3zKkXMQ/1JIHHE8sbF9nsRAo5+06J9Hr/wi6LchM2slDhsK5YmVg0heJqJRRx5ttlFR/
	y7WHlFg1e7spfKCRjT1aTAJ4TC4vFPb2y8pRz6j2qG3Yn3OuvTFKgPLKQ6KuB75U+ZkY
	P8vuOIzW0TgUmr2l03rT0q41oqpCZmNL/+KdePfXuqwegk85UVAn4zucp0nFhdHoTfeZ
	he8g==
X-Received: by 10.68.254.3 with SMTP id ae3mr5279249pbd.82.1366142257277;
	Tue, 16 Apr 2013 12:57:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ts3sm3217408pbc.12.2013.04.16.12.57.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 12:57:36 -0700 (PDT)
Date: Tue, 16 Apr 2013 21:57:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416195735.GV10628@jama.dyndns-home.com>
References: <1366128149-52411-1-git-send-email-paul@paulbarker.me.uk>
	<20130416185701.GS10628@jama.dyndns-home.com>
	<CANyK_8cvCui97u0UjNSqW7XUf24Co3rwa7pCT17t25CuOX8y6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cvCui97u0UjNSqW7XUf24Co3rwa7pCT17t25CuOX8y6w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] vim: recommend that runtime data is installed along with binaries
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
X-List-Received-Date: Tue, 16 Apr 2013 20:15:12 -0000
X-Groupsio-MsgNum: 44260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qa1NXTiqN6KSzHv0"
Content-Disposition: inline

--qa1NXTiqN6KSzHv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 08:51:18PM +0100, Paul Barker wrote:
> On 16 April 2013 19:57, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Both vim patches in queue for testing, but please update your checkout.
> > For following patches (vim strip was using old indentation).
>=20
> Apologies, a lot can change in a day. Would you like an updated patch
> with the correct indentation?

No all submitted patches are already in-test (so I've updated them
manually where needed).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qa1NXTiqN6KSzHv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtrS8ACgkQN1Ujt2V2gBz3IQCeJT9W+GcTxNKjskHoDkXu/Yxc
dlIAn0e5xQrv1GestK9Sa4/bapd6wvDW
=F8vg
-----END PGP SIGNATURE-----

--qa1NXTiqN6KSzHv0--
