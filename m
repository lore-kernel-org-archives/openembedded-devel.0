Return-Path: <ross.burton@intel.com>
Received: from mail-vn0-f44.google.com (mail-vn0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6DC73D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 19:11:55 +0000 (UTC)
Received: by vnbg62 with SMTP id g62so22845812vnb.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 12:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9geKKg4CfbMAXd+gaWOjhCrLkHHgZ3VIJRpMj2xMppw=;
	b=TZyqsq3DLPmCDXtDUJxR9MTiS1r3ms9LXAGpyG4qkjife8eUwJD8EpMuqHGOZ9SkRi
	vuMXcnD6DwKCM+NtKjUcDaVpH4LJNrPgSP2OpTA7kaEL1hYQw1YopEhy4l2PFJUPR4/Z
	y8mARzKfBC4umj5Q7WVPddH81WIUavp8Io40g8zOssyQd7o7+LCYaGRFPXBFwlqSMTx0
	EzXdzFwypNwCphpFJZWqfZ6XgD//CMiKE5g3f1J7LtUEKeIBssgr5GcZ1eZz0DGXx06x
	A+u09ErILPsEJ22mFyX/uSbdEkVfdp0ja0gnreZtozy1EQEyMvFpDydLSmUE2LrOcTba
	mCtw==
X-Gm-Message-State: ALoCoQlzz7GdbV+57iC35dX5A+0aGdnJuz40DNGLzDhIXyIEAgpkhuCXkpvu4v6T69oyBsPPfJLR
X-Received: by 10.140.89.37 with SMTP id u34mr12876462qgd.15.1428952316308;
	Mon, 13 Apr 2015 12:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 13 Apr 2015 12:11:35 -0700 (PDT)
In-Reply-To: <20150413135017.GH2330@jama>
References: <20150413135017.GH2330@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 20:11:35 +0100
Message-ID: <CAJTo0Lb3G73BbxLHzkqYe4fpJbjyZTaBE-tJequs4jQsEfYN5w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2015-03-23, Last for Yocto 1.8 Fido
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
X-List-Received-Date: Mon, 13 Apr 2015 19:11:56 -0000
Content-Type: text/plain; charset=UTF-8

On 13 April 2015 at 14:50, Martin Jansa <martin.jansa@gmail.com> wrote:

> === qemux86 (1) ===
>     * /openembedded-core/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.4.5.bb, do_compile
>

"i586-oe-linux-gcc: internal compiler error: Segmentation fault (program
as)"

Presumably this has never happened before?

Ross

