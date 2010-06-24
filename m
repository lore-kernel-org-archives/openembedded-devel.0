Received: from mx1.polytechnique.org ([129.104.30.34])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gregoire@gentil.com>) id 1ORwNQ-0006lD-Ds
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 02:02:37 +0200
Received: from [192.168.10.6] (c-69-181-223-70.hsd1.ca.comcast.net
	[69.181.223.70])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.polytechnique.org (Postfix) with ESMTP id 4CCDE1400560C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 01:28:30 +0200 (CEST)
From: Gregoire Gentil <gregoire@gentil.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.15191.1277421154.24517.openembedded-devel@lists.openembedded.org>
References: <mailman.15191.1277421154.24517.openembedded-devel@lists.openembedded.org>
Organization: Gregoire Gentil
Date: Thu, 24 Jun 2010 16:28:26 -0700
Message-ID: <1277422106.32627.32.camel@gregoire-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-AV-Checked: ClamAV using ClamSMTP at svoboda.polytechnique.org (Fri Jun 25
	01:28:30 2010 +0200 (CEST))
X-Org-Mail: gregoire.gentil.1992@polytechnique.org
X-SA-Exim-Connect-IP: 129.104.30.34
X-SA-Exim-Mail-From: gregoire@gentil.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Updated recipe for chrome
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
X-List-Received-Date: Fri, 25 Jun 2010 00:02:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> Message: 1
> Date: Thu, 24 Jun 2010 08:12:54 -0700
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] Updated recipe for chrome
> To: openembedded-devel@lists.openembedded.org
> Cc: Koen Kooi <koen@openembedded.org>
> Message-ID: <20100624151254.GB28292@gmail.com>
> Content-Type: text/plain; charset=3Dus-ascii
>=20
> On (24/06/10 04:13), Gary Thomas wrote:
> > On 06/22/2010 05:21 AM, Gary Thomas wrote:
> > >Does anyone have an updated recipe for Google chrome?  The
> > >one in org.openembedded.dev is really old - SVN revision
> > >34027 - mainline is at 50359!
> > >
> > >I looked at the recipe and it seems to be full of magic
> > >(subpackages with specific SVN revisions, etc). I doubt
> > >that just updating the main SVN revision number will work.
> > >
> > >Any ideas/pointers? I'd really like to try some of the
> > >latest features on my embedded systems :-)
>=20
> I would encourage to bump the srcrev and see what happens
> there might be some patches need rework if any.
>=20
> >=20
> > Can someone please comment on this (maybe the package author)??
> > I'm will to try/test changes, I'm just not sure what to change.
I wrote the initial recipe and I have done some work on this front. Read
the previous email that I sent about AIOS. It would be great indeed to
upgrade this application,

Gr=C3=A9goire




