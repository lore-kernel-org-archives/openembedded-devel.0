Received: from 17.mo1.mail-out.ovh.net ([87.98.179.142]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsAws-0005wJ-O6
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 12:32:58 +0100
Received: from mail435.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id EF2C2FF9F44
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jan 2013 12:15:06 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2013 13:01:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2013 13:01:38 +0200
Date: Mon, 7 Jan 2013 12:01:29 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Message-ID: <20130107120129.352ae897@e6520eb>
In-Reply-To: <CAP9ODKp=wXUgCTgVVJQ_C9BAa5in+=ufWoyCNq-73aR6CsTcGA@mail.gmail.com>
References: <CAP9ODKr_NPX9kgu1jFWkrvhzM=0qFdHv4S9cZs0cGr=7z-iGZg@mail.gmail.com>
	<CAP9ODKp=wXUgCTgVVJQ_C9BAa5in+=ufWoyCNq-73aR6CsTcGA@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 12326915131231808892
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Patches for backport
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
X-List-Received-Date: Mon, 07 Jan 2013 11:32:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 1 Jan 2013 16:21:51 -0200,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :

> On Fri, Dec 21, 2012 at 4:22 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > Hello Eric,
> >
> > So we did a new set of changes in master, which we'd like to backport.
> > The changes are, in order:
> >
> > 2ac0acc2753f9853928a081cbc80c3daacbe7e08 xf86-video-geode: Add
> > rdepends on EXA Xorg module
> >
> > ade2d4d35e1efdd83bb555949bcfb8c7a1970ff0 xinput-calibrator: Fix
> > service file to require display-manag
> >
> > 43c2d4d3ca9889e54646e02d110d8155da96772c openmotif: Update SRC_URI and
> > add libxft in depends
> >
> > 1db0dbf9a8bf2f09ddbc09a4ccde227fdf9a866a openmotif: Disable printing su=
pport
> >
> > 38daf64fb87bbc34caad050e7295b910c9b80e7c openmotif: Avoid use os Xos.h =
from host
>=20
> Ping?
>=20
merged into danny-next. Test build in progress.

Eric


