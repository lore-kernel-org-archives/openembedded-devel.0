Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LvfbM-0000Ui-LQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 00:35:04 +0200
Received: by bwz19 with SMTP id 19so1638721bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MzxwuokwUgIgptBBavLcQU9Zro/Z4huaXu2SUItS1yE=;
	b=KhTYt156nR8I8PBEfE1QwJQHIR4fz8xKnWdna+lq63IPh5Cm6KVcgclhCfi+ur6dd0
	k8YWY7afCVuAUsa7Hgk0H7AsFQO0Jyuw8bNdpjH4HLxUCzBlaWGA7+9aNBgDoeK98N/R
	Kb445ELuyT1HYGFfMBJdAhb3yrSbu7Q+KPp/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=akyQ8k4T/mvKr2qWHJm3punhMhAHYTvWXGydmxW9ICE9RPaX+5aOTVIQ1RWN3ypLV7
	c5nHa0xglNatMZ+r2bC2D6k2znqaGuxWLE6O0ciY05FvdjyQgDmp1R226yGYL0EnD3Jl
	nQW84XVEy4vQHKSuSb198ebxw8tsivrVxO5UU=
MIME-Version: 1.0
Received: by 10.223.111.134 with SMTP id s6mr1381829fap.37.1240180247571; Sun, 
	19 Apr 2009 15:30:47 -0700 (PDT)
In-Reply-To: <49EB7194.2030307@gmail.com>
References: <49EB7194.2030307@gmail.com>
Date: Mon, 20 Apr 2009 00:30:47 +0200
Message-ID: <d1b08f940904191530vc2961fdqffa694a6d8c9fe94@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [BUG][STABLE] bluez-utils fails with stable/2009
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Apr 2009 22:35:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

slightly different problem in angstrom-dev : bluez-utils compiles but
then gnome-bluetooth fails on obexd.
(At first sight the headers are provided by bluez-utils).
http://tinderbox.openembedded.net/public/logs/4506615.txt

Issue Bluez3 vs. Bluez4?

Regards

Andrea


