Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anders@chargestorm.se>) id 1PCvio-0006KJ-QI
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 15:50:56 +0100
Received: from localhost (195.84.30.88) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.106.1; Mon, 1 Nov 2010
	15:48:37 +0100
Date: Mon, 1 Nov 2010 15:48:35 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20101101144834.GA4631@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1288619281-4363-1-git-send-email-anders@chargestorm.se>
	<87lj5dp0tt.fsf@walter-nb.nord-com.it>
MIME-Version: 1.0
In-Reply-To: <87lj5dp0tt.fsf@walter-nb.nord-com.it>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-06-14)
X-GFI-SMTP-Submission: 1
X-SA-Exim-Connect-IP: 83.145.59.142
X-SA-Exim-Mail-From: anders@chargestorm.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Updated resolvconf to 1.46.
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
X-List-Received-Date: Mon, 01 Nov 2010 14:50:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Walter Franzini <walter.franzini@gmail.com> [101101 15:37]:
> Anders Darander <anders@chargestorm.se> writes:
> > 1.45 is no longer downloadable from Debian.
> >
> > Signed-off-by: Anders Darander <anders@chargestorm.se>

> While the package is no longer available in the "main" archive, it is
> still in the snapshot archive:

> http://snapshot.debian.org/package/resolvconf/1.45/

Ah, I missed that line. 
Then my download problems migth have been due to some network-related
problem with the snapshot server (or my route to it). However,
upgrading to 1.46 made it possible for me to get my build running.

/Anders

-- 
Anders Darander
ChargeStorm AB
Tel: +46 702 44 84 36
anders@chargestorm.se      www.chargestorm.se


