Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LWDxp-0007LV-2x
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Feb 2009 19:01:05 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LWDWP-0001Ji-9q
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Feb 2009 01:32:56 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gmm6d3$act$2@ger.gmane.org>
References: <1234048773.6803.17.camel@alap>  <gmm6d3$act$2@ger.gmane.org>
Date: Sun, 08 Feb 2009 10:32:37 -0700
Message-Id: <1234114357.6803.23.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: [PATCH] python-elementtree-1.2.7-20070827-preview checksums
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
X-List-Received-Date: Sun, 08 Feb 2009 18:01:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-02-08 at 09:50 +0100, Koen Kooi wrote:
> Against what tree are you generating these patches?
> 
> koen@dominion:/OE/org.openembedded.dev/packages/powervr-drivers$ grep 
> element ../../conf/checksums.ini
> [http://svn.o-hand.com/repos/web/trunk/patches/add-end-element-signal.patch]
> [http://effbot.org/media/downloads/elementtree-1.2.7-20070827-preview.zip]
> koen@dominion:/OE/org.openembedded.dev/packages/powervr-drivers$
> 
> and
> 
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8611d028e196e438097c263f416b8b89cb3ec10b
> 
> Furthermore, could you use git format patch on your patches to get some 
> more metadata on the patch?
> 
> regards,
> 
> Koen

Hi Koen,

Sorry, I thought I'd checked the org.openembedded.dev branch. These were
against the fso/milestone5 branch.

I will learn how to use git format patch.

Thanks
Angus



