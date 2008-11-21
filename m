Received: from [63.210.253.231] (helo=ext-cn0ut-2.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1L3Vza-0001x5-EI
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 14:24:14 +0100
Received: from int-cn0ut-2.online-age.net (int-cn0ut-2.online-age.net
	[3.159.252.71])
	by ext-cn0ut-2.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id mALDLY4g028572
	for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 08:21:34 -0500
Received: from alpmlip01.e2k.ad.ge.com (int-cn0ut-2.online-age.net
	[3.159.252.71])
	by int-cn0ut-2.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id mALDLUPI023729 for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 08:21:34 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [127.0.0.1])
	([3.138.54.81])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 21 Nov 2008 08:21:29 -0500
Message-ID: <4926B5DA.10902@gefanuc.com>
Date: Fri, 21 Nov 2008 13:21:30 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <gg6aes$5vf$1@ger.gmane.org>
In-Reply-To: <gg6aes$5vf$1@ger.gmane.org>
Subject: Re: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 13:24:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Maybe that is a bit unclear since it implies that packages/ is clear of 
> distro files, which it isn't. Attached is the full version of the 
> welcome message so people can suggest improvements.
> 

How about:

s/monotone/git/ ?

Martyn


