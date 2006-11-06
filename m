Received: from [128.178.50.26] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1Gh2Px-000242-Kk
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 12:13:30 +0100
Received: (qmail 31183 invoked by uid 107); 6 Nov 2006 11:12:11 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp3.epfl.ch with SMTP; 6 Nov 2006 11:12:11 -0000
Received: from (smtp0.epfl.ch [128.178.50.19]) by MAILAV3.epfl.ch with smtp
	id 62b1_a645dc6a_6d87_11db_92c7_0014221528b0;
	Mon, 06 Nov 2006 12:12:11 +0100
Received: from mailbox1.epfl.ch (128.178.50.37)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Mon, 06 Nov 2006 12:12:11 +0100
Received: from lsa1pc7.epfl.ch (lsa1pc7.epfl.ch [128.178.145.53])
	(authenticated bits=0)
	by mailbox1.epfl.ch (8.12.11/8.12.11) with ESMTP id kA6BCArX016435
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2006 12:12:11 +0100 (MET)
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@openembedded.org
Date: Mon, 6 Nov 2006 12:12:10 +0100
User-Agent: KMail/1.9.5
References: <200611061111.13491.valentin.longchamp@epfl.ch>
	<454F0DCA.7040202@dominion.kabel.utwente.nl>
In-Reply-To: <454F0DCA.7040202@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200611061212.10622.valentin.longchamp@epfl.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Problem in building compiler
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
X-List-Received-Date: Mon, 06 Nov 2006 11:13:30 -0000
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KixTFgnDaKDH3Ed"

--Boundary-00=_KixTFgnDaKDH3Ed
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen Kooi wrote:
>
> Does the same error happen with MACHINE=mx31ads and DISTRO=angstrom-2007.1
> ? I recommend using that configuration and adding 'branding' later on when
> it's proven to work.
>

So the config file, tells to use glibc-2.5, but the compilation fails on the 
same package (glibc-intermediate).

The error is visible in the attach error log.

Looks like the glibc doesn't compile well for iMX31 processor options proposed 
by oe. Or is it something else ?

--Boundary-00=_KixTFgnDaKDH3Ed--
