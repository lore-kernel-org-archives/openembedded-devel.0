Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1S4cE9-0008AL-34 for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 19:01:41 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id q25HqfSh011261
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Mar 2012 18:52:42 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 5 Mar 2012 18:53:06 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 5 Mar 2012 18:53:05 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Disable GNU Hash check ?
Thread-Index: Acz6+NE6sFoKqLknQpCsyZCZZQTJ4A==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 05 Mar 2012 17:53:06.0370 (UTC)
	FILETIME=[D1AFE220:01CCFAF8]
Subject: Disable GNU Hash check ?
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
X-List-Received-Date: Mon, 05 Mar 2012 18:01:41 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I have to create a package containing static and dynamic libraries and
some files.
The libraries are delivered by a vendor and we have to use(install) them
as they are.

While bitbaking the QA procedure complains about missing GNU Hashes.=20

Is there a possibility to disable this check for a single recipe ?

I am using bitbake 1.10.2 and an OE mainenance-2011.03 based tree.

Regards
Wolfgang


