Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id B420061617
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:45:46 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 00F20D481F3;
	Thu,  5 Sep 2013 14:45:41 +0200 (CEST)
Date: Thu, 5 Sep 2013 14:45:40 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Javier Viguera <javier.viguera@digi.com>
Message-ID: <20130905144540.6c14eeb8@e6520eb>
In-Reply-To: <52287758.6050506@digi.com>
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
	<20130905140917.48edcb06@e6520eb> <52287758.6050506@digi.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:45:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Le Thu, 5 Sep 2013 14:21:44 +0200,
Javier Viguera <javier.viguera@digi.com> a =E9crit :
> On 05/09/13 14:09, Eric B=E9nard wrote:
> > in fact the correct URL is now :
> > https://github.com/cherokee/webserver/archive/v1.2.98.tar.gz
> > so I think you can switch to :
> > +SRC_URI =3D "https://github.com/cherokee/webserver/archive/v${PV}.tar.=
gz
>=20
> The problem with the "official" one in github is that it is not the=20
> same. The checksums are different and a basic *diff* verification=20
> between the unpacked packages shows a bunch of differences.
>=20
interesting :-(

> The one in the OSUOSL is exactly the same (same checksums).
>=20
> Regarding the mirror policies i just don't know. I was bitten by this=20
> problem trying to build cherokee in Dylan branch and tried to find a=20
> mirror. I selected OSUOSL because of its track supporting open source=20
> projects.
>=20
while you keep the same checksum there is no risk to get a wrong source
base so I don't see a problem here.

Eric

