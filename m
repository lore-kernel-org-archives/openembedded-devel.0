Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiIuq-00033R-AH
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 05:57:32 +0100
Received: by iakh37 with SMTP id h37so28101390iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2012 20:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VInKmIIBNLH2eiBw1F9Ifh6Gg7rW60+TVpJeflJ1NDM=;
	b=aq3IHR5ZS3rDWi2STOc8xmT4k/P7xXQ3WXIVrdsLXLuGvU6lrnoyfMg3yEBJ2cWJki
	yJc9I63UbvxTgVRqipkMWnYyx0ApEuBspwIPbXH/jGmkeh4A1siS2BRGCoN5oeD3gNSk
	qgHM2Kgv3UCRGHJbUFnKr7GtesoUa4in1LB2k=
Received: by 10.50.76.162 with SMTP id l2mr31690092igw.1.1325652610444;
	Tue, 03 Jan 2012 20:50:10 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id xu6sm48993040igb.7.2012.01.03.20.50.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 20:50:09 -0800 (PST)
Date: Tue, 3 Jan 2012 20:50:26 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120104045026.GA31275@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1619521.vnmDeKUhkM@helios>
MIME-Version: 1.0
In-Reply-To: <1619521.vnmDeKUhkM@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: OE-Core transition documentation
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
X-List-Received-Date: Wed, 04 Jan 2012 04:57:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/12/11 15:06), Paul Eggleton wrote:
> Hi all,
> 
> It seems we still haven't made an announcement on the website about the OE-
> Core transition. I did write a wiki page about it [1] but never got around to 
> linking it from the main page. What I'd like to do is the following:
> 
> 1) Add a short news entry mentioning the transition and pointing people to the 
> OE-Core page.
> 
> 2) Extend the OE-Core page to help people understand how to make the 
> transition a bit better:
>  * Describe how the mailing lists function
>  * Add info on how to add a layer to your setup
>  * More info on what should go where and what to do if something's missing
> I'm starting to wonder if this page ought to be turned into an FAQ type 
> document.

thanks for looking into it. Yes we need this badly. I think initial part
should also mention stark difference between classic oe and oe core
approach and some light on current and future then how to get started
using oe-core based approach

> 
> 3) Try to figure out how to reorganise the main page so having a link from 
> there to the layer index [2] makes sense
> 

yes that document will be relevant in this context

> Comments? Suggestions? Please let me know if you have questions about OE-Core 
> that aren't fully answered by the material already on the OE-Core / layer 
> index pages.
> 

I think we need to make more and more documents relevant meaning some of
them might need to reflect the oe-core way of doing things.

> Cheers,
> Paul
> 
> [1] http://www.openembedded.org/wiki/OpenEmbedded-Core
> [2] http://www.openembedded.org/wiki/LayerIndex
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


