Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id A9FB160291
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:36:05 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id p16so139801599qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ScNNER0a+i2t3ErGWGvJoP/31qQsDgSFkD+HRuvj344=;
	b=DFuFHFpd405HpVQZWntz2Ay30fvX+IZPMXlewN/a0+MMYeIH8XYNQaNwoWd+EkzyX9
	XajdjHyr7FmpPEnqJ7XNRyRAf/AylLIj032vF3zoN4HxaUKkr8kmQ8asNGW+eG/Onmsu
	h9P3ri/OktAExnyqJCgKyrWppxUVIj/RgVy8Jb61pmVWOj3JnhYdem4jnz4NJvG2upnm
	GZIIgRox2jbdH8om5XEplfDnx2OVRKTgwGb5F2vi1B9kTUvY2xAsgetmkLmX1Lt+KidA
	sxqqEYJR75Sf9P7037wiOxCF7WdShAGfT7DOgRINWKAXQnImAldrGg2OY6g/+9+DTa3i
	fh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ScNNER0a+i2t3ErGWGvJoP/31qQsDgSFkD+HRuvj344=;
	b=LmIB5+PyYf/zDFw7rM11/h95rrzKYT8nE7T/7i3cl/E8rT5WRKDISs2SvKyai4pZYQ
	4s68kqKxzbnrjjkKv+uC3Wg2bFlz8VYJ2c+s2o454GDIUj7R0A+DsJ0ZFwpPgfNsTgRf
	jzmzoOgLTC7GM48f6scdsjK2XOpHV7hrB71hDCZlcjmIJFoZlj4ctwXjDlH6LQWo2Mzg
	TmDJKhT0jv6Ejt961T+P+uwgY2mPQnqdpLjbJWLROqIuNNxaMHTrrzLZuFydgin/NEQx
	yskzC66r8DVETmM+IoHUsyUq9e/rnqZl8QgVk+vvvZRFG5taZGCYBX4zqAtlx+z1WmfT
	boCQ==
X-Gm-Message-State: AKaTC01NRo4eY7mq0209ylunejKYYhesJ9jzhWM+/EQp7Mukd1mAk0SM1YTSN5iPLIVb3Vrtm9fwDvOQgjVf2WCF
X-Received: by 10.200.57.54 with SMTP id s51mr21144390qtb.68.1480379766654;
	Mon, 28 Nov 2016 16:36:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 28 Nov 2016 16:35:46 -0800 (PST)
In-Reply-To: <20161128225759.9756-1-raj.khem@gmail.com>
References: <20161128225759.9756-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Nov 2016 00:35:46 +0000
Message-ID: <CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Tue, 29 Nov 2016 00:36:07 -0000
Content-Type: text/plain; charset=UTF-8

On 28 November 2016 at 22:57, Khem Raj <raj.khem@gmail.com> wrote:

> This recipe is used by intel and amd BSP layers
> additional copies are also there see
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva
>

Or maybe it should be in oe-core then?

(let the fight commence)

Ross

