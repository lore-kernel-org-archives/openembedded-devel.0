Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T17xb-0003Nh-6E
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 05:38:27 +0200
Received: by yenm1 with SMTP id m1so3908020yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2012 20:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=DHWlZlBmzsQzE/CaLP88k8ArNOZgu0pauPt2LwHhAtY=;
	b=Qd+7cNhUy/nVSMSBdYxV7y4tyABAe9E+6bx+5qtiQMKR4ruz5TGm5MZgAkMl5PcICX
	BqJPrZ0j5x5qSD7NAzq3C6iqlXcvllI/oKZLyEh50EYIq4tYJrcNng+Kq+dp/ZovuS+F
	7G0GGh9yZtnIVaw3QG9NrX9phj/GtLK8QAy6Iqmhr5XvB4tTx4svVTJrixvrdy1LuhyD
	yqXAkQVfSaKPtHryLP0gFvhj1KgnwrAlizMwRLT3+maNgjV56bWPUk/Fzmy+3yDvUS1Q
	62p9MaScNGsPbzfP4bUnyV68lM91NbSLtu/BvBjBxLCDTeqaJfwmWPbipExGuZ/5BJNM
	enBA==
Received: by 10.66.87.66 with SMTP id v2mr27174727paz.71.1344914792123;
	Mon, 13 Aug 2012 20:26:32 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id nq6sm401194pbc.56.2012.08.13.20.26.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 20:26:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sqqVTdy4ZT8p-Z7n=KjpSos1xBOKr6Y_7NFiQ=X7E7ybg@mail.gmail.com>
Date: Tue, 14 Aug 2012 07:26:26 +0400
Message-Id: <613645AA-807B-4575-BFDC-846EFA97B664@gmail.com>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
	<CAMKF1sqqVTdy4ZT8p-Z7n=KjpSos1xBOKr6Y_7NFiQ=X7E7ybg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 03:38:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 14, 2012, at 4:15 AM, Khem Raj wrote:

> Were you able to build eglibc 2.13 with gcc 4.7
> And run it

The gcc-4.7 and eglibc-2.13 combination doesn't work, i.e. no
login or bash prompt.

I will try with gcc-4.6 and eglibc-2.13, since that combo is
know to work, since the Denx ELDK 5.2.1 released based
off yocto/denzil branch uses it.

Will let you know how it goes.

Best regards,

Elvis Dowson


