Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5F70B6D42C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 16:35:25 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id EDE584C80A8;
	Thu,  7 Nov 2013 17:35:20 +0100 (CET)
Date: Thu, 7 Nov 2013 17:35:19 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Javier Viguera <javier.viguera@digi.com>
Message-ID: <20131107173519.44235389@e6520eb>
In-Reply-To: <527BBED7.4010806@digi.com>
References: <1383840784-13159-1-git-send-email-eric@eukrea.com>
	<527BBED7.4010806@digi.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Thu, 07 Nov 2013 16:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 7 Nov 2013 17:24:55 +0100,
Javier Viguera <javier.viguera@digi.com> a =E9crit :

> Eric,
>=20
> On 07/11/13 17:13, Eric B=E9nard wrote:
> > -SRC_URI =3D "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}=
.tar.gz \
> > +SRC_URI =3D "http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2/$=
{PV}/cherokee-${PV}.tar.gz \
>=20
> The German mirror of cherokee-project seems to have a copy of the=20
> tarball (hopefully it will last) but in your patch there is an extra=20
> *1.2* that it should not be. The correct URL:
>=20
> <http://www.cherokee-project.de/mirrors/cherokee/1.2/1.2.98/cherokee-1.2.=
98.tar.gz>
>=20
yes I tested with wget but not the patch ;-)
Now fixing it.

Eric

