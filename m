Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OWRGu-0007V9-QG for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:50:51 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 07 Jul 2010 11:36:11 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 7 Jul 2010 11:45:28 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 7 Jul 2010 11:45:27 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 7 Jul 2010 11:45:25 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819C15@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Is there a recipe for building and using busybox with libbusybox
	out there ?
Thread-Index: AcsduSA//I4/tDH7Ru6vSGFVs/clfA==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 07 Jul 2010 09:45:27.0584 (UTC)
	FILETIME=[21593200:01CB1DB9]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Is there a recipe for building and using busybox with libbusybox out there ?
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
X-List-Received-Date: Wed, 07 Jul 2010 09:51:06 -0000
X-List-Received-Date: Wed, 07 Jul 2010 09:51:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I want to use busybox with the applet binaries linked against libbusybox
in our system.
We need a wide range of applets at the same time, so I suppose it will
save overall needed memory space.

Also I want to prevent the system from updating alternatives while the
first boot. We have to provide a read only root file system.

So my question, is somebody working on a recipe for using buysbox this
way ?

Regards
Wolfgang Hauser


