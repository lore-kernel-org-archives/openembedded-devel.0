Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OiRc1-000355-Hg for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 14:37:54 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet1.eads.net with ESMTP; 09 Aug 2010 14:26:58 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 9 Aug 2010 14:33:10 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 9 Aug 2010 14:33:10 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Aug 2010 14:33:09 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6F@deimsg40.de.net.world>
In-Reply-To: <1281354438.3767.21.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH][v2][Resent] busybox: fix defconfig handling
	problems triggered by "configure according to {MACHINE,
	DISTRO}_FEATURES"; added inetd handling
Thread-Index: Acs3uNIYYEr28OlfTmC+SFzbd/AzHQABG0BA
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E5A@deimsg40.de.net.world>
	<1281354438.3767.21.camel@mattotaupa>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Aug 2010 12:33:10.0290 (UTC)
	FILETIME=[06D20720:01CB37BF]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2][Resent] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Mon, 09 Aug 2010 12:37:54 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Sorry to bother you again. It looks like you appended to patches in
your
> attachment. Please sent them separately. That doesn't matter, I am
learning.

That doesn't matter, I am learning.

But that are the things, a HowTo may contain and newbees don't know
about w/o extensive manual digging.

That HowTo could contain a step by step for creating a proper patch:

1. Changing code
   - references to "Best practices"

2. Checkout the proper base repository
   - commands
   - locations for http:// and git:// access

3. Commit the changes
   -commands (update/merge -> check in)
   -policies
   -commit message examples

4. Create a patch
   -commands
   -policies
   -background

5. Send a patch
   - commands
   - Subject examples
   - Header examples
   - Restrictions

6. Troubleshooting
   ...

Just as an suggestion.

Regards
Wolfgang Hauser


