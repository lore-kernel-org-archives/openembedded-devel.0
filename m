Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 59634737A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:02:34 +0000 (UTC)
Received: by qget71 with SMTP id t71so116375474qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qytweppa++6vAu5nxyZ6gUpSmJar6h3NIt4WQhevj3Q=;
	b=TwGcBkx8umxu2/mfL0pzAefN6iq2+RuHnXJj0rYsOSC+3d0qHsRxnJxGZdekP9A2E5
	XcpOhghJ3uZDhcTvx7gfMtkdZPGd57zsbSDA5bahzXnHD3nxrJkeiI+xaPbEqD/Pbn7k
	4q32CarN8UQLQNSWAPibRyhxN7UcPqiH5WUdmBZJLHhTdzkWrzobIsXgSsdAl4LqPlkP
	G27ixoMI7fZKP562zirSYwPkvM533qH8BCBDfLRd5D/iTHiXQoOn3C8PVXvptf85bncL
	gj5+mgv10QRY1Zj7lnvF7vDe6Qj8GLspur3agKLlEE1rudjp/J31WiDx94LNY24K8ldD
	XR+w==
X-Gm-Message-State: ALoCoQnySlML4rRpfEjDBVTqqF6ZoMMUWSbpI2II2wyaMN8EXZZ2PBYGoH5XWViC0ihzdrD+rVjq
X-Received: by 10.55.15.129 with SMTP id 1mr25043416qkp.29.1436454154051; Thu,
	09 Jul 2015 08:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 08:02:14 -0700 (PDT)
In-Reply-To: <559E8BC3.2060300@gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<559E8BC3.2060300@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 16:02:14 +0100
Message-ID: <CAJTo0Lbgx2chtAA+AuHgsTBvrV50wRgdqsJCZxG7tW=6ZBMPyQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 15:02:38 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 15:57, akuster808 <akuster808@gmail.com> wrote:

> That make sense to me. Also libav has LICENSE_FLAGS = "commercial" so the
> change which will simplify things too.
>

Why isn't that the case for ffmpeg too?

Ross

