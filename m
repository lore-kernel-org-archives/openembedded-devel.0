Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1MC94z-0004mo-7N
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 11:17:45 +0200
Received: from tamarin.localnet (123-192-147-94.dynamic.kbronet.com.tw
	[123.192.147.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C3F3D1B10C1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 09:09:48 +0000 (UTC)
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Jun 2009 11:08:35 +0200
User-Agent: KMail/1.11.90 (Linux/2.6.30-rc7; KDE/4.2.85; i686; ; )
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
	<200906040644.46800.zecke@selfish.org>
	<E1863E56-343C-41E8-8E9E-2E911CD12F39@mac.com>
In-Reply-To: <E1863E56-343C-41E8-8E9E-2E911CD12F39@mac.com>
MIME-Version: 1.0
Message-Id: <200906041108.35572.zecke@selfish.org>
Subject: Re: How to fix OE missing checksum error for some	rt2570-k2wrlz recipe
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
X-List-Received-Date: Thu, 04 Jun 2009 09:17:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 04 June 2009 07:40:12 Elvis Dowson wrote:
> Hi Holger,
> 			Thanks for the tip.
>
> Here is what I can see in my tmp/checksums.ini.
>
> [http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz
>2 ]
> md5=21f6e873ad7ee34843dbcd1204f9eda3
> sha256=5b2d382504d0aee14cf24f0eb3c483a79c712f8aa1ca027a7d4425891f1bb2ec

Please send a patch, it is more easy to apply, it will be recorded by 
patchwork and will not fall through the cracks.

z.


