Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QUHkE-00051Q-E2 for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 14:20:22 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p58CHATE006497
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jun 2011 14:17:11 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 8 Jun 2011 14:17:04 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 8 Jun 2011 14:17:04 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
In-Reply-To: <1307534514.2529.4780.camel@phil-desktop>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Amend recipes which do not contain a (new) target machine
	in COMPATIBLE_MACHINE
Thread-Index: Acwl0/MpR2Xpj0wRRtKmQHTtyCtIBAAAEgSw
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
	<1307534514.2529.4780.camel@phil-desktop>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jun 2011 12:17:04.0747 (UTC)
	FILETIME=[FA7A1BB0:01CC25D5]
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
X-List-Received-Date: Wed, 08 Jun 2011 12:20:22 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>Can you not just arrange for your layer to add your own machine to the
>recipe's COMPATIBLE_MACHINE definition?
>
>p.

Sure, but then I have to copy the whole files used by the recipe into my
layer, that cuts me off from the maintenance of the release.



