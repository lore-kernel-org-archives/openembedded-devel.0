Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QwHQd-0002qN-9o
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 19:39:51 +0200
Received: by ywa12 with SMTP id 12so1011720ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fe0VF3vZNIdI0/4foBLt98k2ilSx1ZOQyTVyVkoc8Og=;
	b=P6ct8Y6BL6W/MOCJIyQqaAbKh2xVNDLQU5UX48YBeTPPQZTHuyslaPMekENyKbIrVX
	iT81HUWta5sfcQYTr/TBuVj82/XQwOjqJDJ9pXZBYTFM5yA1sBFk50SjkQU8scZ4kGRR
	ssZWgA3HDlyXtz4lPcv0DJLmMtG92g7fmTyIs=
MIME-Version: 1.0
Received: by 10.42.135.129 with SMTP id p1mr4566857ict.37.1314207303729; Wed,
	24 Aug 2011 10:35:03 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Wed, 24 Aug 2011 10:35:03 -0700 (PDT)
In-Reply-To: <1314173035-11491-1-git-send-email-noor_ahsan@mentor.com>
References: <1314173035-11491-1-git-send-email-noor_ahsan@mentor.com>
Date: Wed, 24 Aug 2011 10:35:03 -0700
Message-ID: <CA+M6bXmh3xAkAVYjDvpkaTe_pXyAZQpEgnpx0tX5_pbtLaf9Yg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Wed, 24 Aug 2011 17:39:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 24, 2011 at 1:03 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Imported from OE commit id bac6441118e0b78d55c98afdc108f03b6c655909
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

NAK, All of the patches are missing the patch header described in
http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
and I gave you some of the infos you need for the patches before :)

-- 
Tom


