Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Lfvr7-000381-Er
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Mar 2009 13:42:17 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9CE1216E002
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2009 13:51:23 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 701812A4216
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2009 13:37:40 +0100 (CET)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 7 Mar 2009 13:37:17 +0100
Message-ID: <49B26A8C.7090301@dresearch.de>
Date: Sat, 07 Mar 2009 13:37:32 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1b3pre) Gecko/20090223 Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>	<a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>	<432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
	<200903062024.13519.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903062024.13519.marcin@juszkiewicz.com.pl>
X-OriginalArrivalTime: 07 Mar 2009 12:37:17.0281 (UTC)
	FILETIME=[733BDD10:01C99F21]
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Sat, 07 Mar 2009 12:42:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 06.03.2009 20:24, schrieb Marcin Juszkiewicz:
> On Friday 06 of March 2009 19:47:58 Justin Patrin wrote:
>>> I don't kow about openSuse, but I remember that Fedora used to have
>>>   some kernel patches that did not play well with QEMU. But that was
>>>   back on Ferora 7, since then I switched to ubuntu. I don't even
>>>   rmember exactly what patch caused the problems, but IIRC it was
>>>   security related.
>> Hmmm, good point it could be SELinux. Could you try disabling that,
>> if you have it enabled?
>
> It is not SELinux but one kernel patch - linux-2.6-execshield.patch to
> be exact. Rebuild Fedora kernel without that one or use vanilla one.
>
> Took me lot of kernel rebuilds to find that out.

I've no SELinux running and i've tried the vanilla kernel. But the problem's still there. :(

# uname -a
Linux mobil-400-300 2.6.27.19-3.2-vanilla #1 SMP 2009-02-25 15:40:44 +0100 i686 i686 i386 GNU/Linux

Steffen


