Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC14615F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:12:40 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id xa7so804468pbc.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=nuX8CiqI+hfWq0mrlv2MrxSo6yE1Pq/0RGzwAZyG1HQ=;
	b=QU/74DdQ3JNbRtwJAEKkrdEG9zCs5K+asCa0fPVq5gJur9qG5wzvazx66gXhJmDdnQ
	hripXiiIAFnYwnIA/YYFXnZjb2+89BZBxPSRtvC2U+31ROIFKWoShvrhcJEHOx/kgcPX
	M6YYi7s/LtFxLAcmdZLw0RJcL/q+4FwzXY70bq2xsjKvV34boLzB4sNQ2Ytfq+O4hkv4
	1/VZc/saQMUHIg0zg2UGVmz9aI8bCzuSFwpMVy9g1HO76xgy8nEcAF2IIA0eg+csb2pD
	aT4NhH3/uYpavQ00mGdTKdEsPns/0zZydXOtPbJm9b+ybVNtR0ZZ90DW7LkJH/nsoVvP
	U2Jw==
X-Received: by 10.66.25.133 with SMTP id c5mr13423615pag.4.1379052762155;
	Thu, 12 Sep 2013 23:12:42 -0700 (PDT)
Received: from [192.168.0.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPSA id oh2sm9363513pbb.3.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 23:12:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZQM09ue4aWs-H4K94f+CsFUeTbFDA5mH4+aQQ=HdcHOQ@mail.gmail.com>
Date: Thu, 12 Sep 2013 23:12:48 -0700
Message-Id: <449257A2-5983-492C-BB40-0CA231F01535@gmail.com>
References: <CAJTo0LZQM09ue4aWs-H4K94f+CsFUeTbFDA5mH4+aQQ=HdcHOQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: Does meta-oe want imake?
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
X-List-Received-Date: Fri, 13 Sep 2013 06:12:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Sep 11, 2013, at 6:31 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

> Hi,
> 
> I'm planning on removing imake from oe-core on the grounds that it's
> 2013, not 1993.  Is anyone aware of anything still using imake?  If
> there are users then I'll send the recipes on to meta-oe, otherwise
> they can just disappear.

Just remove it.

How about anjuta-remote-run.bb as well ?

> 
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


