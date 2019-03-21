Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 06A9F7C665
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 21:29:38 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id k14so358328qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=03JYjAjeYBcKDSVvIAhG6i+Xv1/czbV5ZOBHavSgjS0=;
	b=FqvpRQHKwN+SuBd8s9sJbw5L/WFajLF658mpGazxmiIN6qiU8qLuyeD4Js2oUnT11X
	6M4yYYMQ/rP4zaskcToYnnASftP/GObqFaymGNdyVc/+V6/hSo0lmz4UXxzrGcAaJNnP
	JGSvvHrGIzfdk5TEjvhCqQAsNWkIzCpgg3BBcwAFJg2HAHe2CqKG68RgjzeLaDJ60szy
	Rt94I1kavKt4jtaUykOK/eDYxR4aO5XnlYSYSGZY2ogtR6DgDkY7RUC9s/npybXi673f
	MDD68Hsl6suOEI1v8GqCa/+7O/zGXnV+nwGzxqCoFefoQq62t6WH2V1dTEKuWjOHAd3R
	Xjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=03JYjAjeYBcKDSVvIAhG6i+Xv1/czbV5ZOBHavSgjS0=;
	b=JgUpQWEWJDHMt3ifhWNO1qZkuv5ROt0sTZzvJRV392nd26tOKuKd7AGU8BHF5GSlyV
	niuvLamUo+FJ83Wda8g/JZB99HJ2Zn5uKKSi4KSdn1G9rmM/ad6imxVSi4VRv/rbhePh
	EyKDLLeVUsUIylBQf3/of5mVu//MdxNJhsH2bNbL7mLMo4SRJqVvkp0GAiBPDQnRUgGM
	gsT9P8ut1kqdfoKkgRLVHbbeNp+j1Vr63ssiib2jSv3a8/QEFZVpCT5FZOkmLsFjD1C0
	QHaOH5ScMDx0RfT/DAnFQMtjkgHV70uEVTiU24+uVUr9Ej1kwFdZazlvm3TLY8SmRjBt
	Tamw==
X-Gm-Message-State: APjAAAW9mmN2apauneiRUtrxNX3UQw5oyEcZU1cj3zuL7jDJ/VDQQuWt
	XZIJTFelRkmK3RusbZifcmSkhVBTIrI0vCkMeVc=
X-Google-Smtp-Source: APXvYqyXyhbEX34dl8vWYacg0UoML5Uq65YqUpgzHdrwRWzibPsHbZjM6o8smFL/d7cIEdsC7EN2Ut3QC4TYY2pdbAY=
X-Received: by 2002:ac8:1a34:: with SMTP id v49mr5059823qtj.236.1553203779573; 
	Thu, 21 Mar 2019 14:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
	<60184de2d95445a984762c674ebbd809084ea438.1534182463.git.paul.eggleton@linux.intel.com>
	<6a15a264cf5e3cbe0df1614387cd2eb9fc421ac7.camel@gmail.com>
In-Reply-To: <6a15a264cf5e3cbe0df1614387cd2eb9fc421ac7.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2019 14:29:13 -0700
Message-ID: <CAMKF1sprBWXWR2b13ARFOK8LYSjrkbiyx_cWDfKXUktUhZOzdQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] faad2: set LICENSE_FLAGS
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
X-List-Received-Date: Thu, 21 Mar 2019 21:29:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 21, 2019 at 2:09 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Mon, 2018-08-13 at 19:50 +0200, Paul Eggleton wrote:
> > Commercial usage requires a license according to the homepage, so set
> > LICENSE_FLAGS = "commercial" to indicate that.
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-
> > oe/recipes-multimedia/faad2/faad2_2.7.bb
> > index b777831ad..9e5a3817a 100644
> > --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > @@ -5,6 +5,8 @@ LICENSE = "GPLv2"
> >
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
> >
> > +LICENSE_FLAGS = "commercial"
> > +
>
> My understanding was that faad2 was GPLv2, but you could *optionally*
> get a commercial license for it if you needed one. Is the LICENSE_FLAG
> necessary in that case? It seems like the default license of GPLv2
> would apply unless you worked something out with them to get a
> commercial license?

Sometimes the use determines the license enforcement. e.g. it might
be GPLed for personal use but not for selling products.

>
> >  PR = "r1"
> >
> >  inherit autotools
> > --
> > 2.17.1
> >
> --
> Joshua Watt <JPEWhacker@gmail.com>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

