Return-Path: <kaiu@gmx.de>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Mar 2015 17:33:06 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 576E86AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:33:06 +0000 (UTC)
Received: from mail-we0-f176.google.com ([74.125.82.176]) by mail.gmx.com
	(mrgmx003) with ESMTPSA (Nemesis) id 0MTBsk-1YwPkE21lG-00SBTG for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:28:00 +0100
Received: by weop45 with SMTP id p45so18163713weo.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:27:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.180.171.35 with SMTP id ar3mr126105259wic.24.1426526879838; 
	Mon, 16 Mar 2015 10:27:59 -0700 (PDT)
Received: by 10.194.1.67 with HTTP; Mon, 16 Mar 2015 10:27:59 -0700 (PDT)
In-Reply-To: <5502F0C9.8050009@balister.org>
References: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
	<CAGiJk9cTPf8TOg+h2rYbsT-Pvyo6EbDkR1_ps+dRPkx=43d9zQ@mail.gmail.com>
	<5502F0C9.8050009@balister.org>
Date: Mon, 16 Mar 2015 18:27:59 +0100
Message-ID: <CAAKMwirh6+QTkeT7EKOYPcGX_cjPYhu-HVrzx0D=N5QtLdwOJw@mail.gmail.com>
From: Kai Ulrich <kaiu@gmx.de>
To: openembedded-devel@lists.openembedded.org
X-Provags-ID: V03:K0:OZRIYqdqC+gnbS3uZ/pwqEESR7OqM7cCGqdWlpMWxtOBFzlQjmX
	5wXw6Sf6ulGARG7C7yunodVvaukEm8mr1UwTCusCBLeoCFfEPCUzIHjlwtEJYS5ZjGLpm7K
	inYiW3WQsc+5pEgFK9gpqiiBRo9DW4R2NandHRLYrszVFLZ+RyYqbCqUcMrzbqXqTzTKTbS
	WxWtlYSZZxc7DAEJ/ulCg==
X-UI-Out-Filterresults: notjunk:1;
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How is the process to add a recipe to meta-oe?
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
X-List-Received-Date: Mon, 16 Mar 2015 17:33:07 -0000
Content-Type: text/plain; charset=UTF-8

Just sended the patch via git send-email. :-)

See openembedded-core@lists.openembedded.org mailinglist:
[meta-oe][PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe
recipes-connectivity.

Kai

2015-03-13 15:14 GMT+01:00 Philip Balister <philip@balister.org>:

> On 03/13/2015 07:23 AM, Samuel Stirtzel wrote:
> > 2015-03-13 12:08 GMT+01:00 Kai Ulrich <kaiu@gmx.de>:
> >> Hi,
> >>
> >> I created an layer with a recipe for smstools3.
> >> You can find it on https://github.com/kaiulrich/meta-smstools3
> >> I would like to share my work with the openembedded commity.
> >> How is the process to add a recipe to meta-oe?
> >>
> >
> > See:
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> >
> > Also see the README file of the layer where you want to put the recipe in
> >
> >
>
> It might be a good candidate for meta-telephony.
>
>
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-telephony/
>
> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

