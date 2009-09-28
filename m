Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MsOq5-0006En-Gi
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 00:37:04 +0200
Received: by bwz26 with SMTP id 26so449826bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=PZpOg0jct6g1hvHk5Z6B/5rTvKqFlnRrLL2aJCN/xwc=;
	b=DeCIVTXRSxWGPqKfXg8X4VHbl716zJ8KlGFpWktubuNnsVG2oktGN4GUZlrf7PF04N
	mRLj6vhM+4Q7p9qnPoovXsbGjtuNbcXaWXn6meau8M7WgyP2CRO8aP+I9mhDDliXcnfg
	vHYzJ3PhyMFLH4gfNsvMwV0D6twwvGI6B0zr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ii+C9QKtTvbX5PwOvtJaLQZdL2VPW/crA+4S/g4om0pg00dSIR4CtF1ygcn7UfwIfL
	/tb1kagiR7zw43e+cFwODlw6Ev0cEFk2zpNG2lMxFtDoJ5g86eRUxgj2HnSZAzig+ytG
	k1bMwVw1eCc8UAIWtCkbjSUt8L3zToTd3tO0k=
MIME-Version: 1.0
Received: by 10.239.184.168 with SMTP id y40mr348659hbg.194.1254177378658; 
	Mon, 28 Sep 2009 15:36:18 -0700 (PDT)
In-Reply-To: <87y6nyohc5.wl%peter@chubb.wattle.id.au>
References: <c384c5ea0909281321k660c9ad5s154817574b54157@mail.gmail.com>
	<87zl8eok2w.wl%peter@chubb.wattle.id.au>
	<c384c5ea0909281449t2d40e28eod35e869d77713239@mail.gmail.com>
	<87y6nyohc5.wl%peter@chubb.wattle.id.au>
Date: Tue, 29 Sep 2009 00:36:18 +0200
Message-ID: <c384c5ea0909281536q6bd71a99j2641586ff370f326@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x86->x86 GRUB bootable image in OE?
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
X-List-Received-Date: Mon, 28 Sep 2009 22:37:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Peter,

On Tue, Sep 29, 2009 at 12:05 AM, Peter Chubb <peter.chubb@nicta.com.au> wrote:

> Leon> Do you maybe still have any recipe that at least stages grub for
> Leon> the host?
>
> I have one at work --- I'll send it off when I get there.
>
Tops.

I'll buy you a beer when I'm Down Under -- ...It's just, don't wait for that :-)

Regards,
-- 
Leon


