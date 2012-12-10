Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ti4K3-0004fU-44
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 15:27:07 +0100
Received: from mail188.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 2BE94100C2A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 12:52:01 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Dec 2012 13:43:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Dec 2012 13:43:27 +0200
Date: Mon, 10 Dec 2012 12:43:26 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20121210124326.5590b0ff@eb-e6520>
In-Reply-To: <CALbNGRT7R_4ZycbG+Fg5dJWBTmiXfbr3p+HK5b0rE=5qE_v6qw@mail.gmail.com>
References: <1354662118-31597-1-git-send-email-pab@pabigot.com>
	<CALbNGRT7R_4ZycbG+Fg5dJWBTmiXfbr3p+HK5b0rE=5qE_v6qw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 14618402915600608585
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: [meta-oe][danny][PATCH] Revert "libgphoto2: fix build"
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
X-List-Received-Date: Mon, 10 Dec 2012 14:27:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Peter and Andreas,

Le Wed, 5 Dec 2012 07:58:33 +0100,
Andreas M=FCller <schnitzeltony@googlemail.com> a =E9crit :

> On Wed, Dec 5, 2012 at 12:01 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> > From: "Peter A. Bigot" <pab@pabigot.com>
> >
> > This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.
> >
> > Patch made in response to oe-core commit 841ea3c1c breaks builds using
> > oe-core danny branch which branched before that commit.
> >
> > Signed-off-by: Peter A. Bigot <pab@pabigot.com>

pushed to danny-next + Andreas' request concerning "gphoto2: fix
gettext build error", please check the result is what you expect.

Thanks,
Eric


