Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 052FB601D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:44:01 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so12510093igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=aT5+rw94WDelhdpeIauqHeMjFqzAsbF77sBa/LPO4io=;
	b=yZPgCTH8lXPrfGZEdoH3EuvgzY8ONVsj6QA8S0axHy5iItPdVucqnEHl8Zh3Jd8BhJ
	zpakW0x4HeN+qVdZBkp+GXglGCrLdWfSGD7NyQ6R0tTUL+ommA7YEwVXp4kWyYl8nMx5
	TgI0nd2GRvs2ogBPNtkDTgwig920wJ8rDXfuReWcdjUa6mwl2dAGdub5zYajw+e/7UNr
	w33AIz3QHCTJXlaLtoLbu5SUBDYisydEJTlQIDJKURdgDDPIlEJcbZuHMdTz3B6Mt2Rw
	8OZFJ6x6Q6JnDUnti6w9fBWmA09R4mtJVWEziPrhLGOL82NZnKd2x2ZR+F1ptQ4KmUiD
	jvwQ==
X-Received: by 10.50.61.230 with SMTP id t6mr27732867igr.28.1448991842303;
	Tue, 01 Dec 2015 09:44:02 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	42sm19601991iom.6.2015.12.01.09.44.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 09:44:01 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
	<1448990151-27720-2-git-send-email-twoerner@gmail.com>
	<CA+chaQfVj-tTBhe-5SbVCrYuzA9h0TdmvN44cEvvQkAKpQGRGw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <565DDC5D.3050707@gmail.com>
Date: Tue, 1 Dec 2015 12:43:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfVj-tTBhe-5SbVCrYuzA9h0TdmvN44cEvvQkAKpQGRGw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] nodejs: cleanup
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
X-List-Received-Date: Tue, 01 Dec 2015 17:44:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/01/15 12:22, Martin Jansa wrote:
> As it was already PNBLACKLISTed I wouldn't mind removing it completely and
> replacing 0.12.7 with new version (without introducing the .inc) file.

Thanks for providing the background info, I was wondering why it was
implemented this way.

I'll submit a v2 where everything is replaced with 4.2.2.

Thanks

