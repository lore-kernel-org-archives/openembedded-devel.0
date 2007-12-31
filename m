Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1J9R4M-0006Bz-K8
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2007 21:17:06 +0100
Received: from PROMETHEUS (e180148071.adsl.alicedsl.de [85.180.148.71])
	by drlauer-research.com (Postfix) with ESMTP id 2EA19584C1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2007 21:12:05 +0100 (CET)
Date: Mon, 31 Dec 2007 21:10:45 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1653907704.20071231211045@vanille-media.de>
To: Marcin Juszkiewicz <openembedded-devel@lists.openembedded.org>
In-Reply-To: <200712281208.44069.openembedded@haerwu.biz>
References: <4774C182.20501@gmail.com>
	<200712281208.44069.openembedded@haerwu.biz>
MIME-Version: 1.0
Subject: Re: Tosa kernel bloat
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
X-List-Received-Date: Mon, 31 Dec 2007 20:17:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>> Tosa kernel is bloated with the recent patch and change to
>> defconfig-tosa
>>
>> |`/home/gordon/oe/build/tmp/work/tosa-angstrom-linux-gnueabi/linux-rp-2
>> |.6.23-r14/linux-2.6.23' Size is 1296464
>> | FATAL: This kernel is too big for your PXA Zaurus and will destroy
>>
>> data if you flash it. Please reduce the size of the kernel by making
>> more of it modular.

> Same on Poodle:
> | make[1]: Leaving directory
> `/home/hrw/devel/build/angstrom/tmp/work/poodle-angstrom-linux-gnueabi/linux-rp-2.6.23-r14/linux-2.6.23'
> | Size is 1306384
> | FATAL: This kernel is too big for your PXA Zaurus and will destroy data
> if you flash it. Please reduce the size of the kernel by making more of
> it modular.

I vaguely remember that the host toolset has an influence on that. Do
you remember where the same kernel compiled ok for Richard but other
guys got the too-big error? Did we ever found the actual cause of
that?

:M:




