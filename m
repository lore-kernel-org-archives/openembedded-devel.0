Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6829460017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:18:07 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wo20so773259obc.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tCycZR8DFyBWZ4nIzjC3ZTKwOm6d42PZahvHK7gYCb4=;
	b=gL/2ly+k6m5xZ/r4f29KNHk1JS6c4lO0BN5mEYesKplq7vHzsOKfftBCzdgdPpUXYI
	xx5AquuKecyp6GNIwFCdELDWwHUvghUOoRB640fGw2tguYxBybyskTNXOPYNJlA9SXaE
	CBPFR7Ma976VBuSMiO8AR/M0KKyoNG7Aeg3BitRdca1dZqo9TS7BhPdwgZn8MN9drzDf
	rlg9MvBcvBfZNB4sw5uE46jYF+rOhvCLBan3dEuz6uwIoLEDqfmKIRSEhm8/FDvCF0dM
	FPupOIQ9HpmWs1iCrrt986f0Xv7mT5lUcWjXVchcE57+CS0NQEkElaHoJ9txcGO7kgQ5
	Hn1Q==
X-Gm-Message-State: ALoCoQkcgky4m2nmYj++EkPZxNXMX3tf/T6wQ8YIYs/bOGh2JgjUWP+fkWWIhoIIgA7hBTl6YwMa
X-Received: by 10.182.188.73 with SMTP id fy9mr4077634obc.68.1393539487676;
	Thu, 27 Feb 2014 14:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Thu, 27 Feb 2014 14:17:47 -0800 (PST)
In-Reply-To: <20140227182505.GD26981@jama>
References: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-2-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-3-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-4-git-send-email-nicolas.dechesne@linaro.org>
	<20140227182505.GD26981@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 27 Feb 2014 23:17:47 +0100
Message-ID: <CAP71WjzsoSKw7sArFk5ZZTR0tM9_796maHzRgaY4wt+aTe2PWA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH dora 3/3] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Thu, 27 Feb 2014 22:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 7:25 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Conflicts:
>>       recipes-qt/qt5/qtbase.inc
>
> Please drop this

oops. sorry. i messed up with my git aliases... and resent the same.. will fix

