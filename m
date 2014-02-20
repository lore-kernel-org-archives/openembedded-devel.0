Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6846F176
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 21:36:18 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id im17so2496338vcb.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 13:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=l6ryJEfDcjFpqgLQ5QZvNgGJfXGSGVMUZT+Isl1vb84=;
	b=ZUJtSXYBwSOA1Fz+NAymJRJrIyz7EnQ0Ow13ckKkDmLAp3ZZEnSJ8mx67bQCiX/ffU
	3Jpi7tadtEHrfS7mk75nvczWMGeDYj+fNFEYyEFeVdBq+u7iDopr+mRpmsMaPDwP8Tum
	BCbUDd3tTZP764/f8tBa0FmHaR+o9trA2nQkSPAXyBcQpry2paXEqiQMuybgVI4n4dBc
	F9xRepEahPtZFzn5+02LI+FLuGERg9r+DeNRYPsGyEYgh5pwsnmiO2DG/B0B2WAJUBrH
	O+b7Kw6rkOvbUF9iCDJgGOXJ70L5fpW+9gN3wzdMxeSXh2Z3qoBIhwoq7zhoU51rKHhd
	Oc6g==
MIME-Version: 1.0
X-Received: by 10.52.166.9 with SMTP id zc9mr2063042vdb.16.1392932179433; Thu,
	20 Feb 2014 13:36:19 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Thu, 20 Feb 2014 13:36:19 -0800 (PST)
In-Reply-To: <CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
Date: Thu, 20 Feb 2014 13:36:19 -0800
Message-ID: <CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 20 Feb 2014 21:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Andreas, LXDM from meta-oe works well with minimal configuration on my part
:)
I didn't have to add another layer to satisfy dependencies. Thanks :)

Adam


On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Thank you Koen and Andreas. That has been really helped in clearing up =
my
> > confusion and setting the path forward.
> >
> > I think I will try LXDM in meta-misc in meta-oe. Is there any special
> > configuration that I should be aware of (other then setting it as the
> > graphical init manager)?
>
> meta-misc is my personal playground - it might have dependencies to
> other layers and some things might not work as expected...
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

