Received: from mailde1.eads.com ([80.156.44.82])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1P1hwk-0000i1-94 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 17:55:04 +0200
Received: from de-gate1.mailhub.intra.corp ([53.154.243.33]) by
	mailde1.eads.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 17:56:31 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Fri, 1 Oct 2010 17:54:40 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 17:54:40 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 1 Oct 2010 17:54:38 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74993@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: svn:// fetcher do not checkout repository at every build
Thread-Index: ActF0WqNP0WhmhscQgyc1zcdtpEpIAbgJ4hwAAt8VeA=
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Oct 2010 15:54:40.0318 (UTC)
	FILETIME=[F4EEA5E0:01CB6180]
X-SA-Exim-Connect-IP: 80.156.44.82
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: svn:// fetcher do not checkout repository at every build
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
X-List-Received-Date: Fri, 01 Oct 2010 15:55:14 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

an additional question according to checking out from svn:

Before the sources are checked out from internal svn following messages
are received:

--2010-10-01 17:14:57--
http://www.angstrom-distribution.org/unstable/sources/xxx.tar.gz
.. snip
2010-10-01 17:15:10 ERROR 404: Not Found.

--2010-10-01 17:15:10--  http://mirrors.openembedded.org//xxx.tar.gz
.. snip
2010-10-01 17:15:10 ERROR 404: Not Found.

--2010-10-01 17:15:10--  http://sources.openembedded.org//xxx.tar.gz
..snip
2010-10-01 17:15:10 ERROR 404: Not Found.

after this message the sources get checked out from our internal svn.

It seems that some mirrors are checked first before trying the internal
svn.

How this behavior may turned off ?

Regards
Wolfgang


