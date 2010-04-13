Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O1luh-0006Qm-VR
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 21:36:48 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O1lrL-00078g-7C from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 12:33:19 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 13 Apr 2010 12:33:18 -0700
Received: from 172.30.80.192 ([172.30.80.192]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 13 Apr 2010 19:33:18 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	13 Apr 2010 12:33:10 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hq16p2$e9c$1@dough.gmane.org>
References: <hq16p2$e9c$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Tue, 13 Apr 2010 12:33:10 -0700
Message-ID: <1271187190.29304.193.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 13 Apr 2010 19:33:19.0000 (UTC)
	FILETIME=[2BA36980:01CADB40]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python 2.6 for bitbake?
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
X-List-Received-Date: Tue, 13 Apr 2010 19:36:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-04-13 at 09:33 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> I just noticed bitbake master is using python 2.6, which means I can't
> use it at work when the official linux is still ubuntu 8.04LTS :(
>=20
> Can we please keep bitbake working with 8.04LTS? I suspect not only TI
> is on the LTS bandwagon....

As a not quite here nor there point, RHEL5 is python 2.4.3 and that's
another big IT dept official linux choice.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


