Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxSp8-0003O6-0J
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 00:25:14 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxSlw-00068V-EO from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:21:56 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 15:21:55 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 22:21:27 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 15:21:25 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1NxKhE-0007AF-AE@melo.openembedded.org>
References: <E1NxKhE-0007AF-AE@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 15:21:25 -0700
Message-ID: <1270160485.6277.143.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 22:21:55.0876 (UTC)
	FILETIME=[BCCF2E40:01CAD1E9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : packaged-staging: enhancements from Poky for fetching and relocatability
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
X-List-Received-Date: Thu, 01 Apr 2010 22:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
> Module: openembedded.git
> Branch: rpurdie/work-in-progress
> Commit: ccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3Dccbb586b3cfdc723ccad73dd71d85f6d41f0e6a3
>=20
> Author: Joshua Lock <josh@linux.intel.com>
> Date:   Wed Mar 31 11:22:02 2010 +0100
>=20
> packaged-staging: enhancements from Poky for fetching and relocatability

Question.  Do we really want to rename DEPLOY_DIR_PSTAGE to PSTAGE_DIR.
Is that really a nomenclature change like that?  I see it's still soft
assign so outsideof TMPDIR can work still, so it's fine otherwise.  Just
checking.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


