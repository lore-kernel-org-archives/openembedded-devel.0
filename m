Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N5bCT-0001Jy-Vr
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 09:26:45 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 8A0DD1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 08:35:42 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Nov 2009 09:25:09 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.0911040306440.17282@localhost>
In-Reply-To: <alpine.LFD.2.00.0911040306440.17282@localhost>
MIME-Version: 1.0
Message-Id: <200911040925.10074.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Aesthetic fix in chapter 1.
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
X-List-Received-Date: Wed, 04 Nov 2009 08:26:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 04 November 2009 09:09:17 Robert P. J. Day wrote:
> A simple tidy of a comma-separated list in Chapter 1.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>



> 
> ---
> 
>   first in a list of patches to fix aesthetic stuff in user manual --
> this patch is as trivial as it gets, but i would prefer to do this a
> chapter at a time, if i might.  i promise that future patches will be
> more substantive, but still be logically self-contained.
> 
>   is this the right format for submitting patches?  i'm just stealing
> from the format for kernel patches.
> 
> 
> diff --git a/docs/usermanual/chapters/introduction.xml
>  b/docs/usermanual/chapters/introduction.xml index 31f1f1f..28e7725 100644
> --- a/docs/usermanual/chapters/introduction.xml
> +++ b/docs/usermanual/chapters/introduction.xml
> @@ -30,7 +30,7 @@
>          </listitem>
> 
>          <listitem>
> -          <para>Must be able to emit packages (tar, rpm, deb,ipk)</para>
> +          <para>Must be able to emit packages (tar, rpm, deb, ipk)</para>
>          </listitem>
> 
>          <listitem>
> 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


