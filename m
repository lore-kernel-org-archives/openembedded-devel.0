Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrbR4-0006or-BT
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:28:42 +0100
Received: by pxi17 with SMTP id 17so154839pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 11:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=z8b5WFjTda+Lk1hTs+V/ry3Hh6WIJRKAc7dzvmBJabs=;
	b=ERAtqGusb6JGJwigstQd3J+Sxs+f59r8mZPivpr+rY9r1G8h1Rmb91riIN6qN444NP
	Xtdy5f+b83GvaM8p5ftDjBOx/auQl52SSiyuW65PewZy+QaHebooAHkVjUVxKKIBaziB
	UJukaqC6vbRGjdajPyoXtMipS8S+Rxyez3BNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=cNpXBRurze1ROejiMYGgoADoN9RSTgzy+vMzbzYKvdKISdV3cc97c5SZBZHSkKTHZf
	2gypSGraC86dHL7klURiZ4zEX0ErWC7IFOTEodlRZR+4sX57j1feVO6KDUU9GLitoOn+
	fuokVgyh71nU6/LoexUmA10LveAYJDOlcw010=
Received: by 10.142.187.14 with SMTP id k14mr1471684wff.117.1298316442625;
	Mon, 21 Feb 2011 11:27:22 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o11sm8103564wfa.12.2011.02.21.11.27.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 11:27:21 -0800 (PST)
Date: Mon, 21 Feb 2011 11:27:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110221192729.GE10070@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=7va_AHVV0zYoPqPf2dFUS4QrLMVCW7iYMr_dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=7va_AHVV0zYoPqPf2dFUS4QrLMVCW7iYMr_dg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Please mention "why" in the commit messages
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
X-List-Received-Date: Mon, 21 Feb 2011 19:28:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/11 14:11), Leon Woestenberg wrote:
> Hello all,
> 
> I am continuously running into build errors that relate to recent
> commits and I try to find fixes for them.
> 
> However, the trend is that recent commit messages do not always tell
> _why_ the change was needed., i.e. what does the commit solve?
> 
> Therefore, a kind request to summarize this in your commits:
> 
> 1) tell _what_ has changed.
> 2) tell _why_ is has changed, i.e. what does the commit solve?
> 

pretty much if we follow the commit log policy we will get good
commit log history.

> 
> Regards,
> -- 
> Leon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


