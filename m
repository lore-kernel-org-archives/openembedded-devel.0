Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OAlkB-00088i-Lf
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 17:15:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OAlgR-0005O1-Br from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 08:11:15 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 8 May 2010 08:11:15 -0700
Received: from 172.30.80.76 ([172.30.80.76]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat,  8 May 2010 15:11:14 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 May 2010 08:11:10 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Sat, 08 May 2010 08:11:08 -0700
Message-ID: <1273331468.22943.217.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 08 May 2010 15:11:15.0004 (UTC)
	FILETIME=[B3BBC7C0:01CAEEC0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Sat, 08 May 2010 15:15:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
> 2010/5/7 Tom Rini <tom_rini@mentor.com>:
> > Hey all,
> >
> > With DISTRO=3Dminimal and MACHINE=3Dcalamari, I see the following failu=
re in
> > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge=
,
> > so this is unrelated.
>=20
> Which eglibc is that?
> The issues I had seemed due to some catch22 situation that I cured; I
> started a clean build yesterday before I left work & can tell the
> results on monday.
> My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
> minimal also using 2.10 or is it at 2.11
>=20
> I can also try to kick off a minimal build on monday

minimal is eglibc 2.10.  I'll try an Angstrom build.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


