Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1LDQbQ-00045Z-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 22:40:16 +0100
Received: from [92.117.147.245] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1LDQWu-0002MR-GW
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 22:35:39 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2008 22:33:58 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-9-generic; KDE/4.1.2; i686; ; )
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF582@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF582@hiob.intern.dresearch.de>
MIME-Version: 1.0
Message-Id: <200812182233.58392.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.147.245
Subject: Re: Problem fetching "lite" source
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
X-List-Received-Date: Thu, 18 Dec 2008 21:40:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 18 December 2008 16:57:41 Sledz, Steffen wrote:
> I'm not sure what's wrong here.
>
> Problem in SRC_URI definiton?
> Problem with file naming of bb file?
> Bitbake bug?
>
> NOTE: Running task 345 of 526 (ID: 2,
> /opt/openembedded/packages/directfb/lite_0.9.26+cvs20070207.bb, do_fetch)

go to that file and change the 9: to a 10: in the SRC_URI... and then send a 
patch.


z.


