Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HWFcw-0005Sb-12
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 19:38:34 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4B17F28C014; Tue, 27 Mar 2007 19:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL 
	autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180156197.adsl.alicedsl.de [85.180.156.197])
	by srv043.dedi23.de (Postfix) with ESMTP id BE59228C013
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 19:31:39 +0200 (CEST)
Date: Tue, 27 Mar 2007 19:38:32 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1935312299.20070327193832@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4608D065.3060205@whitby.id.au>
References: <4608D065.3060205@whitby.id.au>
MIME-Version: 1.0
Subject: Re: Alternatives handling for cpio (cpio vs busybox)
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
X-List-Received-Date: Tue, 27 Mar 2007 17:38:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I propose to change the cpio package such that it installs cpio in /bin
> instead of /usr/bin, and then uses update-alternatives to select it
> ahead of busybox.

> Any objections?

Nope, sounds good.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



