Return-Path: <net147@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7479671637
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:01:19 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z60so11576453qgd.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 16:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QPibniuhY336+rMrpShRGnuKWQ72m3wxd0aLZiBAdyg=;
	b=FbyFwdHQ8f+FHhUGXdF5lVv6UuxpNnGI/jBYjffmN9ugLYc0OrKCMkEIRLMV3j9pse
	ZgHYV5mUqmNOBNMmVjWBaBte/WepNFR3Phr5jYLeXlFoDtLPdZk26i8f5/ZXnCPNAudu
	TOKYDJdk4RURz7BGTEImZw4N9aY/P8LJVxzh1U77+GXhUyDOmseN4sJwiaWVOjNdIoLT
	Vmt0Oh2q5aKuupa4ucaQGoNQMSR8NmKkJDMWYcU/Aa06b4qteCyWyGeyyC7THX++WJBZ
	YeiGjv76hQa5SSVd5Mt288q3yHSgcp8xzv+8+A/KN0geeSm5+0o/Fg9LEfiE8isFgnX9
	hV8g==
MIME-Version: 1.0
X-Received: by 10.140.104.13 with SMTP id z13mr22543594qge.76.1424995280573;
	Thu, 26 Feb 2015 16:01:20 -0800 (PST)
Received: by 10.96.56.100 with HTTP; Thu, 26 Feb 2015 16:01:20 -0800 (PST)
In-Reply-To: <2271195.WOsUHlN0Xa@fridolin>
References: <2271195.WOsUHlN0Xa@fridolin>
Date: Fri, 27 Feb 2015 11:01:20 +1100
Message-ID: <CANwerB1Y14UMLkG9aCuWjQrcNeKc5OB=hUAZJc3ciSkL-dNzgA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Stephan Binner <stephan.binner@basyskom.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] fix build of qtbase with "gles2" package config
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
X-List-Received-Date: Fri, 27 Feb 2015 00:01:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Stephan,

On 27 February 2015 at 00:11, Stephan Binner
<stephan.binner@basyskom.com> wrote:
>
> ---
>  .../qtbase/0014-fix-build-of-egl-integration.patch | 181 +++++++++++++++++++++
>  recipes-qt/qt5/qtbase_5.4.1.bb                     |   5 +
>  2 files changed, 186 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch

Missing Signed-off-by line.

Regards,
Jonathan

