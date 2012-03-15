Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S88NQ-0000d8-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:57:49 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 92FFE4B0085
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:49:00 +0100 (CET)
Date: Thu, 15 Mar 2012 11:48:58 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120315114858.46433c87@eb-e6520>
In-Reply-To: <4F61C710.3030901@mlbassoc.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
	<4F61C710.3030901@mlbassoc.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 10:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 15 Mar 2012 04:40:16 -0600,
Gary Thomas <gary@mlbassoc.com> a =E9crit :

> On 2012-03-14 13:59, Martin Jansa wrote:
> > * custom waf to fix dirty vala version was dropped
> > * I've fixed our vala to stop reporting dirty even for valid released t=
arballs
> >    so you can still get dirty version but it's not so common to keep th=
is ugly binary here.
> > * disable PARALLEL_MAKE to improve our chances agains build hangs
> >    (btw fedora is doing the same
> >     http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>=20
> I have a few questions about midori that I'm having trouble with.
> * Where does this come from?  Is there a project web page?  There's
>    no real indication in the recipes that I can find.
http://en.wikipedia.org/wiki/Midori_(web_browser)
http://www.twotoasts.de/index.php?/pages/midori_summary.html

> * Who/where can I go to with problems and/or questions?  The version
>    I've been using (0.4.3) isn't very stable and has some "interesting"
>    behaviours I'd like to have addressed.
>=20
on their page they say :
Join #midori on Freenode to talk about Midori, discuss bugs and new
ideas.

Report bugs at the Launchpad Bug Tracker. See also the old Flyspray Bug
Tracker.
https://bugs.launchpad.net/midori

Eric
--=20
http://eukrea.com/en/news/104-2012


