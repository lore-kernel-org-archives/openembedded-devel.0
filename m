Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NomcC-0005l8-Ez
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 00:44:01 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NomZK-0000WJ-TF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 15:41:02 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Mar 2010 15:41:02 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  8 Mar 2010 23:40:13 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Mar 2010 16:40:12 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003090129.19439.roman@khimov.ru>
References: <201003082201.30147.roman@khimov.ru>
	<1268081324.16526.82.camel@trini-m4400>
	<201003090129.19439.roman@khimov.ru>
Organization: Mentor Graphics Corporation
Date: Mon, 08 Mar 2010 16:40:12 -0700
Message-ID: <1268091612.16526.110.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 08 Mar 2010 23:41:02.0465 (UTC)
	FILETIME=[D0152F10:01CABF18]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qemu 0.12.3, cleanup
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
X-List-Received-Date: Mon, 08 Mar 2010 23:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-09 at 01:29 +0300, Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 08 =
=D0=BC=D0=B0=D1=80=D1=82=D0=B0 2010 23:48:44 =D0=B0=D0=B2=D1=82=D0=BE=D1=80=
 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > On Mon, 2010-03-08 at 22:01 +0300, Roman I Khimov wrote:
> > > Hello all.
> > >
> > > Please take a look at "rik/qemu-0.12" branch on OE git repo. 0.9.x
> > > removal patch is 0.5 Mb, so I think it's not appropriate for mailing
> > > list. In general, 0.12.3 addition was easy, but then I've discovered =
that
> > > 0.10.3 version is not working on openSUSE 11.2, so there is also a ch=
ange
> > > in sanity and proposal to remove 0.10.3 from repository.
> > >
> > > Comments are welcome.
> >=20
> > Looks good except maybe we should move to BBCLASSEXTENDS while we're in
> > here?
>=20
> Sure, an updated version is pushed.

Acked-by: Tom Rini <tom_rini@mentor.com>

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


