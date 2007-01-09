Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1H4PjJ-00005V-Nb
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 23:46:05 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 833F328C012; Tue,  9 Jan 2007 23:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180135155.adsl.alicedsl.de [85.180.135.155])
	by srv043.dedi23.de (Postfix) with ESMTP id 836C428C011
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2007 23:40:16 +0100 (CET)
Date: Tue, 9 Jan 2007 23:44:16 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1104787648.20070109234416@vanille-media.de>
To: Vladislav Grinchenko <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1168376718.23671.54.camel@zorro>
References: <1168361761.23671.36.camel@zorro>
	<1562609309.20070109175743@vanille-media.de>
	<1168376718.23671.54.camel@zorro>
MIME-Version: 1.0
Subject: Re: Q: build/install gpe-image from dev branch
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
X-List-Received-Date: Tue, 09 Jan 2007 22:46:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> The thingy depends on  arm-linux-gcc-2.95 which it couldn't find?

Please take a look at the OpenZaurus wiki and/or local.conf.sample.

> So, the question is how do I tell bitbake to build only a gpe-image?

An image is a combined entity that is tightly coupled to a kernel.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



