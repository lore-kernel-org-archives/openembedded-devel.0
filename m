Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QUboA-0003yP-48 for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 11:45:46 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p599gWKl019798
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Jun 2011 11:42:33 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 9 Jun 2011 11:42:27 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 9 Jun 2011 11:42:27 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE518A@GSX300A.mxchg.m.corp>
In-Reply-To: <20110608172121.GB30722@excalibur.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Amend recipes which do not contain a (new) target machine
	in COMPATIBLE_MACHINE
Thread-Index: AcwmAK3v89zR2vBOQMCPezyWq3+U+wAh2kEg
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp><1307534514.2529.4780.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp><1307535707.2529.4783.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp><iso6bf$lu8$1@dough.gmane.org><0C757E680E33864AB113392C7E83F910BE5188@GSX300A.mxchg.m.corp><20110608165027.GA30722@excalibur.local><0C757E680E33864AB113392C7E83F910BE5189@GSX300A.mxchg.m.corp>
	<20110608172121.GB30722@excalibur.local>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Jun 2011 09:42:27.0190 (UTC)
	FILETIME=[8B090160:01CC2689]
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 09 Jun 2011 09:45:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>> I have to check the exact error again, that may take bit.

It's not a problem with bitbake 1.12.0, the system (debian lenny) I have
to use to compile my system don't have python 2.6.0 installed, it uses
2.5.2 so bitbake 1.12.0 won't run. Sorry for complaining about an
"error". It was a view month ago I set up the OE environment, so I
forgot the reason why I have to use bitbake 1.10.8.

My amendment is working now, the kernel compiles and I have to test the
"metal".

thanks and regards
Wolfgang


