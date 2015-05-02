Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E93A60024
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 May 2015 02:34:21 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so106814315pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RXX5emUm24xwIJOZdGfE30VcqYoMkxkVqZNC+I5oeuU=;
	b=e2gUgSJXo8EKTcl8UUkn0ctkz4S3gBTPTF/z2JPvq+Dyc7ie2OQnixSU/zNvJhTYqn
	CLU6Yoi4S+iuWjno9yG8OnsFNWa64BIQEnwrzph5FM9krjbCn5HbZbkbGAqElz5nDQP1
	a6tqJnFuklTKQFHpE3j/VyqoIluc9BxPqUdT/gdylpLZ14O6jffquVD5+3NbPK8ybuxI
	xCVCYJKEoT5QT4OPUDvUTcKhL9tL6mA+rqCNZHwBAnDsciLj2nYhuGRjyI7fFxSrOEW4
	dLGTllbOpIeiRqwxaoDy3SaMe0sOqJURG/QpS0wVvntFcd2LD4KArTFryneWlynjnIUN
	yvXw==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr22652309pbb.129.1430534062996;
	Fri, 01 May 2015 19:34:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 1 May 2015 19:34:22 -0700 (PDT)
In-Reply-To: <CAMKF1sqNa832Bjw9fQkO=G1Xqyqc7X7uZMhyBG6xG0RquqA+UA@mail.gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
	<CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
	<5541157E.2080807@pseudoterminal.org>
	<CAMKF1spGC+4unddLJeqCuynaBeP7h62raW2RN==EeNu=SzeYfA@mail.gmail.com>
	<CAMKF1sqNa832Bjw9fQkO=G1Xqyqc7X7uZMhyBG6xG0RquqA+UA@mail.gmail.com>
Date: Fri, 1 May 2015 23:34:22 -0300
X-Google-Sender-Auth: QdyEjd1iJJxVIqd3UePZLtGdoJk
Message-ID: <CAP9ODKoJi2piKsryH19M3XgrU+K4wAb75HpSsuBTor7cjr_qcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Sat, 02 May 2015 02:34:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 1, 2015 at 12:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
> ping. Can this now be merged ?
Yes ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

