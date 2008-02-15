Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <zecke@selfish.org>) id 1JQ4sL-0003FF-8P
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 19:01:35 +0100
Received: from [212.23.103.104] (helo=[10.161.166.94])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JQ4s0-0001RQ-Qk
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 19:01:11 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2008 19:00:54 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20080118.763038)
References: <foteat$i6s$1@ger.gmane.org>
In-Reply-To: <foteat$i6s$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200802151900.54425.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.104
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] push those patches, push'em up
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
X-List-Received-Date: Fri, 15 Feb 2008 18:01:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 13 February 2008 01:41:02 Rolf Leggewie wrote:
> Hi,
>
> OE has quite many patches that are just too valuable to keep to
> ourselves.  In the spirit of our bug sprint weekends, I want to propose
> patch-pushing weekends.  Maybe we can even replace the former with the
> latter.  I'd like to propose the coming weekend as the first of this kind.
>
> To get everybody on the same page and to make sure this is a sustainable
>  effort, I'd also like to propose some soft policy for patches committed
> to OE.  This should help us quickly find those patches still in need of
> some pushing.
>
>  1) first line in a patch starts with upstream: and goes on to list the
>     URL where the bug has been reported upstream.
>  2) further information can optionally be listed in the following fields
>     * status: pending, accepted in XXX, rejected
>     * origin: where the patch has been stolen ;-)
>     * comment: any further detail such as description or reason for
>                application of the patch
>
> Comments?  Volunteers to join the cause?

Hi,
I think we should make the patch header mandantory for new patches and it 
should state:
	-The issue it is fixing and why it is fixing it (comment:)
	-The status: as above, or 'HACK' to mark a patch as such
	-The origin where we got this patch from and then write in the comment if you 
	  change the patch.
	-And if the bug has been filed add the bug URL to the patch as this makes 
	  tracking easy.

I will start doing so.

z.


