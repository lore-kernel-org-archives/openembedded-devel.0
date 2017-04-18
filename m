Return-Path: <sadlife1990@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 55C66719C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 05:41:32 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id j127so63573902vkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 22:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=YliBhGvmhHbwPODHwoh+xBekl3XkydE6p087QYFJ92Y=;
	b=TY8aSxsRpYsu8AuOamW6fUWs+0aE34yMRQLXpJ050zrwV5Lb4JdOjeuiROXba1BjJH
	3MAve6+YBBQ13/abPzTBVcJ0w/bSPP5g0xhlGkR1rIeLGJyYEzTsluZrHROa4hBST1bZ
	uyKLPYxGVuDS9omwTTuXwnnTdupGWx7vKLPyfs0kx/Ac5cXVEJfl9dAi+XRUYwlAuPRT
	hXBuYjHCxLSuihrhyiMsJIQNgOrU0Z0PkkDsh86cucHI8wCl9jJy8w3KwITppIdgiNCZ
	p2peq8ZfK/QGE4uYB1BcJN7/cfIfPFCoOiNTEP31WMU5vo2u6xX6Eu3hTKBpGWWj8L67
	5RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=YliBhGvmhHbwPODHwoh+xBekl3XkydE6p087QYFJ92Y=;
	b=n8ysIHibKKWPfXcUwVFjkLwSwpSo+rj5WxMz0kBQGwcbR2HcPOkyih3743Alvrmrwh
	o1XM6TXr24Vup0zAW8M/SWuGzMWQBWAiSi1H3f6233Ue1PvJ8Te8Gf0OirWF3JHegLF0
	GwJIsdF5kuSvP4vLtbYAm2eHiwFDF4nmiVEZNTeOLfVALTw5Y52vTL1mblwBFjZ5VlDO
	c+M5Y3hSDovayrcxojp8gRsGrYAMPM7E24amli4I4GavDiDcvNaBTK3+cBMiXqTw4W7t
	dhHlxRCGptAMyxzxTwBOGnBMRtuR6eqWrN+BvKtfNsNOsX2hV7f2CnQH/cp8Q/llcODx
	4DYA==
X-Gm-Message-State: AN3rC/7BH6pTqTaNSkKxowziZwX8Q0rj2yDJjI0nQsOw9oB3d4QEj2bb
	JtTZQHnMnyjFlCPRDRIFZS/XS1y5lw==
X-Received: by 10.31.124.138 with SMTP id x132mr8213829vkc.120.1492494094195; 
	Mon, 17 Apr 2017 22:41:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.105 with HTTP; Mon, 17 Apr 2017 22:41:33 -0700 (PDT)
From: Weng Josn <sadlife1990@gmail.com>
Date: Tue, 18 Apr 2017 08:41:33 +0300
Message-ID: <CAAHuHfziqOC7STraEL91kXudDUy5zc4GEGhnM9vEPAXiSUVXxg@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: cups: 2.1.4 cups-filter build
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
X-List-Received-Date: Tue, 18 Apr 2017 05:41:33 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I'm testing cups: 2.1.4 I need to serial backend support. How to compile or
enable serial backend support ?

Thanks.

