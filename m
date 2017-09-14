Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D70BD719C4;
	Thu, 14 Sep 2017 23:45:05 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e199so498291pfh.3;
	Thu, 14 Sep 2017 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=y+GpCH6qgJIwMTobBJ9xA8rD3RXQALI8LV8O6Qbu4g4=;
	b=aGWJ6JxN1e0ahwRw9USdqKcx7TWKAqPruG6HsD1vc6Rgj+olw7YaCCwQNpfi5xz5uU
	b/lxcne2ud2UF+VKAk8uELuAjAfHexsPWjkB/xj83hdLrrxLD3aeSdZ4ePCiL8nfLR8V
	fuiLscDHVjHzIjxwP7HAR9WvlSvu/zMbv27D+bnO05LPfl7cyEg9qHuk+hbyC3ilSdfd
	nyPkyWTAr2L9RYNDmQu2FQXcIE54tQHhapPIZCimn8VrQgVFUegEBh3nSjzxTl+5vjd5
	P7EhQ/jNdAbb6zo8dati9stvYDszT247Qzxndmk2KBBOu56NXWMrpvYsMmcFkvN7UiuB
	od0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=y+GpCH6qgJIwMTobBJ9xA8rD3RXQALI8LV8O6Qbu4g4=;
	b=aE9dvTvNuGShAWIIu2uTxbBNrrCnD/wtZ4N7ospzK2bfVtyDpgqkWo9slqgsSFD9Uh
	Wa8SKuJLSTgUeYF+a41p4QHnUaBOKfX71WsSUH6zYaAuVozwVuQDHbCjloIkBJBkWk3h
	CcAymo3icLTBlbugTQmDrIIRXyY8PWstrdihu5dFoYZrrIndiqKQnMQPMR9FtpJzNYp3
	UV16MSebwdG7yk00ti5YgNVe0UI5i61WX2B6xQNVMiJAUcaa/rBxVkylT2cpCVXJhKep
	Q/+R0Gj0PLTK30PLlhRz2v2el+55fmhZPv+QlLB/dBe7Qddkg9uHVBqBL3WIXo+Dy96l
	Poww==
X-Gm-Message-State: AHPjjUhnhmFEwIyus4gif5B1W1cx3IYTJKSvzmwUduGug9IiotG9UqKG
	PwFxQe6ZGNhEaYYj
X-Google-Smtp-Source: ADKCNb7CYZr2RWWUsxIicrAaEZiHn3R0YDQUNW1byxOCqNsy2E2n7beK7SsEuLDGawuje/9jf9ZaXw==
X-Received: by 10.99.111.9 with SMTP id k9mr13665386pgc.439.1505432706693;
	Thu, 14 Sep 2017 16:45:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:8059:611f:1111:1f0c?
	([2601:202:4001:9ea0:8059:611f:1111:1f0c])
	by smtp.gmail.com with ESMTPSA id
	g66sm37398782pfj.161.2017.09.14.16.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 16:45:06 -0700 (PDT)
To: Jeff Osier-Mixon <jefro@jefro.net>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CA+YB3rZCwnyLaogUF1iyX01XQuZ8MzfjFE--KSffW7YzMAAq6Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5008540a-cf80-328d-1388-eedff7830ad4@gmail.com>
Date: Thu, 14 Sep 2017 16:45:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+YB3rZCwnyLaogUF1iyX01XQuZ8MzfjFE--KSffW7YzMAAq6Q@mail.gmail.com>
Subject: Re: OEDEM : venue change
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
X-List-Received-Date: Thu, 14 Sep 2017 23:45:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/14/2017 11:12 AM, Jeff Osier-Mixon wrote:
> Reminder: the OEDEM page is at  https://www.openembedded.org/wiki/OEDEM_2017
>
> The venue has changed. OEDEM will be at the Jury's Inn, across the street
> from the Hilton.
>   Lunch and coffee etc. will be provided on site.
Do they have beer?
>
> Let me know if you have any questions, comments, rants, etc
>


