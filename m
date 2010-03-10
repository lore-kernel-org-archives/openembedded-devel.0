Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NpPcA-000771-Dw
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 18:22:39 +0100
Received: by gye5 with SMTP id 5so627191gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=XHF6XFed5VOJHrQMy2226XnV9w1w1UbG5/4BjxfleOM=;
	b=VG85AMMnhP1H4kqqrC5Ybq/GPOouMTvANpchW8KiTRkLBGwjhM7kdPzlVh5ZTqbyOU
	URTdSvNTkoQ/U6QmJzAC9edtKuUg1Ra61cjFw1KHkXePGLdWlbJ54SzvJo4Mc79t3xYM
	nQRP0Q4DBR1c0wXwsf11r4r4XTNSldcflXvac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NZDvInP0REH3mY2ppzax0LjntYMWpYXU+gLEbT0H5HSgu31DvS2mZwEvQ2+3bsc0Nc
	muDgtXokJZhrhMvxNgMKAQkyBaE2aFq0Hzx/aspm22/BizgXDtaQfNeIiwvtWv7HfBS3
	LY6naKEvxr07XJmKWjJKSsk6++brulKkNzd28=
MIME-Version: 1.0
Received: by 10.90.42.18 with SMTP id p18mr1931527agp.88.1268241575439; Wed, 
	10 Mar 2010 09:19:35 -0800 (PST)
In-Reply-To: <4B97C28F.2020609@dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A505AE79@exchange.intern.dresearch.de>
	<4B97C28F.2020609@dresearch.de>
Date: Wed, 10 Mar 2010 11:19:35 -0600
Message-ID: <d1ded4381003100919y125959b5m3198c8d848661187@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Where are my patches?
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
X-List-Received-Date: Wed, 10 Mar 2010 17:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm also experience some problems with patchwork queue at my home network
simple the patchs
don't reach oe-patchwork and from school network it does, that's why there
was previous duplication
of the last patches that I send.
I'm following [1] to config my send email options

[1]
http://git.wiki.kernel.org/index.php/GitTips#Using_gmail_to_send_your_patches

<http://git.wiki.kernel.org/index.php/GitTips#Using_gmail_to_send_your_patches>I
also try in my home network to open the port for smtp, disable the firewalls
(dsl modem, and Fedora's firewall)
But still patch's don't reach oe-patchwork.

Any advise?

On Wed, Mar 10, 2010 at 10:02 AM, Steffen Sledz <sledz@dresearch.de> wrote:

> Sledz, Steffen wrote:
> > Once again i miss a patch proposal of mine in the patch queue. :(
> >
> > It is this one: <
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/30654/focus=30656
> >
> >
> > Is there something wrong with it? Am i somehow blacklistet?
>
> And once again: <
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/30654/focus=30823>
> :(
>
> Can please someone have a look at this. It is really
> inconvenient to work together on a patch over the mailing list only.
>
> Steffen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

