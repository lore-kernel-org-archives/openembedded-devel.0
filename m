Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HADxD-0003jQ-PR
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jan 2007 00:24:27 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id C629428C012; Fri, 26 Jan 2007 00:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180183234.adsl.alicedsl.de [85.180.183.234])
	by srv043.dedi23.de (Postfix) with ESMTP id 612AA28C011
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2007 00:19:48 +0100 (CET)
Date: Fri, 26 Jan 2007 00:24:26 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <5749407.20070126002426@vanille-media.de>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45A905A7.4070300@dominion.kabel.utwente.nl>
References: <1888834532.20070112204308@vanille-media.de>
	<1168681959.5868.4.camel@localhost.localdomain>
	<45A905A7.4070300@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Gtk+ 2.6.10 w/ newer Glibs
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
X-List-Received-Date: Thu, 25 Jan 2007 23:24:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Richard Purdie schreef:

>> To fix this there needs to be a patch that removes
>> -DG_DISABLE_DEPRECATED from every Makefile.am.

> patch? sed! :)

Did that and it seems to work -- thanks!

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



