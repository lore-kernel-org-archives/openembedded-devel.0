Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S08NX-0006N9-Ny
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 10:20:53 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id ECF3C4B01AA;
	Wed, 22 Feb 2012 10:12:28 +0100 (CET)
Date: Wed, 22 Feb 2012 10:12:27 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20120222101227.59546393@eb-e6520>
In-Reply-To: <4F429115.3070907@opendreambox.org>
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Wed, 22 Feb 2012 09:20:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Le Mon, 20 Feb 2012 19:29:41 +0100,
Andreas Oberritter <obi@opendreambox.org> a =E9crit :
> On 20.02.2012 14:51, Eric B=E9nard wrote:
> > - imported 2.0.5 from oe-classic
> > - upgrade to 2.3.5 which is latest stable
> > - tested on ARMv5 with Angstrom
>=20
> I created a recipe for vsftpd, too. Here's my version for your=20
> reference. All patches were taken from the Debian or Ubuntu package.
>=20
> It differs from your recipe in these ways:
> - uses openssl
> - uses pam if available
> - uses xinetd
> - allows to set custom default configuration options in bbappends
> - only build-tested with OE-core, no runtime tests so far.
>=20
your recipe was just pushed (with this email as the commit message ...).
I think it would have need a little rework, at least to not depend on
xinetd by default and be runtime tested before being pushed.

Eric
--=20
http://eukrea.com/en/news/104-2012


