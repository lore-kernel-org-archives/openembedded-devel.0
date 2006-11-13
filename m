Received: from [209.191.68.207] (helo=web35013.mail.mud.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <the_kiennd@yahoo.com.vn>) id 1GjbP5-00041c-Nu
	for openembedded-devel@openembedded.org; Mon, 13 Nov 2006 13:59:12 +0100
Received: (qmail 36364 invoked by uid 60001); 13 Nov 2006 12:57:12 -0000
Message-ID: <20061113125712.36362.qmail@web35013.mail.mud.yahoo.com>
Received: from [222.252.87.250] by web35013.mail.mud.yahoo.com via HTTP;
	Mon, 13 Nov 2006 19:57:12 ICT
Date: Mon, 13 Nov 2006 19:57:12 +0700 (ICT)
From: Nguyen Kien <the_kiennd@yahoo.com.vn>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: What distro for ixp425
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
X-List-Received-Date: Mon, 13 Nov 2006 12:59:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

My group is developing a smart router with Intel IXP425 XScale and I use openembedded to building a small linux system for our product. In openembedded distro conf directory, there are many distros, which distro is best for me?

I built debianslug for my nslu2 ( intel ixp4xx ) device, run ok. Is it the best choice, if i built debianslug for my product.

Thanks for your ideas!

 Hardware configuration   CPU  533 MHz  IXP425 - XScale architecture, ARM core   RAM  128 to 256 MB  SDRAM operating at 133 MHz   Primary storage  128 Mbit  Parallel flash   Secondary storage  512 MB  Optional NAND flash   LAN interface  01 Ethernet  10/100 mbps   WAN interface  04 Ethernet  10/100 mbps   General purpose interface  01 USB  USB v1.1 - may attaches additional storage   Peripheral bus  01 PCI  Mini PCI 33MHz   Console interface  01 RS-232  115200 8N1   Display  5x7 led + various leds  5x7 3 color led panel   Peripheral  01 Microcontroller  8 bit AVR   Miscellaneous  ICE JTAG, 8bit DIP switch, Battery backed RTC
http://ftd.routeskeeper.com

Nguyen Duy Kien 
System Engineer Department 
FPT Communications center, FPT Telecom 
 
Email: kiennd@gmail.com 
Tel: 04.760.1060 (ext: 4252) 
Mobile: 84-989 255 660 
48 Van Bao (2B Van Phuc Diplomatic Compound), 
Kim Ma Str., Badinh District, Hanoi, Vietnam 
Tel: 04.760.1060 
Fax: 04.822.3111 
Http:// www.fpt.net
 		
---------------------------------
Hãy ghé qua trang chủ Yahoo! Việt Nam!
From nils.faerber@kernelconcepts.de Mon Nov 13 17:18:35 2006
Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1GjeW3-0008TB-Qn
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 17:18:35 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gjezm-00070U-HU
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 17:49:18 +0100
Message-ID: <45589A63.9030808@kernelconcepts.de>
Date: Mon, 13 Nov 2006 17:16:35 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
Organization: kernel concepts
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>
	<45586AF5.8060800@kernelconcepts.de>
In-Reply-To: <45586AF5.8060800@kernelconcepts.de>
X-Enigmail-Version: 0.94.0.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [oe] ARM EABI SDK build
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
X-List-Received-Date: Mon, 13 Nov 2006 16:18:35 -0000

Florian Boor schrieb:
> Hi,

Hi!

> Nils Faerber schrieb:
>> The first problem I stepped over is that gcc4-build-sdk.inc still has
>> the line
>>
>> SRC_URI += 'file://602-sdk-libstdc++-includes.patch;patch=1'
>>
>> or in fact without the 602- prefix. But this patch is already included
>> in the gcc_4.1.1.bb. So I commented that out.
> 
> this seems to be fixed now, i get a different message:
> 
> NOTE: Applying patch '300-libstdc++-pic.patch'
> ERROR: Error in executing:
> /home/fuchs/Projekte/oe/dev/packages/gcc/gcc-cross-sdk_4.1.1.bb
> ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
> Patch headers differ:
> @@ -1,4 +1,2 @@
>  # DP: Build and install libstdc++_pic.a library.
> 
> Sounds like a broken patch to me.
> I use bitbake 1.6.2 and the up to date stuff from org.openembedded.dev
> (9c4dc2162967f7102e29135dc8da502dd80d01ac).
> 
> The full error message is attached...

I'll try the update now too.

I forgot to report: "file_4.16.bb"  and "file-native-4.16.bb" need to be
updated since the server does not carry 4.16 anmore - only 4.17 and 4.18.

> Greetings
> 
> Florian
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--


