Return-Path: <k4230r6@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C19336AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:40:54 +0000 (UTC)
Received: by wgiu9 with SMTP id u9so24474137wgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=BLJmO3O9qneyyLfl9G0IUXLgCeOXS2qftasPlUyCegI=;
	b=l8nSkUDh7u9NZ8ElY28yVaHlONXteFU3lX/uGcfe2tOMuXuL2KBHcTUL2An9LWR6rN
	q623TzqinNpK2B/s+VWeT0A/P8mj751igav9hjQxnXmwLd1Y/9cQ43Hq+/7g9PsMGmbG
	Bim8gb9JqHeaHKHFu0BYUjLQMk6AdEs3F41NNLPHLDz9ToUjOgskbP+G1nL0ZN2USKt9
	MMTn3xTCgz2MOmD0gA3F9yPv/rl2WEg3iF4PClD3DJFg46UzG9gBz+27aNES6W5VtHQG
	cSmYEG/k806AL4jpnnkFy1zamkxxDhaqXLhgC4MDTkGrY22FEO5BhEdzjmFA3tMIWRbu
	xdaA==
X-Received: by 10.180.107.38 with SMTP id gz6mr5158973wib.63.1430840455238;
	Tue, 05 May 2015 08:40:55 -0700 (PDT)
Received: from [192.168.23.113]
	(HSI-KBW-46-223-216-155.hsi.kabel-badenwuerttemberg.de.
	[46.223.216.155]) by mx.google.com with ESMTPSA id
	mc20sm16712139wic.15.2015.05.05.08.40.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 08:40:54 -0700 (PDT)
Message-ID: <5548E485.6080505@gmail.com>
Date: Tue, 05 May 2015 17:40:53 +0200
From: Christian Ege <k4230r6@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: ODROID-C1 support
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
X-List-Received-Date: Tue, 05 May 2015 15:40:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Hello,

I've created a BSP Layer for the ODROID-C1 and other Amlogic based
devices like the Wetek.Play

https://github.com/linux-meson/meta-amlogic

regards,
Christian

