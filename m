Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QpGTq-0007xF-0Q for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 11:14:10 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p7599eb1005742
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Aug 2011 11:09:42 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 5 Aug 2011 11:09:46 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 5 Aug 2011 11:09:46 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51CA@GSX300A.mxchg.m.corp>
In-Reply-To: <4E3AD3A9.4000101@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] 2011.03-maintenance: eglibc-binary-localedata
	packages	missing on image
Thread-Index: AcxSyl9eZaJA0zIoSEq5sX817WTkcAAhGTcg
References: <0C757E680E33864AB113392C7E83F910BE5D9A@GSX300A.mxchg.m.corp><0C757E680E33864AB113392C7E83F910BE51C7@GSX300A.mxchg.m.corp>
	<4E3AD3A9.4000101@mentor.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 05 Aug 2011 09:09:46.0251 (UTC)
	FILETIME=[6BC535B0:01CC534F]
Subject: Re: 2011.03-maintenance: eglibc-binary-localedata packages	missing on image
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
X-List-Received-Date: Fri, 05 Aug 2011 09:14:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>I would look at classes/libc-package.bbclass and
>recipes/eglibc/eglibc-package.inc in oe.dev and see if there's been a
>fix here that needs to be back ported / cherry-picked.

Unfortunately there are no changes between the oe.dev
(remotes/origin/master) and the remotes/origin/2011.03-maintenance.

Does no one use eglibc with locales ?

Regards
Wolfgang Hauser


