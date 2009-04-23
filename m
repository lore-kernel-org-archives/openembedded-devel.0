Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lwqpe-0005jN-K5
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 06:46:42 +0200
Received: by rv-out-0708.google.com with SMTP id f25so253707rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 21:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ZMQ2yju5NLBDszNRndrgojlWdME0qz3ebPY4YPMOdxU=;
	b=AWxPm96Nnp5bjNh23q4s0bsRK8IXAi6Wpi2ggYC0u2QHhGyZBo0R9IJTJKiZCVaxRJ
	5Q81U6uEArYJnwu+k5LRfjVMW86mSx3KLw5EAgd7ynvqKS+NcZ7RGsTWIuXESx0ediCx
	tsu1ie1MRf3Ltxsl8UouDHMxoclGoy+9zylDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=D9M3BJqWQYBO0hsg+naMCD3ZJTki/FuddayAA1Qy/hazlfmjDiMQ03zO8g519djEux
	SSHpSDtwlguUQu/Xpz/JGpB01or02DGWn5S8I/oSZ/AFLBW32HLlcbQYDx7kQ7Us1bdr
	4oEiJ7eLQTR6p09lMogzDqHQ7MgyAP6LWckeY=
Received: by 10.142.214.5 with SMTP id m5mr202298wfg.37.1240461726896;
	Wed, 22 Apr 2009 21:42:06 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-44.dsl.pltn13.sbcglobal.net
	[71.146.25.44])
	by mx.google.com with ESMTPS id 29sm1926093wfg.15.2009.04.22.21.42.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 21:42:06 -0700 (PDT)
Date: Wed, 22 Apr 2009 21:42:01 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090423044201.GA22270@gmail.com>
References: <200904151633.49146.khimov@altell.ru>
	<20090417223735.GB15643@gmail.com>
	<200904181944.13663.khimov@altell.ru>
	<200904220022.27769.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904220022.27769.khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [PATCH 02/11]	binutils:?add?binutils-x86_64_i386_biarch.patch
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
X-List-Received-Date: Thu, 23 Apr 2009 04:46:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/04/09 00:22), Roman I Khimov wrote:
> On Saturday 18 April 2009 19:44:13 Roman I Khimov wrote:
> > OK, attached.

ok

Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> And, BTW, I think this one is ready to go too.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


