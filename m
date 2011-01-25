Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1PhkMU-0002ZZ-Q9
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:59:14 +0100
Received: from [192.168.1.13] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 2385C58413E; 
	Tue, 25 Jan 2011 16:15:29 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1082)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1295879950-24057-1-git-send-email-vjaquez@igalia.com>
Date: Tue, 25 Jan 2011 15:58:30 +0100
Message-Id: <4DD7B11A-3C41-4BCD-AC46-FD1A0FA16A5C@vanille-media.de>
References: <1295879950-24057-1-git-send-email-vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] minimal.conf: inherit devshell task
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
X-List-Received-Date: Tue, 25 Jan 2011 14:59:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Am 24.01.2011 um 15:39 schrieb V=EDctor Manuel J=E1quez Leal:

> Everybody loves devshell
>=20
> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>
> ---
> conf/distro/minimal.conf |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index f495d13..11525b9 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -104,6 +104,9 @@ QA_LOG =3D "1"
> #run QA tests on recipes
> INHERIT +=3D "recipe_sanity"
>=20
> +#make devshell available as task
> +INHERIT +=3D "devshell"=20
> +
> =
##########################################################################=
###
> # PREFERRED VERSIONS
> =
##########################################################################=
###
> --=20
> 1.7.0.2
>=20



