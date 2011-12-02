Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWcjt-0002eG-6o
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 00:41:57 +0100
Received: by bkbzv15 with SMTP id zv15so3717574bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 15:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Vru6n7rrPIwX8uOdFx1dIqL/WJmpTAg4jcHBYkIExtA=;
	b=sUq7xWOj1x0P23dwxEPYvGyGJ9umffro4X1giy8SVM3hYwZhzm7pdvpLNCaNZIGwQL
	FKnuhelK//qcn9aOwT+zipyW9Mj1xvgXVqJbAdxYU1bCwdvemvVNf1xziZeUIon/gxnW
	24ep+oSXJuBe2iZwv6TqSKCfpXAvRCEjZVWxM=
Received: by 10.180.102.162 with SMTP id fp2mr448324wib.50.1322868913403;
	Fri, 02 Dec 2011 15:35:13 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id
	fy13sm12712644wbb.18.2011.12.02.15.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 15:35:12 -0800 (PST)
Message-ID: <4ED960AB.5040502@googlemail.com>
Date: Fri, 02 Dec 2011 23:35:07 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
References: <4ED8307F.2060306@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
	<4ED92FC0.2050502@googlemail.com>
	<201112022324.09104.GNUtoo@no-log.org>
In-Reply-To: <201112022324.09104.GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 23:41:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> If you don't need Xorg,Try recompiling the kernel with the framebuffer console 
> built in.
>   
I use bitbake to compile/build everything - how do I get that done there 
(I presume there must be some sort of .config file somewhere)?



