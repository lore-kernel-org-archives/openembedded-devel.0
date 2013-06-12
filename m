Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD2E6A96F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:21:50 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so5858707pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9h3uOc0kzt4WhPYTVAebXk6wZqwZn7XqAUUUZqCrP+4=;
	b=s/LbkUtVGPLyfi57z86zpW85kVIJEEEdFV+w6pdDg0DJNsHXyW1d1yvx3EqxOFX+66
	QIZvgjDNmk8X/sWQKsWXkqzTXMRsFtMi6y0AOcZDC/zsyCVPypFvcxvpAucBo1ZlSIhk
	bsa11xbUad4UozQhkGtQt+WZlwOXAluSDsJ1VZxFKMblnPPe2CH75Fi2lVkb7eO2m/f3
	2swOvgKLQzdI/+Cn3PRypckBzLIeNxaU6oUC72UO2QN8oPLTBKTQJPWA86XmDh8p8ig2
	mHhGfD0ZUAMcm2q+ZCVFcc6fmcE05dW6SPE++7eUMqmZKVWHf6OZWs+QqIkLSzfthh7X
	owTA==
X-Received: by 10.66.13.202 with SMTP id j10mr23835812pac.181.1371043311281;
	Wed, 12 Jun 2013 06:21:51 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	nt2sm19156085pbc.17.2013.06.12.06.21.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:21:50 -0700 (PDT)
Message-ID: <51B874C9.9050502@gmail.com>
Date: Wed, 12 Jun 2013 23:16:57 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370234596-31793-1-git-send-email-net147@gmail.com>
	<CAMKF1srnBig-TwFvpM781cYJrk=V3X9KWnAZC7Pf-SaSHdn2rQ@mail.gmail.com>
In-Reply-To: <CAMKF1srnBig-TwFvpM781cYJrk=V3X9KWnAZC7Pf-SaSHdn2rQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] llvm3.2: new recipe
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
X-List-Received-Date: Wed, 12 Jun 2013 13:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2013 5:56 PM, Khem Raj wrote:
> On Sun, Jun 2, 2013 at 9:43 PM, Jonathan Liu <net147@gmail.com> wrote:
>> arm_fenv_uclibc.patch was copied from llvm2.9 recipe.
> did you check if this patch applies cleanly or not
Yes, I did check. The patch applies cleanly.

Regards,
Jonathan

