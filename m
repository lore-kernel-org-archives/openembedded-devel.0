Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LXT0i-0006xG-RV
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 05:17:13 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.106]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LXSzJ-0000Vy-Dz
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 12:15:58 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200902120034.24306.mickey@vanille-media.de>
References: <1234393426.16455.67.camel@alap>
	<200902120034.24306.mickey@vanille-media.de>
Date: Wed, 11 Feb 2009 21:15:34 -0700
Message-Id: <1234412134.6572.42.camel@think-laptop>
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
Subject: Re: [patch] new gta01_config file to build devel kernels on fso milestone5 branch
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
X-List-Received-Date: Thu, 12 Feb 2009 04:17:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This defconfig was plucked from a newer kernel git rev than is being
used in milestone 5. I was hoping once we had it in the milestone 5
branch I could figure out what massaging it needed for the 2.6.8 and
devel kernels. 

If we get it to work on milestone 5 then whatever processing is
necessary should also work for the current git version.

Angus

On Thu, 2009-02-12 at 00:34 +0100, Michael 'Mickey' Lauer wrote:
> The patch looks good, but we did quite some things to be able to use upstream 
> defconfigs which we just slightly preprocess and I'd rather not start with 
> own defconfigs again for such a moving target. Can't we do the same as we do 
> with the 02 config?
> 
> :M:
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



