Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HYMYs-00076X-Lu
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 15:27:06 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 0B9CA28C012; Mon,  2 Apr 2007 15:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180143221.adsl.alicedsl.de [85.180.143.221])
	by srv043.dedi23.de (Postfix) with ESMTP id 99F4928C011
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2007 15:19:58 +0200 (CEST)
Date: Mon, 2 Apr 2007 15:27:03 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1787856404.20070402152703@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1175507186.5819.16.camel@localhost.localdomain>
References: <E1HVVtt-0007Xk-Tg@linuxtogo.org>
	<1308675383.20070402112257@vanille-media.de>
	<1175507186.5819.16.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev zaurus-clamshell: Fix jffs2 commandline, enable lzo compression
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
X-List-Received-Date: Mon, 02 Apr 2007 13:27:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard, thanks for this comprehensive and detailed explanation!

I'll add a bug into the OpenMoko bugtracker that points to this mail
-- every bit of (speed)-optimization would be helpful, even at the
cost of a (slightly) larger flash consumption.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



