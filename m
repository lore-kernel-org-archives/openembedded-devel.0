Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JNpuD-0007qC-DW
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2008 14:38:09 +0100
Received: by ug-out-1314.google.com with SMTP id i24so60977ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2008 05:38:23 -0800 (PST)
Received: by 10.67.24.11 with SMTP id b11mr6696453ugj.2.1202564303166;
	Sat, 09 Feb 2008 05:38:23 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.196])
	by mx.google.com with ESMTPS id 27sm1780877ugp.19.2008.02.09.05.38.21
	(version=SSLv3 cipher=OTHER); Sat, 09 Feb 2008 05:38:22 -0800 (PST)
Date: Sat, 9 Feb 2008 15:40:53 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080209154053.5904037f@widy.localdomain>
In-Reply-To: <47ADA3F2.1000500@gmail.com>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz>
	<47A2D217.7070000@gmail.com> <1202075839.17746.11.camel@utx.utx.cz>
	<47ADA3F2.1000500@gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [patch commit request] kdrive xserver:	support	for	key codes 128-255
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
X-List-Received-Date: Sat, 09 Feb 2008 13:38:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 09 Feb 2008 07:00:34 -0600
Junqian Gordon Xu <xjqian@gmail.com> wrote:

> On 02/03/2008 03:57 PM, Stanislav Brabec wrote:
> > Junqian Gordon Xu wrote:
> >> On 01/30/2008 06:13 AM, Stanislav Brabec wrote:
> >>>> Paul Sokolovsky wrote:
> >>>> Can you please elaborate what the application of this patch
> >>>> would mean for OE (besides fixing support for one specific
> >>>> obscure peripheral)? 
> >> I guess I probably would be yelled at for not raising this before 
> >> committing your patch.
> >>
> >> Is this patch specific to Zaurus clamshells, akita/spitz/c7x0? In
> >> other words, are there any other devices benifiting from the
> >> extended keycode. I vaguely remember Dmitry asked about extended
> >> keycode for tosa, but I'm not sure he's talking about the same
> >> thing.
> > 
> > No. It adds support for key codes 128-255 in general.
> 
> I understand this patch is general. But could you educate me that
> except for the Z clamshells, what's the use case for other devices? I
> guess my question is more in line with Paul's challenge. Is this
> patch just a why-not for other devices or something might be helpful?

Something which might be helpful. What exactly do you want to know, or
what implications you want to make from that?

> 
> Regards
> Gordon



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


