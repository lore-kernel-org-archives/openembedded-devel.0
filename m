Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id A86286FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2016 19:53:06 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id o11so219018772qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2016 11:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ctuM9val1MtD+GecxgX2x62ZuMCVfHEdB7EOpLe3t30=;
	b=z4vJs67OeDeZ75S7iCsgcw0vXIfTjK4IdmR5ieSrB86mlkQbG2cvG+WPRgZRWmLPhx
	xie/hkIbPWeKuRuJm5qVy0mm1qUL/NAwbRrE/TfO+twOXcPBVWIeKxVvz8he7IOekJWi
	xu3W8ePlG3uGVwx/Fnez0CtoaAmRi4n7tgPKvgQNFsmyzYrVWDUaWr50ppJisTom/Ddy
	wbWnEqVNO3suoJzq2qjwWzvr/LhTODwp1Y+VdWaPd9+DOKvksrNxkmpVHYeDHcQbDpLt
	ynHTRm6K47er4UR4kBzlszKHIkqXkhkRUaldDckvxcQ2gFTrgC2xBdDl3WE96dSJwnSQ
	JyWQ==
X-Received: by 10.140.155.87 with SMTP id b84mr44858768qhb.29.1451677987512;
	Fri, 01 Jan 2016 11:53:07 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	r73sm1549914qkl.32.2016.01.01.11.53.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jan 2016 11:53:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
	<1451677511-7346-4-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5686D91E.3030400@gmail.com>
Date: Fri, 1 Jan 2016 14:53:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451677511-7346-4-git-send-email-twoerner@gmail.com>
Subject: Re: [meta-browser][RFC PATCH v1 3/4] chromium_40.0.2214.91: API keys update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jan 2016 19:53:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Oops, looks like this patch got messed up. My git rebase foo isn't as
good as it should be ;-)

On 01/01/16 14:45, Trevor Woerner wrote:
> diff --git a/recipes-browser/chromium/chromium_49.0.2607.0.bb b/recipes-browser/chromium/chromium_49.0.2607.0.bb
> new file mode 100644
> index 0000000..0b2c8e4
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium_49.0.2607.0.bb
>

[snip]

this shouldn't have appeared yet

