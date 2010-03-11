Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Npl2p-0008B9-Rv
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 17:15:33 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Npkzw-0000vQ-5S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 08:12:32 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 11 Mar 2010 08:12:31 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 11 Mar 2010 16:11:35 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	11 Mar 2010 09:11:32 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100311131340.20219.23563.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100311131340.20219.23563.stgit@ES-J7S4D2J.amer.consind.ge.com>
Organization: Mentor Graphics Corporation
Date: Thu, 11 Mar 2010 09:11:32 -0700
Message-ID: <1268323892.16526.281.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 11 Mar 2010 16:12:31.0692 (UTC)
	FILETIME=[A74058C0:01CAC135]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale mpc8641_hpcn demo board
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
X-List-Received-Date: Thu, 11 Mar 2010 16:15:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-03-11 at 13:13 +0000, Martyn Welch wrote:
> A demo board from Freescale, based on the MPC8641D Freescale SOC.
> ---
>=20
>  conf/machine/mpc8641-hpcn.conf                    |   23=20

I don't see this bringing in a tune file.  I have to admit I forget
off-hand what mpc86xx maps into, but I'm sure there's some -mcpu for it
(or will be), and there's always the package arch stuff).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


