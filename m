Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVIcc-0000U9-O4
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 07:56:26 +0100
Received: by pvd12 with SMTP id 12so1002313pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 22:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=dDoKWOlf2Zsjv2vdkomRyuvmOzVKjrMleyZmNFgCdUA=;
	b=PKzgQAS9m+oR89+SJAgoAfT8X7i0J5+dV9lwmlb00Vi0z9SZfM6K364V6rJzDCqO/m
	NU5cC26eZaoqyXd67qP/EVFKcEwRfE+XR3h9wnzmoaDHlLBt4Xjsw1vOg14zr8Mnvx3v
	Ii7NhhHwaQ/oTHsI7RZNccVT7SePm6cStfPh0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VJwEalpStiZEkCx4GEVHamcNivvvYhjkSCyOl7dp7cbEQ8hU15RVuh8pdf8XI3+EZ/
	DsDqpkBkru/hyW/9eHqPQHnKKIwioLbik6IFqo6Wxs+t5XtdtpuuGyXXGlBs/3WaDUgy
	0R6StIJs6PDPC+ci28PYOVD9pzcY28WRBMAjE=
Received: by 10.142.88.8 with SMTP id l8mr5261792wfb.245.1293000977174;
	Tue, 21 Dec 2010 22:56:17 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm8694286wfh.3.2010.12.21.22.56.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 22:56:16 -0800 (PST)
Date: Tue, 21 Dec 2010 22:56:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101222065627.GA28822@gmail.com>
References: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
	<AANLkTinQRHzSyLwso9MBC2JDRd76056_T2Nutfedtrn_@mail.gmail.com>
	<AANLkTin5G7ObMsQAE-DZEi8K4hA=gDcHs1gDRaKG_-yJ@mail.gmail.com>
	<1292996573.13721.0.camel@eha>
MIME-Version: 1.0
In-Reply-To: <1292996573.13721.0.camel@eha>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Stop Libtool relinking against host's /usr/lib (file format not recognised)
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
X-List-Received-Date: Wed, 22 Dec 2010 06:56:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/12/10 06:42), Esben Haabendal wrote:
> On Wed, 2010-12-15 at 11:10 +0100, Frans Meulenbroeks wrote:
> 
> > As the reporter of the gettext problem it at least gives me a
> > suggestion on where to look.
> 
> Any news on resolving this for gettext?
> 
I think it was wrong usage of libtool 2.4 it should be workin now I think

> /Esben
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


