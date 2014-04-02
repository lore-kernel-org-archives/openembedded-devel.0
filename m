Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35EBC6F567
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 04:43:58 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so5857409igb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 21:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ULXcnF36PU7ncQoh0g+FG+9n7OzoRxytZkGEursPLkA=;
	b=qCP3liDbLdb84waCt562g/+7L4s0wwx2Gjt6n7+Z1Zf9efP5eb9IiY+YByGNBUiyHU
	jEDmkm1shC1APHzoTkeZtoC8e1x2y1MRwOvn/a1YfvWh38CKmgPi3x1rco+Ol7ui0zJu
	/tg8WLtxGQTiVUxY1Xyw6MsuAA1XrZNrrQZnVzXaGTwC5EWlmnXfYQAtIbtXkyvYkEp9
	0Xsmg5eO0qpeoWL+JCTqxtoScp0XEHY3Te0rP6FpOksPZG32EO29KXI2/st3aWqGD4Ys
	4D1VRK1EbygR0neTsX1YKDIF048N8bCu5KtJ+g9uV5Cv//GHfXfNykeSk2W89m3h4m7L
	xbyA==
X-Received: by 10.42.53.10 with SMTP id l10mr46514688icg.33.1396413839488;
	Tue, 01 Apr 2014 21:43:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 21:43:29 -0700 (PDT)
In-Reply-To: <2C0383B9-CB95-4B36-B106-B4538D93FF38@linaro.org>
References: <1391518370-19990-1-git-send-email-koen.kooi@linaro.org>
	<20140305041901.GU26981@jama> <5316AB64.3080501@linaro.org>
	<20140305055717.GV26981@jama> <5316DE87.7090906@linaro.org>
	<20140329232154.GB2428@jama>
	<2C0383B9-CB95-4B36-B106-B4538D93FF38@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2014 21:43:29 -0700
Message-ID: <CAMKF1spyQjra6rO88D5kV_4QPZXfBLMNOcmG0_fsjuLV9j-dEQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mongodb: add git version
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
X-List-Received-Date: Wed, 02 Apr 2014 04:43:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 31, 2014 at 11:50 PM, Koen Kooi <koen.kooi@linaro.org> wrote:
> Haven't had time, let me see if I can fix it this week. Note that you'll need >8GB to build this, we had to upgrade out autobuilders to avoid gcc from ICEing due to OOM.

interesting. which file takes that long ? it seems a good case to test compilers

