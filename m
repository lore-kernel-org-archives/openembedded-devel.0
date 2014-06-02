Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 20C4965E0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 12:45:13 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so3580171ykq.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=86xhvSSWU/lBoltID3ClrV/CrF2/6kGnIbDyjjH9iHk=;
	b=sQZrdiXCwgaIftSc8djY989CgvnJGg7HTX3vQWv8eyqw6v/xtq1SOvZV5CIDcO/dVD
	w/zJkbG2t8EBCzYdA6O61mJlyJecG0fPtoRSQyZsa3d04pJQ1Bfup/KyqlhMS0ygjSES
	jSbxStnifmnPGHFgQI9HMOoJf5Z7dQUA5240Xcw1VjJCGhzqXMvplrphQ0V2PsQI+ry5
	k1O5mg4n3JSpb2NBRpKyw4Nu2wrMKU8iArGvs445XKjEXGaWKg6MNZA6j5CZXVYvWnnm
	urqqhqoS8rj4rZ2BuC2YxZJ+Tik/uvpfeAk4/sn1SwzKHSbXbi/Tt5lLKn1OUVKUlIqn
	RoIw==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr50943493yhh.33.1401713114328;
	Mon, 02 Jun 2014 05:45:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 2 Jun 2014 05:45:14 -0700 (PDT)
In-Reply-To: <1401482663-3643-1-git-send-email-dv@pseudoterminal.org>
References: <1401482663-3643-1-git-send-email-dv@pseudoterminal.org>
Date: Mon, 2 Jun 2014 09:45:14 -0300
X-Google-Sender-Auth: 2esyF-b_qnS7eBS1q2Ek1P-Qmxo
Message-ID: <CAP9ODKotys-XZqTjY7wu1QXFjk1dW-U1v1_XLLH-z5zXozjrfw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Upgrade to version 35.0.1916.114
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
X-List-Received-Date: Mon, 02 Jun 2014 12:45:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 5:44 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> This fixes several CSS transition problems, and improves performance on
> some pages
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Applied to master.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

