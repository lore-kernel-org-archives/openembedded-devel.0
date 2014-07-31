Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 99AA06B7BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 18:01:28 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0D79494011A;
	Thu, 31 Jul 2014 20:01:26 +0200 (CEST)
Date: Thu, 31 Jul 2014 20:01:18 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140731200118.597e78e6@e6520eb>
In-Reply-To: <2463245.SkJkBSUsEE@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1402331046.git.paul.eggleton@linux.intel.com>
	<364f9086ac0c992f408413d9b2eb78d53d35b19b.1402331046.git.paul.eggleton@linux.intel.com>
	<2463245.SkJkBSUsEE@peggleto-mobl5.ger.corp.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][dylan][PATCH 1/1] x264: fix SRCREV after upstream repository change
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
X-List-Received-Date: Thu, 31 Jul 2014 18:01:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le Wed, 30 Jul 2014 12:28:42 +0100,
Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :

>=20
> On Monday 09 June 2014 17:24:30 Paul Eggleton wrote:
> > The upstream x264 project has re-imported all of their old history,
> > meaning that all of the hashes have changed. Update SRCREV based on the
> > mapping list they have provided at:
> >=20
> >   http://sprunge.us/dGOU
> >=20
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  meta-oe/recipes-multimedia/x264/x264_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb
> > b/meta-oe/recipes-multimedia/x264/x264_git.bb index c767ffd..4da24cc 10=
0644
> > --- a/meta-oe/recipes-multimedia/x264/x264_git.bb
> > +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> > @@ -11,7 +11,7 @@ DEPENDS =3D "yasm-native"
> >  SRC_URI =3D "git://git.videolan.org/x264.git \
> >      file://don-t-default-to-cortex-a9-with-neon.patch \
> >  "
> > -SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> > +SRCREV =3D "bfed708c5358a2b4ef65923fb0683cefa9184e6f"
> >=20
> >  PV =3D "r2230+git"
>=20
> ping
>=20

pushed, thanks and sorry for the delay

Eric

