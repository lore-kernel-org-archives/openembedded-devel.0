Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IHaOY-0004Ge-7x
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 09:19:22 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id B161828C013; Sun,  5 Aug 2007 09:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180178174.adsl.alicedsl.de [85.180.178.174])
	by srv043.dedi23.de (Postfix) with ESMTP id F14CE28C012
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 09:14:49 +0200 (CEST)
Date: Sun, 5 Aug 2007 09:17:03 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <418763640.20070805091703@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <026901c7d72c$8a05b070$6e01a8c0@twilight>
References: <46B1753D.1090507@dominion.kabel.utwente.nl><46B1B6DB.6020603@klever.net><1186053831.5972.222.camel@hammer.suse.cz><46B1C71F.2090608@klever.net><1186058282.5972.232.camel@hammer.suse.cz><46B1D0DA.5030905@balister.org><1186061255.5972.243.camel@hammer.suse.cz><46B1E063.7010407@dominion.kabel.utwente.nl>
	<1974151763.20070805075508@vanille-media.de>
	<026901c7d72c$8a05b070$6e01a8c0@twilight>
MIME-Version: 1.0
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Sun, 05 Aug 2007 07:19:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> ----- Original Message ----- 
> From: "Dr. Michael Lauer" <mickey@vanille-media.de>
> To: <openembedded-devel@lists.openembedded.org>
> Sent: Sunday, August 05, 2007 12:55 AM
> Subject: Re: [oe] Gstreamer and rpath


>>  > No. We have a gcc-cross_3.3.3.bb and 3.3.4
>> 
>> I wouldn't mind deprecating these two.

> 3.3.4 is still in use, if only in a maintenance mode.

Can't we backport the sysroot patch?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



