Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4E62E60616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:03:02 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g203so111184290iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=V/zFQlJlOssOPR2Z1GmPLJRRC/vTiZWe716OgqklGtg=;
	b=lp2hygkTB3jZR4yxJLiWw2H5bl5Ie/12Z4Lhsoo1ajgLygz2bXVm2vvV7bSeYLzka9
	oOmA7boDQAEVBQXpFkLPby5HtDfcRD7pabLauWAj4wOFbW3GgFU9g1M3qN7/a46KoDyR
	7s6U3FMNyTa+d5a//wwW9AtOtKRUzzEjnlX4Re0dyrEwvi3G+W44sm4Zkf6rF9FCgqRQ
	naHfd0q/e+Ci8iqpMusglTDnxd3krErZboXxN/8nglM7YeJow6J63fpEbXZiABilSRgO
	U7Ob9Hfcuf7TOGVDyNmfl5/qEY8yDgtHtPUdGqaM/O0cpsTauaCqzakptIyvBIyz+pHR
	GmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=V/zFQlJlOssOPR2Z1GmPLJRRC/vTiZWe716OgqklGtg=;
	b=RgQiKU65B4Q1xMz4i+65URt2rz9lV8ijP+PWPvy5iql4KR/syYVgMli9JYhaPEDlX5
	atyTJ97wYXAXaM2lXA3bO36El0w4yBXgIxvN5AKBMQ9aId4Bm6oHpVzsf4a4FKQFpkkX
	jpTZsjHDtX6to4xA1qYqXTAtgyoAcRvECFavwAzvPxBWfxtebw30792lo1MY72+3SycA
	89wRDVD1UMxCv2gKwpqAr0UZ2U8GScmoOSiRLKiiX4Aop77K83XYz/A8ldQ9mgUuPLiX
	b7s8uWz8PIOQc4/zhidEPz9ojY5KO9RSPtoN+OOJykcbOWLbXAblptHHQU9bzAgYywTc
	kNaw==
X-Gm-Message-State: AD7BkJL8OxaKC/W9YO53Y5KG2HBgS3y907PzJ6805fjJssYaHx/BDL5MyaUBPYq0LxR/7jHi1LogYBhpNqJ42DtP
X-Received: by 10.107.137.93 with SMTP id l90mr4875623iod.133.1457625782704;
	Thu, 10 Mar 2016 08:03:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 10 Mar 2016 08:02:43 -0800 (PST)
In-Reply-To: <20160310142507.GI2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Mar 2016 16:02:43 +0000
Message-ID: <CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 16:03:03 -0000
Content-Type: text/plain; charset=UTF-8

On 10 March 2016 at 14:25, Martin Jansa <martin.jansa@gmail.com> wrote:

> This wont make freesmartphone people happly (if there still are some)
>

Is anyone actually using this software?  Obviously one solution here is to
move pygobject to meta-gnome or something.  Another would be to nuke
meta-smartphone from orbit.

Ross

