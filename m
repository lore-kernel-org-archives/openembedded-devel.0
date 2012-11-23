Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tbusc-0006JU-BW
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:09:22 +0100
Received: from mail632.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id D25C1FF9899
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 14:47:28 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Nov 2012 15:36:21 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Nov 2012 15:36:20 +0200
Date: Fri, 23 Nov 2012 14:36:19 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121123143619.7997e637@eb-e6520>
In-Reply-To: <20121123131256.GB2808@ad.chargestorm.se>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
	<k8nh49$jq6$1@ger.gmane.org>
	<20121123131256.GB2808@ad.chargestorm.se>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 8922475287629114697
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.500006/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: anders@chargestorm.se
Subject: Re: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Fri, 23 Nov 2012 15:09:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Anders,

Le Fri, 23 Nov 2012 14:12:57 +0100,
Anders Darander <anders@chargestorm.se> a =E9crit :

>=20
> * Koen Kooi <koen@dominion.thruhere.net> [121123 10:54]:
>=20
> > Op 22-11-12 17:54, Paul Eggleton schreef:
> > > This is the meta-systemd patch series corresponding to the recently s=
ent=20
> > > out patches for ntp in meta-networking. 1/3 and 2/3 should be applied=
=20
> > > ASAP even if 3/3 is not applied immediately, as the layer is currentl=
y=20
> > > broken; 3/3 needs to wait until after the meta-networking patches go =
in.
>=20
> > 1/3 and 2/3 have been applied.
>=20
> Could you, or Eric, apply them to danny also, or should we do a new pull-=
request?
>=20
please simply provide the commit hash you want to provide so that I can
easily cherry-pick them

Thanks
Eric


