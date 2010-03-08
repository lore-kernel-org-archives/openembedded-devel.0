Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nojvj-0007AR-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 21:52:00 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nojss-0007VN-Lt from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 12:49:02 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Mar 2010 12:49:02 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  8 Mar 2010 20:48:45 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Mar 2010 13:48:44 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003082201.30147.roman@khimov.ru>
References: <201003082201.30147.roman@khimov.ru>
Organization: Mentor Graphics Corporation
Date: Mon, 08 Mar 2010 13:48:44 -0700
Message-ID: <1268081324.16526.82.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 08 Mar 2010 20:49:02.0386 (UTC)
	FILETIME=[C8D61920:01CABF00]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Mon, 08 Mar 2010 20:52:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-03-08 at 22:01 +0300, Roman I Khimov wrote:
> Hello all.
>=20
> Please take a look at "rik/qemu-0.12" branch on OE git repo. 0.9.x remova=
l=20
> patch is 0.5 Mb, so I think it's not appropriate for mailing list. In gen=
eral,=20
> 0.12.3 addition was easy, but then I've discovered that 0.10.3 version is=
 not=20
> working on openSUSE 11.2, so there is also a change in sanity and proposa=
l to=20
> remove 0.10.3 from repository.
>=20
> Comments are welcome.

Looks good except maybe we should move to BBCLASSEXTENDS while we're in
here?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


