Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OAQWT-0003vK-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 18:35:34 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OAQSl-00064Q-4G from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:31:43 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 7 May 2010 09:31:42 -0700
Received: from 172.30.80.68 ([172.30.80.68]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri,  7 May 2010 16:31:33 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	07 May 2010 09:31:29 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Fri, 07 May 2010 09:31:23 -0700
Message-ID: <1273249883.457.336.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 07 May 2010 16:31:42.0982 (UTC)
	FILETIME=[C7050260:01CAEE02]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: calamari (ppc e500v2) failure
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
X-List-Received-Date: Fri, 07 May 2010 16:35:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,

With DISTRO=3Dminimal and MACHINE=3Dcalamari, I see the following failure i=
n
gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge,
so this is unrelated.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation



