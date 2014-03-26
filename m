Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id CCFC16F9B5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:12:28 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id w7so3372849qcr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=50nmTL5dLz6NmmXUFvDffEg7SXoyLOC1CWNUXKv2ff0=;
	b=UDpc+1PFyRFGF9BAjIeG3v9EeGDTvbTEVrFAmxJ0u+9BW8HQMXGBDWCa1OW0UkQjaY
	+5KZkqgwzJZqczPrXZ4pfDKP9pLjgj8ydKpFNkWutulbmLaIvAiW2Gt4rwdGZRicX++G
	XcPSaUWz7Fq9iUvUVHhEWLED+EHzMaP9HtIozFdKQ4IFT9Ylahu9y8DlU3UwFHXAbXsG
	MgVsTQnFO11zvwnObDIP/8pYlgUGmqkO7bUryvo3z/FuGd04qjj7jN7JEVlLRx4AZqVS
	6qPrVPK4gseyRv9KsDfWsmCBWMODotmZatEDsCo9g96GDElOBeck4dxw77r1V3SZb5Pg
	gPHw==
X-Gm-Message-State: ALoCoQmnxBo75wXZXdV5X9z61x2CD2gci6Qu5x45UMXevtmzUqMFwq7OshpJB43uG4bEOYKR3E7X
X-Received: by 10.140.106.195 with SMTP id e61mr87427838qgf.66.1395871948717; 
	Wed, 26 Mar 2014 15:12:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 15:12:08 -0700 (PDT)
In-Reply-To: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 22:12:08 +0000
Message-ID: <CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: initial support for musl libc with OE/Yocto Project
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 22:12:31 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 22:04, Khem Raj <raj.khem@gmail.com> wrote:
> There were interest in other threads in having musl as an alternative
> to eglibc/uclibc that we already have in OE, in that direction I have
> poured in my on and off work and put it into a contrib tree

Blimey Khem that was quick. :)

Ross

