Received: from [209.85.216.177] (helo=mail-px0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mc6LN-0000wc-Gx
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 01:37:57 +0200
Received: by pxi7 with SMTP id 7so511059pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 16:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YxwxwsCRmkYgJ8Bua5/jVYkDpnQtRVde9SWXdXFLpEQ=;
	b=R/VOEFeg1CWjZI9lLbanQPYWNpz2IZzQ7L6+cqjixsQ2BGIFIke8UO6CxuWkQIoZfQ
	5E9q5iFOKiculZD9RoLK8kngZ9S5nDQW4Us5IMyLA/Vmkk7m8IxqccI02MsVePRPQm+X
	nQllTp0HcqvkWnpAI5QBh8vhq6HBKZvTQwMlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GwPxajCbUmkAXLIB8k62FHMYn82irf2f08/sdDEJt2xIx4W1uPssy8OxGAxwx5OMil
	MBYnPlux1c4nDdeyQu7i7u7/py/GDqgDmCh2yL5D31u+unhVRVoRfNgbphaPIqgGuzws
	ucrqy7/hXRM3aikKP21MSqtO/vj53faS+ERWk=
Received: by 10.115.55.4 with SMTP id h4mr2248929wak.34.1250292074090;
	Fri, 14 Aug 2009 16:21:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id k37sm3033704waf.42.2009.08.14.16.21.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 Aug 2009 16:21:13 -0700 (PDT)
Date: Fri, 14 Aug 2009 16:21:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090814232108.GA31492@gmail.com>
References: <20090814215138.GB31011@gmail.com>
	<1250287663.4215.164.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1250287663.4215.164.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Fri, 14 Aug 2009 23:37:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/08/09 23:07), Phil Blundell wrote:
> On Fri, 2009-08-14 at 14:51 -0700, Khem Raj wrote:
> > I would like to add minimal-eglibc and micro-eglibc distros on same
> > lines as -uclibc one's
> 
> How different is eglibc's API and ABI from regular glibc?  I wonder if
> it really needs a separate DISTRO of its own.

its drop in replacement. Should we change minimal and micro to use it ?
I am fine with that too. 

Thx

-Khem

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


