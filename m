Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 66D316FAEC
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 05:44:21 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id h18so5177514igc.9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 22:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=/tbZFoHxNtsHUp723yNLU3FEheGpNpThjPSGmVFCPuk=;
	b=AXIShT/6hfvvS2UTzo41Z8oTFsjjvlo5Mw4UZYLB8ZiNRZOzp912Zwy8+wNXL9RSko
	HVCDxDFO2Twp3lVCQGkBw67LVY/0aEvQx71HmJ/FTDcuUp61j+M1n/Gv7865cDa1aJce
	YwM55Pog+A06GwmM9re3IRn/NklJ9cRaAw49gBHrMlQ5FADkLsYHHK1J7dp/skptcmqj
	knTC8kLd5/LI6zCojn0n5XwTMtH4oslX/t2oWM7WQKyfmGqKLvDoEs0kdxQSrBfpTVNC
	0kFe0ZtMVD79Q7Qfjm7wCUZ4eibbosMyUwYt6sydY4/BiHyAq7WWiyogZjODKb5Gj4+P
	d7Jw==
X-Received: by 10.50.4.67 with SMTP id i3mr29801igi.4.1410846262048; Mon, 15
	Sep 2014 22:44:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 15 Sep 2014 22:43:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2014 22:43:52 -0700
Message-ID: <CAMKF1srKjh-imfCPMTW9EiZNRFVydO71LSMPzhnAFuoUWtocZg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Carlos Rafael Giani <dv@pseudoterminal.org>
Subject: mpg123 recipe LICENSE_FLAGS = "commercial" issue
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
X-List-Received-Date: Tue, 16 Sep 2014 05:44:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi Carlos/All

I want to understand why LICENSE_FLAGS = "commercial" was added to

meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb

in initial commit and has been carried over upgrades ever since

The license seems to be LGPL 2.0 and is explained in greater detail here

http://mpg123.org/cgi-bin/scm/mpg123/trunk/doc/ROAD_TO_LGPL?revision=2607

So what portions of it are having different terms for commercial distribution ?

Thanks

-Khem

