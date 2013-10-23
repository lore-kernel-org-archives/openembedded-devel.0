Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 55F796CF3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 07:54:42 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h1so430322oag.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 00:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=keiXOe3RAihaCbFXsUP5Uoo8wVsHzGe2Ny/ovaIT6mY=;
	b=dVCtd0DISN62lwuG4qgrs5FEmRn8vNzvh4xuHq3nIBtvW/NgC7VflbtirDizgY1uSO
	N3h9u7JwYm/DIMGyGWvgFRSlqN3mgd7yO3IkO/IgyJjbvzuO5xMGglFPyd3PVRquJRT3
	9smLV+LQe97P+0OlPjC+GvKjKJ/7auro6N1Loin3Bgn2KzP/DE4/Q5UomU3zBGPKgRQK
	D1lU5vOwgo5exB6a7185Mahyxwjyke9N+qgklUKSga/iGuUiARD4rcGoh5+ZsuHyt/Jx
	+WkytKnhB+T7T+foILZpxyFaelxzBxWDzpdpNwrE6RKiYchZIGQPiqvgvRJGUHNVaifa
	1OuQ==
X-Gm-Message-State: ALoCoQkCLKWvM6hauPaTQB3eI3NGzvNMav1Au8M/5TeqzFnifspAWxHjbzUkBMKRspwD/9CHcZ+L
X-Received: by 10.60.52.101 with SMTP id s5mr240519oeo.56.1382514884022; Wed,
	23 Oct 2013 00:54:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Wed, 23 Oct 2013 00:54:23 -0700 (PDT)
In-Reply-To: <CA+chaQfeObe0k1HODrGj_V-FFgswcRTPdzuNeb0ig8HLXi3wJg@mail.gmail.com>
References: <1382456281-16216-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71WjzvGpG3mNf5dEQd1HuBgTc+41iJ6915EDQydUxaX7aoeQ@mail.gmail.com>
	<CA+chaQfeObe0k1HODrGj_V-FFgswcRTPdzuNeb0ig8HLXi3wJg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 23 Oct 2013 09:54:23 +0200
Message-ID: <CAP71Wjxai17ZpaPGM1rkWpObiBZeMC1V+soGrZ0wYMzmWkREhg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] qtwebkit-examples: add missing RDEPENDS for qmlplugins
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
X-List-Received-Date: Wed, 23 Oct 2013 07:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 22, 2013 at 11:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's OK, but it will take a while until I'm back to actually merge it.

ok. no hurry... it's a patch for a minor issue ;-)
thx

