Received: from [150.202.8.1] (helo=dc1gateway.sjm.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <jtiller@sjm.com>) id 1In08f-000322-RG
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 00:04:52 +0100
Received: from USSYML02.ad.sjm.com ([150.202.22.59]) by dc1gateway.sjm.com
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 30 Oct 2007 15:52:36 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 30 Oct 2007 15:52:35 -0700
Message-ID: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: *Very* newbie question: OE and Cygwin?
Thread-Index: AcgbR4/bbh81muynTmmZaS3WzoR0iA==
From: "Tiller, Jason" <jtiller@sjm.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 30 Oct 2007 22:52:36.0160 (UTC)
	FILETIME=[90893C00:01C81B47]
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: *Very* newbie question: OE and Cygwin?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2007 23:04:53 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, All, :)

=20

[Main question: Can I use OE on cygwin to target a PXA270-based board?]

=20

My name is Jason Tiller and I'm a software engineer at St. Jude

Medical, a heart-related medical device company.  I'm the only

software engineer in a division that builds high-intensity focused

ultrasound cardiac ablation devices for the relief of atrial

fibrillation.

=20

I'm evaluating a new microprocessor for a next-generation power

generator.  We hope to use a linux kernel inside the instrument.  I'm

using a Logic Devices PXA270-based Zoom eval board.  I saw on one of

the LD boards that OE has support for this micro/board combination.

I'd like to try OE to build a kernel and throw up some simple apps,

but I have to do the host development in Windows, which means Cygwin.

=20

In fact, the LD SDK is built on cygwin - they provide pre-built win32

gnu cross-tools that rely on cygwin apps.  I'm in the process of

updating my Cygwin installation with all of the tools that the wiki

(http://www.openembedded.org/wiki/RequiredSoftware) declares are

required for OE.  Some of them aren't pre-built Cygwin packages

(psyco, jade (but openjade is), sgmltools, docbook-utils, libsdl), but

it looks like the really important ones are there.

=20

Should I expect a major headache in this effort?  My IT department is

very cautious, and they won't certify my (desperately underpowered)

Linux box for a net connection, so it's a lot easier to use my Windows

box for development.

=20

Thanks for any heads up from a (hopefully) new OE user!

=20

---Jason

St. Jude Medical

My product: http://tinyurl.com/e6gvq

=20


