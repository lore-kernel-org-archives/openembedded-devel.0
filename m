Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D73E16F19B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:18:43 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu8so168894vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hforYJXIs5zRqipmzFTaNwA0/12zVpwBiS+Q04HYkWM=;
	b=Cms9X15noDj8YEMpJCzvX9G4j9TK2/5GQe76PsiLezdBe/tpbe3t4w/rvsuU+0hwJO
	3oipbRCP/r0PEeL63PK0wa52zgEPy/Wd1iToCod/DGY7k7zmtSbp1sWFgHlRriK2DG8o
	//azQ7Y7QpZdG8YxgQ59LmE8Fbucmn0o4Rtc+m+ZIMQb8etMHym6IQ+MQDtaXQvcKvtc
	PQz6UPVZFKQoz3vfqvTDNFj+vhmxF7+Gw76pLq9oIkoKVltpJQAFxxiBUTQo9YhwVkrl
	s+W/CfACxjtl9tmNfZ2Iqg4A8sXldkN5ojPBZ/uRvpkhxGRAIUhExtTYsxkvdUGlgGjQ
	WVZQ==
MIME-Version: 1.0
X-Received: by 10.221.29.196 with SMTP id rz4mr25010848vcb.8.1392805124603;
	Wed, 19 Feb 2014 02:18:44 -0800 (PST)
Received: by 10.52.35.170 with HTTP; Wed, 19 Feb 2014 02:18:44 -0800 (PST)
In-Reply-To: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
Date: Wed, 19 Feb 2014 11:18:44 +0100
Message-ID: <CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: GDM alternative?
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
X-List-Received-Date: Wed, 19 Feb 2014 10:18:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 10:24 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Hello everyone, I am sure this has been asked before but I haven't found a
> solution.
>
> I am currently integrating GDM to my XFCE image. I was hoping that it's as
> easy as adding GDM as the graphical init manager (in local.conf), but it
> looks like PolicyKit, Console Kit, PAM, gconf, gconf-sanity (as per
> meta-angstrom) all need to be correctly configured for GDM to work. This
> integration of multiple frameworks is not what I had in mind. So I am now
> searching for alternative - something more lightweight and with less
> dependency.
>
> meta-oe contains another login manager 'slim', except it's no longer
> maintained and has been moved to nonworking directory within the tree. I
> don't see any other.
>
> Thank you,
>
> Adam

I am using lxdm for my XFCE-image.

Andreas

