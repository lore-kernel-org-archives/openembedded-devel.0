Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HkJU5-0001L5-11
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 May 2007 14:35:33 +0200
Received: by wx-out-0506.google.com with SMTP id s14so380433wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2007 05:35:22 -0700 (PDT)
Received: by 10.90.83.14 with SMTP id g14mr4046257agb.1178368522566;
	Sat, 05 May 2007 05:35:22 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sat, 5 May 2007 05:35:22 -0700 (PDT)
Message-ID: <c384c5ea0705050535i1c13cc5ase333da9be4d6cf8e@mail.gmail.com>
Date: Sat, 5 May 2007 14:35:22 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <002a01c78e37$9d165360$38f21b9d@kai>
MIME-Version: 1.0
References: <002a01c78e37$9d165360$38f21b9d@kai>
Subject: Re: OE on Kontron eb425
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 May 2007 12:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Stefano,

On 5/4/07, Stefano Cailotto <cailotto@sci.univr.it> wrote:
> Hi all,
> I'm trying to build something usable for a kontron eb425 board, based on an
> intel ixp425.
> I tried to compile using a generic ixp4xxbe, but when loading, the kernel
> stops after uncompressing reporting a CRC error.
> It seems that Kontron EmbeddedLinux development kit performs something on
> the kernel before making zImage in order to load it in a specifed memory
> location.
>
There are some IXP42x users on OE, mostly for the NSLU device from
Linksys/Cisco, the Intel dev board (IXDP425) and some custom boards,
but I have not see the Kontron board yet.

With the reported problem, it would help if you understand or at least
could tell where to find the details on the boot loader.

Ideally, you would want to boot loader to be buildable from source
instead of relying on some binary on flash.

Regards,

Leon.


