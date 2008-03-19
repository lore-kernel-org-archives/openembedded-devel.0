Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jc2yL-0003Qe-4U
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 19:25:14 +0100
Received: from [212.23.103.42] (helo=[10.129.170.101])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jc2yK-000887-K9
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 19:25:09 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Mar 2008 16:10:47 +0100
User-Agent: KMail/1.9.9
References: <200803182311.01445.zecke@selfish.org>
	<200803191143.05167.zecke@selfish.org> <frqri1$9l5$1@ger.gmane.org>
In-Reply-To: <frqri1$9l5$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803191610.48074.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.42
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=AWL,DATE_IN_PAST_03_06,
	RCVD_IN_BL_SPAMCOP_NET,RDNS_NONE autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The tzdata package and a bug with tzdata-dbg
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
X-List-Received-Date: Wed, 19 Mar 2008 18:25:14 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 19 March 2008 11:57:05 Koen Kooi wrote:

> It won't, unless you removed this from bitbake.conf:
>
> ALLOW_EMPTY_${PN}-dbg = "1"

eeek, thank you! I hope you merged it the right way. :)


z.


