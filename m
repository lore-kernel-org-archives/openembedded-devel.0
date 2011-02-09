Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnBaI-0004mr-MO
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:03:58 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PnBZH-00007i-0q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 07:02:55 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 07:02:53 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 08:02:53 -0700
Message-ID: <4D52AC99.1030202@mentor.com>
Date: Wed, 09 Feb 2011 08:02:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>	<4D4C1986.8090908@dresearch.de>
	<4D52472F.3010305@dresearch.de>
In-Reply-To: <4D52472F.3010305@dresearch.de>
X-OriginalArrivalTime: 09 Feb 2011 15:02:53.0873 (UTC)
	FILETIME=[6D760210:01CBC86A]
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Wed, 09 Feb 2011 15:03:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 12:50 AM, Steffen Sledz wrote:
> Am 04.02.2011 16:21, schrieb Steffen Sledz:
>> On 02/04/2011 02:08 PM, Cliff Brake wrote:
>>> master has been merged to testing-next and is ready for clean builds.
>>
>> My first try with the new branch and minimal-image failed configuring libtool-native-2.2.6b-r28.1 with a perl version mismatch error (see attached log). :(
>>
>> Build Configuration:
>> BB_VERSION        = "1.10.2"
>> METADATA_BRANCH   = "testing-next"
>> METADATA_REVISION = "f06b04c"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "hipox"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "2010.7-test-20110204"
>> TARGET_FPU        = "soft"
>>
>> openSUSE 11.3 32-bit
>
> Ping!

Have you tried current for anything?  Martin fixed this problem shortly 
after the tag I believe.

-- 
Tom Rini
Mentor Graphics Corporation


