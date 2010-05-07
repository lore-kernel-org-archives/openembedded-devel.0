Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OAQEb-0007ku-Ch
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 18:17:06 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OAQAs-0003q3-RS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:13:14 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 7 May 2010 09:13:14 -0700
Received: from 172.30.80.68 ([172.30.80.68]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri,  7 May 2010 16:13:11 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	07 May 2010 09:13:08 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
	<1273175555.457.296.camel@trini-m4400>
	<s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Fri, 07 May 2010 09:13:07 -0700
Message-ID: <1273248787.457.324.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 07 May 2010 16:13:14.0495 (UTC)
	FILETIME=[324F50F0:01CAEE00]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 16:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-05-06 at 18:17 -0700, Khem Raj wrote:
> On Thu, May 6, 2010 at 12:52 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > On Wed, 2010-05-05 at 17:14 -0700, Tom Rini wrote:
> >> On Thu, 2010-05-06 at 00:43 +0100, Richard Purdie wrote:
> >> > I finally felt the time was right so I've merged the work-in-progres=
s
> >> > branch I've been talking about to OE.dev. This contains various
> >> > architecture improvements and legacy staging cleanups that have been
> >> > used in Poky for a while with great benefit.
> >>
> >> I've started testing DISTRO=3Dminimal with the machines and images I s=
aid
> >> earlier.  Will report eventually (it's a lotta stuff).
> >
> > For DISTRO=3Dminimal, mpc8315e-rdb and calamari fail, both before and
> > after these changes.
>=20
> is it the same error about missing function from libgcc or something else=
 ?

I'll post some new threads with pastebins of what it looks likes.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


