Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 709E172588
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 12:54:09 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j7so1911904qaq.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 04:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=kUM2WgbWRuJe2/b8rkW22yYoWlcxTmJUESnRuLJEwxM=;
	b=gQCvM8q9iGzwZScUFPRR+2r9+MkrCO1qLFGE0r3D+3KbMxV+IUbZ5D3koysjddZsdJ
	nypk9gVEuCwO33vanTy+rcguSUarqA8oXLJj4pTrVgpFP1cr+lZ1/hbA5RlUfAxGVMDo
	ChmzSpzvp2+GUYz1LqRS0W3MXCqGcBq1Ppu0FGcqoEP5v6+mL2QL793uP8Q+WlQqAjoH
	NaaPzwgEq7hr8dh9SsAPxza+4BA9XB11PT1BAasIB3GEuGqlCd2DbvLFKhIDchiKYySa
	VGORxM1ZzWAfTE66yiqulb9hjKb6Q5pL9R4PoGitKiUWM8smVegOvtgDQIe4T9nP7/ex
	AZhg==
X-Gm-Message-State: ALoCoQkV1haeYXlfqFbzpU11fFGhuUzOmuP9Ch86HBRw4nZjbWc4yOLDI+K+XvdX9uq/b8Bb1tev
X-Received: by 10.140.96.101 with SMTP id j92mr7504656qge.87.1418216041977;
	Wed, 10 Dec 2014 04:54:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 10 Dec 2014 04:53:41 -0800 (PST)
In-Reply-To: <20141210124443.GD2473@jama>
References: <1417457354-6636-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<20141210124443.GD2473@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Dec 2014 12:53:41 +0000
Message-ID: <CAJTo0LaBHmNquUtsnXFv+71G00mGO58i1XVhnFeFJG29=oahZQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome][PATCH] gsettings-desktop-schemas: Moved from OE-Core
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
X-List-Received-Date: Wed, 10 Dec 2014 12:54:18 -0000
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 12:44, Martin Jansa <martin.jansa@gmail.com> wrote:

> Is there patch to remove it from oe-core?
>

Thanks for the reminder, I've just removed it in my staging branch.

Ross

