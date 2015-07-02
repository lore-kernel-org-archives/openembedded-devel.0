Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6D93E65CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 11:46:06 +0000 (UTC)
Received: by obbkm3 with SMTP id km3so47633249obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 04:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0exGi3CkgJ/MAkMywz5aDQWX4Ly5nhzxQzv+NdlGqlI=;
	b=XnqqVvheZ/PzGqQSakaJvc/BUsQvPnwdwsZUyzTjIcmJtArmnWFgyAV1PtG8k8Fqj5
	i7lg4k7bC4fUrEk2quZYUhP9RgG3TuxwCQDGGXIjvLdas8IBXRQFHpsvO06qR/8O6n7v
	8lcJz6A+0o4nmqfpbq9kPJc5/W+L8MA9QtBDY90w2ZuEiIE8rSeP5ZrzzXlPa7eEtCLG
	KbZySchccHVMXC/XfpmBukSQwQMuYX/yVCJC7H+HVmEnu82LTxsGnkh3ExoQmk15vnu4
	aEKiwiuqb1vJlPN1q6R3s0+akU6WIfs+JpBmKFOwnoYegqz4zFxV7Jps4gx3d1TWjE7o
	DKzg==
X-Gm-Message-State: ALoCoQnXD3GFAjyWqWsHCCvR0dWFLEiits+eQ1nc4TCsXHnerOQBV7ZUw26SuQ1MhxxhD5pEJM5s
MIME-Version: 1.0
X-Received: by 10.202.188.139 with SMTP id m133mr28642971oif.73.1435837567107; 
	Thu, 02 Jul 2015 04:46:07 -0700 (PDT)
Received: by 10.76.147.66 with HTTP; Thu, 2 Jul 2015 04:46:07 -0700 (PDT)
In-Reply-To: <5593EFFF.4060502@gmail.com>
References: <1435741531-30306-1-git-send-email-net147@gmail.com>
	<5593B688.4070304@opendreambox.org> <20150701131955.GH2409@jama>
	<5593EFFF.4060502@gmail.com>
Date: Thu, 2 Jul 2015 12:46:07 +0100
Message-ID: <CAGrhNMzBoRf=bpSk4nerdBHemCET8bVgMYtc6SLR5fGOdKUHWQ@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] libconnman-qt5: new recipe
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
X-List-Received-Date: Thu, 02 Jul 2015 11:46:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jonathan,

On Wed, Jul 1, 2015 at 2:49 PM, Jonathan Liu <net147@gmail.com> wrote:

[...]

>
> I have successfully tested building the recipe with an application that
> depends on libconnman-qt5 using both the C++ and QML bindings and using it
> on the target device.

Did the SDK worked as well?

Felipe

