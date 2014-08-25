Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 57405601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:51:00 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so20895743pdj.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YPsH0CxivSEIeZT+1XzH0hFjFBZrpuZtYig7/sjt4UQ=;
	b=0z7LmompBSpsfg2+4ARYKSzmHGUKwb4i91LYlkCvije42luwHK2elXEHUZSKRl6s4d
	cdt6PrLimRoLfkHPO5TVfE3aLaq6ALV3MkuxJnPW5opkjzoVzBgAI16mdsXQjM90y/at
	qjDyuUBqgca1WQviJzr1xEnbHorF0FFnVPpGZnD1hvvxZjFs9UpTOrjK/FF1wpOmAQHw
	Hv7EFOR99X+/cVzIUXyrlSXZrFeYisnR1tUlUska6+EEDXL6135sRmzgjzowpN6kS56D
	0VtlZP8miBHH9RHduvWepzsaKuecVdko2j1qnregY6EfYyTtuodWHG84YXRXUs5/IImz
	J/yg==
X-Received: by 10.68.219.102 with SMTP id pn6mr13591291pbc.135.1408992661140; 
	Mon, 25 Aug 2014 11:51:01 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	bq17sm1316445pac.47.2014.08.25.11.51.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 11:51:00 -0700 (PDT)
Date: Mon, 25 Aug 2014 11:54:43 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140825185443.GA23339@haswell>
References: <1408991911-47249-1-git-send-email-yasir_khan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1408991911-47249-1-git-send-email-yasir_khan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH] lmbench: add lmbench-exception LICENSE
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
X-List-Received-Date: Mon, 25 Aug 2014 18:51:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-25 23:38:31, Yasir-Khan wrote:
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  meta-oe/licenses/GPL-2.0-with-lmbench-restriction  |  108 ++++++++++++++++++++

Is there some SPDX compliant naming convention for this 

