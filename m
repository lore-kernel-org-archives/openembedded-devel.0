Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppqbu-0004J0-Uv
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:16:39 +0100
Received: by iwn8 with SMTP id 8so1830787iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=xn8C6Z0wmx1Dj2FzeiIMdQOxeX7PwjYy22q1pvm/378=;
	b=uk8fXC54/TJ9U1hmte3G7dHHv+7JTq/Wg/+YpncO8hBBw6KpTWqQqxbjkzASN0Ghxf
	QWvUaDyNUusU12H0tp0fVnBTXEIyHFm0+2e2xnjTgddRuQk5v4h0Me4LLDOYeBnrUPTU
	WaToWHvRqJODxFSptbIgzpp87VJd14q2/k/mc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=IkiZp9JM/VsamSVqhnRoeS0rINrwRA5wNsQDyWLVJga4rMNxnfWsujSBdOIe95XVkg
	wJJyhPsXmaxkoBqH3o/0JT96mH6Jd4Tybs0stD+RO+S9Kw28CtIgUQwJqzSNHuGaoSm1
	PvppXxv02sCfP6fzUnIYd9s0nY7JAbEhxB8Uw=
Received: by 10.42.220.199 with SMTP id hz7mr1803838icb.238.1297898126526;
	Wed, 16 Feb 2011 15:15:26 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y8sm159735ica.14.2011.02.16.15.15.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:15:25 -0800 (PST)
Date: Wed, 16 Feb 2011 15:15:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216231529.GW14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <003901cbce20$08538e00$18faaa00$@slingshot.co.nz>
MIME-Version: 1.0
In-Reply-To: <003901cbce20$08538e00$18faaa00$@slingshot.co.nz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] wvstreams 4.6.1 with context patch for ARM architectures
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
X-List-Received-Date: Wed, 16 Feb 2011 23:16:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/02/11 10:25), R U Local wrote:
> Dear List,
> 
> Attached is a patch which gets wvdial working on ARM devices.
> 
> Wvdial or more precisely wvstreams thows an exception on ARM devices as
> get/set context isn't supported.

Thank you. Can you follow the patch guidelines and resend the patch for
inclusion

http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded

> 
>  
> 
> Cheers Mike.
> 
>  
> 
>  
> 


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem


