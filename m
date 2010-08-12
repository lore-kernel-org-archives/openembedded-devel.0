Received: from mailde1.eads.com ([80.156.44.82])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OjaaX-0006AL-AF for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 18:25:06 +0200
Received: from de-gate1.mailhub.intra.corp ([53.154.243.33]) by
	mailde1.eads.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 12 Aug 2010 18:26:40 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 12 Aug 2010 18:24:53 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 12 Aug 2010 18:24:53 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 12 Aug 2010 18:24:52 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B60A2@deimsg40.de.net.world>
In-Reply-To: <1281357774.3767.34.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH][v2 2/2] busybox: fix defconfig handling problems
	triggered by "configure according to {MACHINE,
	DISTRO}_FEATURES"; added inetd handling
Thread-Index: Acs3wJClH+LQVPRwQ6aI1me4isYcTgCefTRA
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
	<1281357774.3767.34.camel@mattotaupa>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 12 Aug 2010 16:24:53.0753 (UTC)
	FILETIME=[E52B5E90:01CB3A3A]
X-SA-Exim-Connect-IP: 80.156.44.82
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2 2/2] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Thu, 12 Aug 2010 16:25:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>I am sorry and I hope the formal stuff will be alright when you
>resubmit. (Should be v3.)

I haven't forgot this, I just haven't time to work on it.

The new patch is on the way, I've done some tests and if I got a bit
spare time I'll prepare the patch.

Regards
Wolfgang


