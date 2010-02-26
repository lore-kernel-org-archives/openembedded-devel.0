Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nl5WO-0002AJ-NN
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:06:49 +0100
Received: by fg-out-1718.google.com with SMTP id e21so85283fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 11:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KakkLBGU2tOQY1MjQwJlOjgXKtnrANEGfJ2fL111plU=;
	b=jTdc36wzMiS9/sMqJL+nabFaCY5lf8Ot1UfkmX/VHbhWE27p9+uN6wKMBzOfpAhwuL
	lXgurZgPyoU7SK3adytVJoklT/c1dGsGRkkc3h2718gdVvWgigVZ2p+mYLIk8EMVEc4s
	PlZmMVqsTvSmYgcmQQIUZLyeeDNJJGn1JtQvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eBnXLbO6Thr2hle+06yVrn/0h+nQbX1A/2UcGVqy8hzCJ7pk+rppq8Op/qdSSb0OPd
	CgCqa9fn3S29wkD4+UNAM7XXPWN72OAIpSBieko0McGKOyU5g58jGpAbJGheoaCcN3+7
	WUWVWhg1NzZO8K9jWkmAcleVQJbpirUR1pcyU=
Received: by 10.102.235.24 with SMTP id i24mr615674muh.46.1267211039421;
	Fri, 26 Feb 2010 11:03:59 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b9sm2065916mug.24.2010.02.26.11.03.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 11:03:58 -0800 (PST)
Date: Fri, 26 Feb 2010 11:02:26 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226190226.GA25079@gmail.com>
References: <4B74FE59.9050001@dresearch.de>
 <4B7920DA.8000302@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B7920DA.8000302@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Miss patches in patch queue
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
X-List-Received-Date: Fri, 26 Feb 2010 19:06:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/02/10 11:24), Steffen Sledz wrote:
> Steffen Sledz wrote:
> > As mentioned in thread
> > <http://thread.gmane.org/gmane.comp.handhelds.openembedded/29964> i
> > miss all the patches i sent according to this thread in the patch
> > queue.  :(
> > 
> > Is this a mistake of mine or is there a patchwork problem?
> 
> Ping

Strange. If they got applied then you may not see them in the list
otherwise patchwork might have gone AWOL when you sent them. 

-Khem
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


