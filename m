Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 29913609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 10:43:14 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so50053135qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 03:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=isqqHbMhXLIxlHGPpFZNK1quBnft2cW+YSP8pQWe3QQ=;
	b=dCwUbUhIGSXpWChmrNW6BoXxnQ2vyCwOKlmalPaZUILt4/H8CwQVwtrO2HsmY8FoWj
	PXfngWXt9oBqUzkhr1sYa6EAjAAe2gGK9nGz+4gU/5SkI8UJvCE9PX3UXsKFVKRCpXVD
	/fanKGNm0EbzyU89+MRm950EFG1/VDZiNPEOP86NhoiGR0btFTvAbgvporBlQn252lcC
	FVMnMB8iyqHf4KPEAyk4B1t19fkYKAKSZXCqiSB5McyvmnvHshV4rUOHkiyOvWh9sIv8
	DQAdRZKyTKw24hck7FphORnwAdfAujorCOdg3GWQUkd98Jr+yapC8OEbP+OJYkF3yr7H
	eQeg==
X-Gm-Message-State: ALoCoQlaGB/IJuUM5LiCaPG9V2CLwdMWUDl+jJkSYX0gqqg3fB1OG1SB/MnK54J+8u0v9fOmP0UU
X-Received: by 10.140.89.104 with SMTP id u95mr2574109qgd.15.1432204995814;
	Thu, 21 May 2015 03:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 03:42:55 -0700 (PDT)
In-Reply-To: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
References: <CAJTo0LbHVrLM=Wt++3ue-VQ3KFB42tGaJUwFRW_UHfBDXuqc_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 May 2015 11:42:55 +0100
Message-ID: <CAJTo0Lbwf9KYYTxtAJCNbQ9=YU-PdBoYShg32ThL_GgkoGMobg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Moving GStreamer 0.10 to meta-multimedia
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
X-List-Received-Date: Thu, 21 May 2015 10:43:15 -0000
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 20:54, Burton, Ross <ross.burton@intel.com> wrote:

> This is basically a heads-up that we're working on moving GStreamer 0.10
> out of oe-core[1] and into meta-multimedia, where anyone who still needs
> 0.10 can use and maintain them.
>

FYI, they've now been removed from oe-core.

Ross

