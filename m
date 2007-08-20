Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IN7ZH-0004tY-9s
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 15:45:19 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 522DF28C013; Mon, 20 Aug 2007 15:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180175206.adsl.alicedsl.de [85.180.175.206])
	by srv043.dedi23.de (Postfix) with ESMTP id 535AC28C012
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 15:41:34 +0200 (CEST)
Date: Mon, 20 Aug 2007 15:44:22 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <425909324.20070820154422@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200708201541.54798.openembedded@hrw.one.pl>
References: <200708201541.54798.openembedded@hrw.one.pl>
MIME-Version: 1.0
Subject: Re: QEmu update from Poky
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
X-List-Received-Date: Mon, 20 Aug 2007 13:45:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> In Poky we use qemu 0.9+20070613 for some time. It works on i386 and amd64
> build machines and generate binary locales for ARM without problems.

> OE use old 0.8.2 version which fails on amd64. There is also 0.9+20070701
> version set as non-default and this one should work on amd64 machines 
> (but probably will fail on i386 due to lack of MAP_32BIT on this arch).

> I plan to replace old 0.8.2 and 0.9+20070701 versions by 0.9+20070613 from
> Poky to give people version which works on 32/64 machines without 
> problems. This version has also some other extras added by OH - like 
> touchscreen emulation based on USB Wacom tablet emulation.

> Any objections?

None here.


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



