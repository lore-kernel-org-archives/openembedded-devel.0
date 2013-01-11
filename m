Received: from 10.mo4.mail-out.ovh.net ([188.165.33.109]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>) id 1TtedJ-00059L-Td
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 14:26:56 +0100
Received: from mail413.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 45AEC105048B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 13:05:19 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2013 13:55:55 +0200
Received: from host3-118-dynamic.54-79-r.retail.telecomitalia.it (HELO
	localhost.localdomain) (denis%eukrea.com@79.54.118.3)
	by ns0.ovh.net with SMTP; 11 Jan 2013 13:55:55 +0200
Date: Fri, 11 Jan 2013 12:55:54 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20130111125554.1735848c@no-log.org>
In-Reply-To: <20130110171202.0bc85da7@e6520eb>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
	<20130107193340.GH3285@jama> <20130110123931.2dbeb03f@no-log.org>
	<20130110171202.0bc85da7@e6520eb>
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.14; i686-pc-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 18287429237044051630
X-Ovh-Remote: 79.54.118.3 (host3-118-dynamic.54-79-r.retail.telecomitalia.it)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrhedtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 11 Jan 2013 13:26:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Jan 2013 17:12:02 +0100
Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Hi Denis,
Hi,
> Le Thu, 10 Jan 2013 12:39:31 +0100,
> Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> a =C3=A9crit :
>=20
> > On Mon, 7 Jan 2013 20:33:40 +0100
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> > > On Sun, Jan 06, 2013 at 08:12:57PM -0200, Otavio Salvador wrote:
> > > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > >=20
> > > I've build tested all 3 on jenkins and looks good to me:
> > It does the same than the previous version of firefox:
> > root@om-gta04:~# firefox
> > Illegal instruction
> >=20
> > om-gta04 is an armv7 machine with NEON.
> > I think it's a toolchain issue.
> >=20
> can you test it on your cpuimx51 please ?
With which branch? danny? denzil? master?

Denis.



