Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQln-0007cP-BP
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:05:21 +0200
Received: by pxi14 with SMTP id 14so872669pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nQW1O+bTc9kU4MckvuHwwqz13S/apCCBTI8Rd4CIum0=;
	b=SH7y1YXZtVTIXnZWagkYio+yGJbbYd4ugQVzZrl9KxDErXCzDLTD5O2PNohCsvn3Ci
	40A9tG1wHeSZX+FHOtPEKzXuJmPXnO/FyESbl6FUTQJwSqKwT/1wTwCfBY5CnPh/+tQG
	kCpOsPcDS+HZjUFEHy7urDRPSt3rlyGZ26CB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WgRB6sA/WpFVItfn01jTKWMrhbZEn+xlcHoW6lSBClCPa47MnaHcQIg/r3lw8ywbIv
	psUu6gpZAdWDoVSiIm8LyTbqFn9x0IrisNr7DFT9B4SHoH4SCOhRw1xiEZ4XX9URVvLS
	2C/u9kZQ294innr8Il71bIzN8TXj9Vifk75oc=
Received: by 10.140.57.16 with SMTP id f16mr11340073rva.15.1275872427206;
	Sun, 06 Jun 2010 18:00:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b12sm4146591rvn.22.2010.06.06.18.00.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:00:26 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:00:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607010028.GB6723@gmail.com>
References: <alpine.DEB.2.00.1006050308120.10201@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1006050308120.10201@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Some simple updates in OE manual, reference chapter.
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
X-List-Received-Date: Mon, 07 Jun 2010 01:05:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/06/10 03:11), Robert P. J. Day wrote:
> 
> Obvious fixes:
> 
> "recipies" -> "recipes"
> Update references to patch= and pnum= to striplevel=
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

thanks applied with formatting changes to patch log.


