Received: from [212.227.126.174] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1JecaO-0006Jr-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Mar 2008 21:51:04 +0100
Received: from [10.0.0.200] (Ma6d5.m.pppool.de [89.49.166.213])
	by mrelayeu.kundenserver.de (node=mrelayeu4) with ESMTP (Nemesis)
	id 0ML21M-1JecaA3hJd-0003kd; Wed, 26 Mar 2008 21:51:00 +0100
Message-ID: <47EAB72A.6000801@linuxdevelopment.de>
Date: Wed, 26 Mar 2008 21:50:50 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080226)
MIME-Version: 1.0
To: Geoffrey Wossum <geoffrey@pager.net>
References: <47E7757A.6080807@linuxdevelopment.de>
	<47E8D99B.8060701@linuxdevelopment.de>
	<200803250855.45366.geoffrey@pager.net>
	<200803261336.38640.geoffrey@pager.net>
In-Reply-To: <200803261336.38640.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
X-Provags-ID: V01U2FsdGVkX19wqcZStwXSQHimHOSd0WvQFd1M3aulJqVwC9U
	GOpqVPG3cPJ8/YuXrwV8BNmoYn0KqbsmOBO/rDSTlRB884GiEv
	0A9s8ZsqiYxqfIcqqOVA0WWrQbJBWjdcQ/BGFykyVc=
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
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
X-List-Received-Date: Wed, 26 Mar 2008 20:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


> On Tuesday 25 March 2008 08:55:45 am Geoffrey Wossum wrote:
>> On Tuesday 25 March 2008 05:53:15 am Robert Wörle wrote:
> 
>> I think I submitted a patch to OE for the bzero() problem.  I know I
>> submitted it to the uClibc mailing list, and it was picked up by the Atmel
>> guy working on the port.  I'll put at the bottom of this email so you can
>> check if you have it.
> 
it where not too many apps that still use bzero() .. google told me that 
using memset() is the better way. One should ping those apps ups
tream  and let them change that ( if its truly the "more standard (c)" way )

> I submitted the actual patch to uClibc, but I must not have submitted the 
> patch that makes the patch get used :)  But I've submitted that now.
that sounds complicated ;-)



So far the rest of the chain cooks nicely. Many thanks for that work.
It still brakes on x86_64 hosts to me.
I hope i can identify this at one point.

If i have some work worth sharing i gladly help.
Until then my thanks for the community and the positive feedback from a 
"heavy user" is all i can give.

i need to prepare some custom board code which not too many might need.

Maybe i paste some howto`s to quickly connect buttons as keyboard to a 
ngw100 board.
J5 has quite some open pins which hardly no one might use for the 
beginning and gpio-key is impressively simple for that.

Rob


