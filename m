Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SPX44-0003FZ-Mu
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 12:45:46 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0D3F64B000F;
	Wed,  2 May 2012 12:35:57 +0200 (CEST)
Date: Wed, 2 May 2012 12:35:56 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120502123556.0f72b7da@eb-e6520>
In-Reply-To: <20120502095150.GA3682@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, martin.jansa@gmail.com
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 10:45:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed, 2 May 2012 11:51:50 +0200,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Wed, May 02, 2012 at 11:45:30AM +0200, Koen Kooi wrote:
> > From: Khem Raj <raj.khem@gmail.com>
>=20
> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
> gcc-4.7 and other gcc changes were in oe-core only after release AFAIK.
>=20
as I'm supposed to maintain meta-oe/denzil I would prefer that we keep a
few days before pushing patches to this branch.
I'll soon create a for-denzil branch on github to use it as a stagging
area and plan to update meta-oe/denzil once per week.

Eric


