Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QwHRs-0002w9-H2
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 19:41:09 +0200
Received: by ywa12 with SMTP id 12so1012752ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YUOiMj97g9Hgb9bbZ64Fn/MQx4BYXyw5TSAZmnTiRZ4=;
	b=MLY64eF/8VjfRuKnxROERgLmZ0fpELzEWzMGI63IjWX/Kn1QtUxMJHwzQfYttD7l1Z
	pkRVQQoKHJVnDPB7PFslIjDpaas2Zu1DelzBgBDwNV4Hij3BCXFF5pCgaMTjre73D35N
	dbB1dVWbfqU4p+kjpihPLIKCPM36WqW3nd7eo=
MIME-Version: 1.0
Received: by 10.42.162.193 with SMTP id z1mr4645497icx.305.1314207381561; Wed,
	24 Aug 2011 10:36:21 -0700 (PDT)
Received: by 10.42.220.70 with HTTP; Wed, 24 Aug 2011 10:36:21 -0700 (PDT)
In-Reply-To: <1314180314-31060-1-git-send-email-noor_ahsan@mentor.com>
References: <1314180314-31060-1-git-send-email-noor_ahsan@mentor.com>
Date: Wed, 24 Aug 2011 10:36:21 -0700
Message-ID: <CA+M6bXmEt-jL2H1SN8nKG4qjL0HKgLe4_oQjndBFUe=s-GYRHw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] iperf: Add version 2.0.4 (initial recipe)
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
X-List-Received-Date: Wed, 24 Aug 2011 17:41:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 24, 2011 at 3:05 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Imported from oe.dev commit id 0ff10ecb88de73074ae4857046643cef15dc4e97 and c10c33f86903c93611023197a7f812459c2dfe2d.
> * Combined .inc and bb file from oe.dev and made a single bb file.
> * Removed EXTRA_OECONF_append_epia = " --disable-threads" while importing as this should go in epia layer.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

Also all missing patch headers.

-- 
Tom


