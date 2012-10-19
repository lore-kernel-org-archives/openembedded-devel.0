Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPCPm-0004nM-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 15:15:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Oct 2012 06:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,612,1344236400"; d="scan'208";a="158081784"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Oct 2012 06:01:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Oct 2012 14:01:23 +0100
Message-ID: <3127414.Lxz4z1OQ2A@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CALbNGRSfeX-psVtxT9b6ECbfkQGS6cqu_HeeYJ=pV+pkefehAQ@mail.gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<06adf65bf49ad5e358ec6ac70880211741fe1d4b.1350589969.git.Martin.Jansa@gmail.com>
	<CALbNGRSfeX-psVtxT9b6ECbfkQGS6cqu_HeeYJ=pV+pkefehAQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 5/5] mcnavi: move from meta-oe to meta-efl
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
X-List-Received-Date: Fri, 19 Oct 2012 13:15:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 19 October 2012 04:50:11 Andreas M=FCller wrote:
> On Thu, Oct 18, 2012 at 9:54 PM, Martin Jansa <martin.jansa@gmail.com=
>=20
wrote:
> > * mcnavi depends on ecore, but meta-oe does not depend on meta-efl
> > * thanks to kergoth for reporting this!
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >=20
> >  {meta-oe =3D> meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb =
| 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename {meta-oe =3D> meta-efl}/recipes-navigation/mcnavi/mcnavi_0.=
3.3.bb
> >  (100%)>=20
> > diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> > b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb similarity ind=
ex
> > 100%
> > rename from meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> > rename to meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> > --
> > 1.7.12.4
>=20
> Just for the admins: Pure move patches do not make it into patchwork
> (had same with [1])
>=20
> Andreas
>=20
> [1]
> https://gitorious.org/schnitzeltony-oe-meta/meta-openembedded/commit/=
7acc5d
> 92451fb14627736c9099249f8952b5deab

My patch to add hddtemp yesterday (which was not just a move) somehow d=
idn't=20
make it into patchwork either :(

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


