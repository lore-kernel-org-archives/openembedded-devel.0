Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 572F07237F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 13:58:28 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id tp5so4574634ieb.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 05:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=OkkSk2HlvxUTWwE84M+sdj4K8X2VQkxP23gVto3e/DM=;
	b=KDJUfuH268WnUnOppYNuXCThraZ/tdh1Sz5bQL4LnF3rMPxCc9GucuQCH9/zeM8oxv
	cT1JEXTOeUtbgoRjiqV89+a9DSPnQ2yEYJ+cpLXhR32f68zBUvtmxvG4u0yCaZ4D8NSX
	JObfGjRaxWEytAg8Au/05TAKLxXjoTkOx/wJhbFaDSYsBiRKauVgwub4lAe4U38Cja8+
	Rwr9OedXdOWKC7kBtMTdYZY/1fim5P5urgfIzacjtq8chnmszN7BEoEgy7BKBXbGFEk/
	HVL4ukgknSxyFL/0d3gXBgVM7qhHPnoZRa2gtl1639GSpd+8V0zV76gNcP+CEd6KHeM0
	goXw==
X-Gm-Message-State: ALoCoQn8WwphKO9VI6Ry292QX6TirnbDO4snZNXylJW4cNT9ytzusDemD8w6X2k0VRp35v6kO8DS
X-Received: by 10.42.29.6 with SMTP id p6mr27734344icc.85.1417096709494;
	Thu, 27 Nov 2014 05:58:29 -0800 (PST)
Received: from [192.168.141.122] (dsl-69-172-74-189.acanac.net.
	[69.172.74.189])
	by mx.google.com with ESMTPSA id m2sm3550458ioi.10.2014.11.27.05.58.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 05:58:28 -0800 (PST)
Message-ID: <54772E14.10302@linaro.org>
Date: Thu, 27 Nov 2014 08:58:44 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417082531-12508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
In-Reply-To: <1417082531-12508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] twm: Upgrade to 1.0.8
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
X-List-Received-Date: Thu, 27 Nov 2014 13:58:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Perhaps the -M option should have been used here?

