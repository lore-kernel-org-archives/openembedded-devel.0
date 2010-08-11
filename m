Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Oj69C-0008Q2-6V for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 09:55:06 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 11 Aug 2010 09:43:42 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 11 Aug 2010 09:54:17 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 11 Aug 2010 09:54:17 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 11 Aug 2010 09:53:51 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5F6D@deimsg40.de.net.world>
In-Reply-To: <20100811062010.GB32300@jama>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Why PREFERRED_VERSION setting of <distro>.conf overrules
	local.conf setting ?
Thread-Index: Acs5HWopOvMnTqMOS1yGi3simj6fVQACu6LQ
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world><AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com><AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com><AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com><i3se2n$gj7$1@dough.gmane.org><AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com><AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com><AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com>
	<20100811062010.GB32300@jama>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 11 Aug 2010 07:54:17.0615 (UTC)
	FILETIME=[6631F1F0:01CB392A]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 07:55:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I don't wanted to initiate heavy changes, for my experience: "Don't
change a running system".

I just asked for a simple way to use my preferred version for specific
packages.

As I understand OE, it should be possible to use the main repository
with some view personal changes to get the image I need.=20
If I have to change distro and machine configurations and hold them in
my overlay, I can't use improvements of the main repository w/o heavy
changes in my own overlay.

For my opinion, a DISTRO only should be a recommendation for a set of
working peaces and not a "you have to use it" dictation.
There may be individual requirements a DISTRO never will be able to
cover.

Regards
Wolfgang Hauser=20


 =20


