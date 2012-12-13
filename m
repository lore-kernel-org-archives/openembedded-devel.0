Received: from 16.mo4.mail-out.ovh.net ([188.165.55.104]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tj5K3-0007eo-CN
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 10:43:19 +0100
Received: from mail423.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 75031104D172
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 10:22:15 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Dec 2012 11:14:45 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Dec 2012 11:14:43 +0200
Date: Thu, 13 Dec 2012 10:13:44 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: martin.jansa@gmail.com
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121213101344.5d980ae2@eb-e6520>
In-Reply-To: <20121213074729.GB3356@jama.jama.net>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
	<20121213074729.GB3356@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 11277857893633535305
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrtdeiucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/5] [meta-oe][danny] Small fixes from master
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
X-List-Received-Date: Thu, 13 Dec 2012 09:43:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Thu, 13 Dec 2012 08:47:29 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Tue, Dec 04, 2012 at 12:59:51PM +0100, Martin Jansa wrote:
> > The following changes since commit f8ad0760abf8055bac27036853c56f56b40a=
36c7:
> >=20
> >   README: update to danny (2012-11-23 15:22:46 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny
> >   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?=
h=3Djansa/for-danny
> >=20
> > Andrei Dinu (1):
> >   gypsy: added to meta-oe/recipes-navigation
> >=20
> > Martin Jansa (1):
> >   samba: update waf-as-source.patch to apply
> >=20
> > Paul Eggleton (3):
> >   ntp: cleanup recipes and fix SSL support
> >   ntp: make servers configurable and default to none configured
> >   meta-systemd: ntp: update for server config improvements
>=20
> ping?

please don't forget to cc me for patches concerning danny.

merged into danny-next

Thanks
Eric


