Received: from [203.8.2.122] (helo=mail.einfosolutions.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Richard.How@einfosolutions.com>) id 1GmKfw-0004P4-MK
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Nov 2006 02:43:53 +0100
Received: from Ubiquitous.localnet ([203.8.2.80] RDNS failed) by
	mail.einfosolutions.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 21 Nov 2006 12:16:16 +1030
Date: Tue, 21 Nov 2006 12:10:36 +1030
From: Richard How <Richard.How@einfosolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20061121121036.51999b8a.Richard.How@einfosolutions.com>
In-Reply-To: <45619EA0.2090801@kernelconcepts.de>
References: <45619EA0.2090801@kernelconcepts.de>
X-Mailer: Sylpheed version 2.2.10 (GTK+ 2.6.10; i686-pc-linux-gnu)
Mime-Version: 1.0
X-OriginalArrivalTime: 21 Nov 2006 01:46:16.0203 (UTC)
	FILETIME=[D5439DB0:01C70D0E]
Subject: Re: MIPS32 big endian support?
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
X-List-Received-Date: Tue, 21 Nov 2006 01:43:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Nov 2006 13:25:04 +0100
Nils Faerber <nils.faerber@kernelconcepts.de> wrote:

> Hi!
> Has anyone already experience with OE and MIPS32 big endian configurations?
> I have a board here which runs big endian for which I might want to
> create a config for toolchain (SDK) and distribution...
> 
> So if anyone has tried that already I would be happy to read a " yes,
> works like a charm!" ;)
> 
> Cheers
>   nils faerber

Hi Nils, works like a charm :) I have MIPS32 big endian development board
and have succeeded with bitbake meta-gpe, FBReader, sylpheed and
epdfview. Still awaiting full size screen and touch panel so I can't test
thoroughly yet, but I have ssh-ed to the board and run GPE apps
successfully.

Regards

Richard


