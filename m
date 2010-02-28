Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nlrtc-0002ql-Hn
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 23:46:01 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nlrqr-0005QN-Rj from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 14:43:05 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sun, 28 Feb 2010 14:43:05 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 28 Feb 2010 22:41:33 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	28 Feb 2010 15:41:28 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1NlqMw-0004yw-KS@melo.openembedded.org>
References: <E1NlqMw-0004yw-KS@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Sun, 28 Feb 2010 15:41:28 -0700
Message-ID: <1267396888.9295.30.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 28 Feb 2010 22:43:05.0557 (UTC)
	FILETIME=[64612050:01CAB8C7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graeme Gregory : firefox_3.6.bb : add new version, convert to new staging
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
X-List-Received-Date: Sun, 28 Feb 2010 22:46:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-02-28 at 21:08 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 0ca0394c94028b941603b2d6f7264d3eaaed5a98
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D0ca0394c94028b941603b2d6f7264d3eaaed5a98
>=20
> Author: Graeme Gregory <dp@xora.org.uk>
> Date:   Sun Feb 28 21:07:28 2010 +0000
>=20
> firefox_3.6.bb : add new version, convert to new staging

Do we still honestly need PARALLEL_MAKE =3D "" ?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


