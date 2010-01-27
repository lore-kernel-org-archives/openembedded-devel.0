Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Na7do-0008Hr-Uy
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 14:09:08 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id F35B416605B8; Wed, 27 Jan 2010 06:06:41 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id D5DE516603C1;
	Wed, 27 Jan 2010 06:06:41 -0700 (MST)
Message-ID: <4B603A61.9020001@mlbassoc.com>
Date: Wed, 27 Jan 2010 06:06:41 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20100122 Shredder/3.2a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B60398C.4080605@gmail.com>
In-Reply-To: <4B60398C.4080605@gmail.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Alex <baggerml@gmail.com>
Subject: Re: kernel booting and params
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
X-List-Received-Date: Wed, 27 Jan 2010 13:09:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2010 06:03 AM, Alex wrote:
> Hello everyone!
>
> Trying to find information about kernel booting gave me nothing so I decided to write here.
>
> The question is: how does linux kernel know where to get its parameters' string? To be more precise, what actions in general should a linux bootloader do to tell the kernel its
> params and boot it?
>
> Maybe someone knows where to find an information about it?
>
> Exploring the sources of GRUB seemed hard to me to understand...

This process is different for every architecture (x86, arm, powerpc, ...)

What platform(s) are you trying to understand?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


