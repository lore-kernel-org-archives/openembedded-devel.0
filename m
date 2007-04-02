Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HYIkb-0000cG-OJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 11:22:57 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 96C9B28C012; Mon,  2 Apr 2007 11:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180143221.adsl.alicedsl.de [85.180.143.221])
	by srv043.dedi23.de (Postfix) with ESMTP id 33D1628C011
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2007 11:15:53 +0200 (CEST)
Date: Mon, 2 Apr 2007 11:22:57 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1308675383.20070402112257@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1HVVtt-0007Xk-Tg@linuxtogo.org>
References: <E1HVVtt-0007Xk-Tg@linuxtogo.org>
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
X-List-Received-Date: Mon, 02 Apr 2007 09:22:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> zaurus-clamshell: Fix jffs2 commandline, enable lzo compression

Richard, if you have a minute, could you summarize the benefits of
using LZO and what I need to tweak to enable it for a device (i.e.
fic-gta01)

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



