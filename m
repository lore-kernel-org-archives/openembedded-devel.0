Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HRdae-0006uA-1d
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2007 01:13:08 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id B682A28C012; Thu, 15 Mar 2007 01:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from [192.168.2.128] (e180129100.adsl.alicedsl.de [85.180.129.100])
	by srv043.dedi23.de (Postfix) with ESMTP id 09AA128C011
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2007 01:06:41 +0100 (CET)
Date: Thu, 15 Mar 2007 01:13:05 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1292346040.20070315011305@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200703140032.28661.ranaldo@unina.it>
References: <200703140032.28661.ranaldo@unina.it>
MIME-Version: 1.0
Subject: Re: OE and pakage builds
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
X-List-Received-Date: Thu, 15 Mar 2007 00:13:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Nicola Ranaldo wrote:
> Hi,
> i'm trying to fix and update qt library bb, while building and rebuilding
> packages i noted they dependes on the previuos compiled packages.
> For example, if we build qt4 before glib, it is compiled without glib support.
> So it my be that with the same tree we may produce different packages.
> Is it a normal behaviour? should it be fixed?

Should be fixed. Feel free to post a patch. Please adjust packaging if
necessary (additional library or plugin).

> in some message on the list i read oe builds should be deterministic.

That's correct.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



