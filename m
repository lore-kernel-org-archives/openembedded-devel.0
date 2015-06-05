Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A144075716
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 07:54:38 +0000 (UTC)
Received: by payr10 with SMTP id r10so45976840pay.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+ge7zT06jY0cBtWfPOXSwqlV6VDQPL5yFHJ4DnryBMI=;
	b=ZE+x3Bk+DPAg1IYqh5iJCjLzV9W9CvS1XxS1Vv6MM+RUrfKp/ILL0b79c6mVSjzPSL
	FGE91nlObUhIehATWJ5ahawfclPrByMVJTDVfbaByUuwaHCf9oYx16da78dqXeyYmMIq
	wpdTsJ+X8pBoh3GBiLQLcZjFBGRTe+9coJyThp8Cq4qR9JrOcXWRsoKdBgA6rc+0sN+I
	jYKHzv1VDIHA2t5jz3C02rsrbWjQQHXpdr/HwV67ZxgBlrkKZELfLeSbYxkGrBBXnmQp
	nHKEgxEQJ1Lk+c+PUwrQIDAFExdhWFuuC3bIVCtqDUAZ0rJZE1hTah7lDtutIcNw8DTq
	1zQQ==
MIME-Version: 1.0
X-Received: by 10.68.205.67 with SMTP id le3mr4032776pbc.94.1433490880190;
	Fri, 05 Jun 2015 00:54:40 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Fri, 5 Jun 2015 00:54:40 -0700 (PDT)
Date: Fri, 5 Jun 2015 09:54:40 +0200
Message-ID: <CALbNGRQ9CdHqJJzLB1ojkuVBPXfXcK4iwGttMC591y4=aFziFw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] 5.4.2-git builds nativesdk
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
X-List-Received-Date: Fri, 05 Jun 2015 07:54:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

have updated meta-qt5 and am running a build with 5.4.2 / git. One
thing I noticed is that I get a bunch of nativesdk builds now. From
what I saw it is caused by qt3d_git depending on nativesdk-qtbase. Is
this really neccessary?

Andreas

