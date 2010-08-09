Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OiRz7-0005K8-G7 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 15:01:46 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 09 Aug 2010 14:58:58 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 9 Aug 2010 15:01:29 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 9 Aug 2010 15:01:29 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Aug 2010 15:01:27 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E7A@deimsg40.de.net.world>
In-Reply-To: <1281357774.3767.34.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH][v2 2/2] busybox: fix defconfig handling problems
	triggered by "configure according to {MACHINE,
	DISTRO}_FEATURES"; added inetd handling
Thread-Index: Acs3wJClH+LQVPRwQ6aI1me4isYcTgAAitOw
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
	<1281357774.3767.34.camel@mattotaupa>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Aug 2010 13:01:29.0229 (UTC)
	FILETIME=[FB778BD0:01CB37C2]
X-SA-Exim-Connect-IP: 80.156.45.105
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
X-List-Received-Date: Mon, 09 Aug 2010 13:01:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> That is not necessary as increasing of the INC_PR will have the PR
> increased along the way.

The busybox_1.16.2.bb is changed too, should there be really no increase
of PR ?

Regards
Wolfgang Hauser


