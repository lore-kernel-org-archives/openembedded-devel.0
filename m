Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 08DC26B711
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:39:12 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so204434yha.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=vfJX/pryTzAUqi2mDZWy3DqYEXIFmc4TWHXNlLvBbpo=;
	b=CXMzzyUX4RaclkSzGyCQ/0xNZnuiqCdcQXis4tQjrsM9P/VEYXNDURr4kgj96uuVK7
	P/DRuBO/P/AukiRSznRhrrikwwqiODrljD1scvlxSzs4Wmge3eI3hq0l6W9Vwwy3mgVY
	AkLJSXCGVVtOSmg569UNM3GK8H3DP9MqJGwsc/cZJ1+IzImuT0r9bemu0XCs0SF19r83
	4A/XmfSVGdSDYtiOJKVGAg51ra81gD4m0jiKu4VCTc8FqVIJoZS96+3pYpuXa11JSQm5
	wnodaRQBvSdYIvoM26HV4kxPt+h9+bww7HiXpkDM0cImD3K3l0+l0Puln49xNkVTWHUz
	kJzQ==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr29221424yhi.148.1401925153397; 
	Wed, 04 Jun 2014 16:39:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 4 Jun 2014 16:39:13 -0700 (PDT)
In-Reply-To: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
References: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
Date: Wed, 4 Jun 2014 20:39:13 -0300
X-Google-Sender-Auth: ADoSgpNjecykv8zRNq61AfTeqrI
Message-ID: <CAP9ODKpDRfdG_zw6jVpCxBHEd5VX+1FxfsNBwdDkOnhNvD=JZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Upgrade geode video to working version
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
X-List-Received-Date: Wed, 04 Jun 2014 23:39:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 4, 2014 at 3:40 PM, blloyd <blloyd@familyhonor.net> wrote:
> The latest version of the geode driver is 2.11.15, which is fully functio=
nal with just one patch to fix an error when building which all warnings tr=
eated as errors.  This update upgrades to that driver and adds the patch so=
 that this driver can again be used under the open embedded build system.

Please rewrite the commit log to adhere to
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

