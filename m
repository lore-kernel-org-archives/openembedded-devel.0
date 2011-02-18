Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PqVPr-0001YX-0y
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 19:50:55 +0100
Received: from [192.168.1.128] (95-90-73-27-dynip.superkabel.de [95.90.73.27])
	by dd20204.kasserver.com (Postfix) with ESMTP id 085F01805A1CE;
	Fri, 18 Feb 2011 19:49:42 +0100 (CET)
Message-ID: <4D5EBF16.5040602@opensimpad.org>
Date: Fri, 18 Feb 2011 19:48:54 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com> <4D5D9706.80504@opensimpad.org>
	<AANLkTin27UL+v4PxngkBc94RN3Ni9QpRzogof74cek_W@mail.gmail.com>
In-Reply-To: <AANLkTin27UL+v4PxngkBc94RN3Ni9QpRzogof74cek_W@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Feb 2011 18:50:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.02.2011 23:35, Khem Raj wrote:
> On Thu, Feb 17, 2011 at 1:45 PM, Bernhard Guillon
> <Bernhard.Guillon@opensimpad.org>  wrote:
>
>> Hi,
>> I just build a console-image and it booted fine on my atngw100.
> great so you can try avr stuff. I see that avr now supports gcc 4.4
> and binutils 2.20.1
> would you test if toolchain was upgrade (ofcource after release)
>

Yes, please send me a reminder after the upgrade.


>> I had one issue with libpam. Libpam requires libprelude and libprelude=
 did
>> not build for me (see log attached). I added --disable-prelude to
> this error seems to be gcc related to me. Somehow C++ header inclusion
> is not ok it seems
>

Hm, yes I will try to dig deeper next week if time permits :/


Best regards
Bernhard



