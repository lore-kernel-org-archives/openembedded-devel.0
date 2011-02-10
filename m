Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnXvK-0005Io-UZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 15:55:11 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnXuE-0004Z1-Km from Tom_Rini@mentor.com ;
	Thu, 10 Feb 2011 06:54:02 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 06:54:02 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Feb 2011 07:54:01 -0700
Message-ID: <4D53FC03.6090104@mentor.com>
Date: Thu, 10 Feb 2011 07:53:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <4D51566B.9060603@mentor.com> <20110210082340.GA10554@jama>
In-Reply-To: <20110210082340.GA10554@jama>
X-OriginalArrivalTime: 10 Feb 2011 14:54:01.0423 (UTC)
	FILETIME=[5A8255F0:01CBC932]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Thu, 10 Feb 2011 14:55:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 01:23 AM, Martin Jansa wrote:
> On Tue, Feb 08, 2011 at 07:42:51AM -0700, Tom Rini wrote:
>> Hey all,
>>
>> As March is fast approaching I want to gather the list of DISTRO /
>> MACHINE / BBPKGS targets that the various distributions would like to
>> see at least compile tested (volunteers for HW testing welcome!).
>> Today, I have the following setup to be built:
>>
>> minimal / minimal-uclibc:
>> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb
>> +
>> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>>
>> angstrom-2008.1 / angstrom-2010.x:
>> hawkboard, mini2440, mini6410, beagleboard + console-image /
>> qt4-x11-demo-image / qt4e-demo-image
>>
>> slugos / ucslug:
>> nslu2be/le + slugos-image
>
> I'll try to test/build it myself, but if you have some spare cpu power
> then please add:
>
> Distro: shr
> Machine: om-gta02, nokia900
> Image: shr-image

Added.

-- 
Tom Rini
Mentor Graphics Corporation


