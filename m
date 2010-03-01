Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmCtD-0007pu-Up
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:11:00 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmCqS-0005wx-7a from Tom_Rini@mentor.com ;
	Mon, 01 Mar 2010 13:08:04 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 13:08:03 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Mar 2010 21:08:01 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 14:08:01 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Antonio Ospite <ospite@studenti.unina.it>
In-Reply-To: <20100301214153.a74a73f6.ospite@studenti.unina.it>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
	<1267464991.9295.397.camel@trini-m4400>
	<20100301214153.a74a73f6.ospite@studenti.unina.it>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 14:08:00 -0700
Message-ID: <1267477680.4739.225.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Mar 2010 21:08:03.0707 (UTC)
	FILETIME=[48399CB0:01CAB983]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Mon, 01 Mar 2010 21:11:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-03-01 at 21:41 +0100, Antonio Ospite wrote:
> On Mon, 01 Mar 2010 10:36:31 -0700
> Tom Rini <tom_rini@mentor.com> wrote:
>=20
> > On Fri, 2010-02-19 at 00:34 +0000, Antonio Ospite wrote:
> > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > >=20
> > > ---
> > > In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more log=
ical to
> > > put it just before the target system info.
> >=20
> > Pushed, thanks.
> >=20
>=20
> You pushed v1, really not a big deal :)

Bah... Not my day.  Was it just commit message that changed?


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


