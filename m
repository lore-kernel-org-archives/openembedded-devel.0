Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id B30C5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:40:34 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so8618763qcx.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 06:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ax7U75lHdNy0bSlX/DGOktjCWmKgWGdhdT4OTnSaeR4=;
	b=RXtvT/0OJuZrOG6AIaIitGZ9puh/I5h4AH0xyLQ2J95M79y2GQj8wwTyRvIoHTvENv
	rWOY+ptX2Ij2dBnZ5SdxxIo1d3aa9WE9wH0WFzUSqQvbLlXYtY7T9NzzOjXsjqci+tXV
	z5byxn7qaIG8zWiYTUBI+C1U188xlu8n9QrGfNGf3odZimVKGJgjY+3hLUHOXuNr63Z5
	SSqbWgmmWGxAvwkIShqJfaCvHY5hsRnp/S0nSce76LSwG7u/m5RLJX1OdVJ9vpq+vpN7
	Vgt9/vXiMJWkjW8HbXT32sUgiaqnMZJ9bVOzalnm7Go6KdX94rzaqQPrMrtYHDImpXt8
	o4IA==
X-Gm-Message-State: ALoCoQlYFUR7WO59wC3NMI94ZtECei9xdDzql4VnQ4gp2f+j9jZZovN0QaIGWzUvdBHFDfT0YbKc
X-Received: by 10.140.85.9 with SMTP id m9mr17792649qgd.7.1424961635479; Thu,
	26 Feb 2015 06:40:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 06:40:15 -0800 (PST)
In-Reply-To: <CAOd_LFwt57hC7kxYeNA2bY-pLkJcJBZ5c2w9LZxxE1CxvCJ06g@mail.gmail.com>
References: <CAOd_LFwt57hC7kxYeNA2bY-pLkJcJBZ5c2w9LZxxE1CxvCJ06g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 14:40:15 +0000
Message-ID: <CAJTo0LZfuBksC=C7aESKOPH4Zc8sn_zpTLZa+dy84Eq7OwrJWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: building 32-bit SDK on 64-bit machine?
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
X-List-Received-Date: Thu, 26 Feb 2015 14:40:38 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2015 at 14:31, Cliff Brake <cbrake@bec-systems.com> wrote:

> Does anyone know if its possible to build a 32-bit SDK on a 64-bit
> workstation in OE?
>

I can't see why that wouldn't work.

Ross

