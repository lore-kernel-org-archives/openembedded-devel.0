Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtVNc-00010g-LG
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:29:32 +0100
Received: by pbbb4 with SMTP id b4so3016536pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=g2miOBrwzzDeSE7cEMYNWWM59zr3xkH3UGPGki0KMyU=;
	b=PazpgqjV5Dm0we7xDcNZCNeYJrXufeC4GuJlgsXyIIeEOoWfQxtMcnMHGz+qwa5zJ1
	kgLFnY/c1F/hsOCoQUpN+7w4olsHWzTOi7nQCxHN/CkpV/xzJsOTD9FQxevUMAcg2Ene
	JDV7f6p2RGRbZDwEmlldWlTp9kF9QMfh32ZIQ=
Received: by 10.68.193.167 with SMTP id hp7mr22846349pbc.3.1328322093998;
	Fri, 03 Feb 2012 18:21:33 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm17311120pbh.15.2012.02.03.18.21.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 18:21:32 -0800 (PST)
Date: Fri, 3 Feb 2012 18:21:29 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120204022129.GC26306@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	nitin.a.kamble@intel.com
References: <4F2C6842.1040907@promwad.com>
MIME-Version: 1.0
In-Reply-To: <4F2C6842.1040907@promwad.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: nitin.a.kamble@intel.com
Subject: Re: Java: meta-java, meta-oracle-java
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
X-List-Received-Date: Sat, 04 Feb 2012 02:29:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/02/12 02:05), Ivan Kuten wrote:
> Hello,
> 
> I noticed an activity around meta-java layer (OpenJDK based)
> https://github.com/woglinde/meta-java
> and recently around Oracle JRE: http://git.yoctoproject.org/cgit/cgit.cgi/meta-oracle-java/
> 
> Any plans to combine or coordinate these efforts?

these are two different layers so they will exist. What coordination
would you like to see that will help you

> Because now we are working on Java PowerPC e500v2 support and finally would like to upstream
> to mainline our work.
> 
> Best regards,
> Ivan Kuten, head of R&D at Promwad
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


