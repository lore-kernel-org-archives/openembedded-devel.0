Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F12D073DA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 12:43:38 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so12027947pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ShcaqPFCsnLtE9ifcse1/uKNtK8fZLYVPmNg/yDFqiU=;
	b=OZx5IdKRyptH/zxBdxnFaXpCX9Nn4CVEG8KtXzrSpDg82BzMqeRlqmslQEIxfL2ila
	ciGbjfIgfiIWa8Oy4WW9i1WKU1Ltn46LPAoQVGaV1ekSzTSuITO98SJtkzxV6zblPOIB
	1ikyzNSSNWzuw7ZyEzWVJ0UGlwO2JTDwu/0Tp/kmwuAeO9DhaIt93tHgaW2GZ2ZE2FYd
	iV7LsYflQdyta5Cix7+Npzoru+SH9T7PGiWPU0kJOxZzgACEl70Wz69/N2zJWtSCkq6t
	l+7iXLKPaxYgJfBSzgtMKJ8bGVvt+O08/LSSmr0qf7uXlkdZbT+YJoRMeXi6lwx2RPaE
	rqgg==
MIME-Version: 1.0
X-Received: by 10.70.96.194 with SMTP id du2mr18229902pdb.108.1431693819316;
	Fri, 15 May 2015 05:43:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 15 May 2015 05:43:39 -0700 (PDT)
In-Reply-To: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
References: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 15 May 2015 09:43:39 -0300
X-Google-Sender-Auth: Th7myW8-AGC2kz_wGvzCAs3esu0
Message-ID: <CAP9ODKrBRj12Uq1YD8eu27WPnJYXrK=PtS8NoyOGGgPN6OAvCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] cef,chromium: Separate out installs
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
X-List-Received-Date: Fri, 15 May 2015 12:43:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 14, 2015 at 8:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Use specific domains for installation, so they can be built and
> installed in a single build
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thanks for addressing it.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

