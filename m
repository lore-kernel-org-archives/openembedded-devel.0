Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TtL3P-0004DP-JU
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 17:32:35 +0100
Received: from mail606.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 86680DC670E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 17:21:27 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2013 18:11:36 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 10 Jan 2013 18:11:35 +0200
Date: Thu, 10 Jan 2013 17:12:02 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: denis@eukrea.com
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20130110171202.0bc85da7@e6520eb>
In-Reply-To: <20130110123931.2dbeb03f@no-log.org>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
	<20130107193340.GH3285@jama> <20130110123931.2dbeb03f@no-log.org>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 16732842941570854217
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>, martin.jansa@gmail.com
Subject: Re: [meta-browser][PATCH 1/3] scripts/firefox-gen-l10n-recipes: Update copyright to 2013
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
X-List-Received-Date: Thu, 10 Jan 2013 16:32:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Le Thu, 10 Jan 2013 12:39:31 +0100,
Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> a =C3=A9crit :

> On Mon, 7 Jan 2013 20:33:40 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Sun, Jan 06, 2013 at 08:12:57PM -0200, Otavio Salvador wrote:
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >=20
> > I've build tested all 3 on jenkins and looks good to me:
> It does the same than the previous version of firefox:
> root@om-gta04:~# firefox
> Illegal instruction
>=20
> om-gta04 is an armv7 machine with NEON.
> I think it's a toolchain issue.
>=20
can you test it on your cpuimx51 please ?

Eric


