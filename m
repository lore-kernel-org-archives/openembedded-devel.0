Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <wohauser@gmx.de>) id 1PjwXQ-0005lH-6N
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 17:23:37 +0100
Received: (qmail invoked by alias); 31 Jan 2011 16:22:35 -0000
Received: from p549CCC6F.dip.t-dialin.net (EHLO [192.168.3.102])
	[84.156.204.111]
	by mail.gmx.net (mp045) with SMTP; 31 Jan 2011 17:22:35 +0100
X-Authenticated: #656260
X-Provags-ID: V01U2FsdGVkX18R4MhfZuARGJk/GCASObAYjrPz90aOlp605gj4R/
	WjP1uxYBmTzgtG
Message-ID: <4D46E1C6.8030309@gmx.de>
Date: Mon, 31 Jan 2011 17:22:30 +0100
From: Wolfgang Hauser <wohauser@gmx.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de-AT;
	rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D46CADB.9010003@gmx.de> <ii6ipn$13o$1@dough.gmane.org>
In-Reply-To: <ii6ipn$13o$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
Subject: Re: libgles-omap3 which kernel could be used for omap3 ?
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
X-List-Received-Date: Mon, 31 Jan 2011 16:23:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

We need the powervr drivers for a mistral omap3evm board to be able to
use qt4-embedded-gles_4.6.2 or 4.6.3 with the latest compatible kernel
version.

currently we use

omap3evm
angstrom (2008)

libgles-omap3_3.01.00.06.bb
omap3-sgx-modules_1.4.14.2616.bb
ti-cgt6x_6.1.9.bb
linux-omap-psp_2.6.32.bb

What kernel the newest powervr drivers (and the according development
tools) depend on ?

Regards
Wolfgang

Koen Kooi schrieb:
> On 31-01-11 15:44, Wolfgang Hauser wrote:
>> Hello, is the ti stuff
> 
> Which ti 'stuff'?
> 
>> working on the newest kernel version ?
> 
> Which kernel? Which tree? Which machine? Which recipe? Which allocator
> in the defconfig?
> 
>> Or is it still pinned to linux-omap3-psp_2.6.32 ?
> 
> Where do you see it being pinned?

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



