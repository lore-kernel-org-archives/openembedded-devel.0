Received: from maild.rambler.ru ([81.19.66.33])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NVLyu-0000kA-MF
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 10:27:11 +0100
Received: from [192.168.0.100] (unknown [109.86.169.209])
	(Authenticated sender: alexondi@rambler.ru)
	by maild.rambler.ru (Postfix) with ESMTP id B49A084444
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 12:24:56 +0300 (MSK)
Message-ID: <4B4EE2DA.5080106@rambler.ru>
Date: Thu, 14 Jan 2010 11:24:42 +0200
From: Perepelica Alexander <alexondi@rambler.ru>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; ru;
	rv:1.9.1.5) Gecko/20091204 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>
	<4B4EDCED.6000107@gefanuc.com>
In-Reply-To: <4B4EDCED.6000107@gefanuc.com>
X-SA-Exim-Connect-IP: 81.19.66.33
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Thu, 14 Jan 2010 09:27:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

When I try boot image in qemu I see
booting kernel ... and nothing.


14.01.2010 10:59, Martyn Welch =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Perepelica Alexander wrote:
>   =20
>> Thank you, Martyn!
>> I remove my changes from linux_2.6.32+2.6.33-rc3.bb and I build was
>> successful but don't boot with image :(  - all hangs
>>     =20
> At what point does it hang?
>
> At a guess (as you haven't provided any specifics) I'd guess that you
> need to look at the kernel configuration.
>
> Martyn
>
>   =20



