Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f196.google.com (mail-vc0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D49D6FCAD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 14:21:04 +0000 (UTC)
Received: by mail-vc0-f196.google.com with SMTP id hy10so919737vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6yGctCQEWSrZMrbLI19EqXsZq3aSmLBVVNgtJPqqXfg=;
	b=aCcXZ9D8Fn7wSnAQcBWHQeoOdlc5EuyLuSAia/NzH1RtgBi99Fs22+tHUoLYZHHd6g
	znjsrx5Y2k7eNGucdwUaOzcQjbIn8SIU57hXGHHEYwkM4qp6igKL7ZZbttx8gHGGCDSC
	l2UeBJanf4CK/9lFaT61anDiHFKzUUpwLbtQaCFacJ/eXprbWf9dp9brHuvW3xPiBYoC
	z2xzzShqB8PwMNcH2tS1hpfnQNxfg3vvv/XrSo1mtSzYadRXIgK+CDyFO886dgFH87pw
	rh+kMRXm2UHS0brw3YyU05GY/ZjJi0bjkytwCdbB8w7Lu0HxAt3g0LB7C2HR1XHp4pYk
	xLEw==
MIME-Version: 1.0
X-Received: by 10.220.69.72 with SMTP id y8mr7022062vci.21.1402755665455; Sat,
	14 Jun 2014 07:21:05 -0700 (PDT)
Received: by 10.58.126.231 with HTTP; Sat, 14 Jun 2014 07:21:05 -0700 (PDT)
Date: Sat, 14 Jun 2014 17:21:05 +0300
Message-ID: <CAAHuHfwohTZ32-U7EsmWxxjj1xo3VjjiZmsS8c_KRGtoD7JMjw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Beaglebone layer
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
X-List-Received-Date: Sat, 14 Jun 2014 14:21:06 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

We are testing oe with beaglebone black, Did you tell me what is the
difference

 MACHINE=beaglebone ./oebb.sh bitbake systemd-image.bb
 MACHINE=beaglebone ./oebb.sh bitbake console-image.bb

Thanks

