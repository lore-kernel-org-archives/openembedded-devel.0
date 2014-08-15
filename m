Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3460070E67
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 18:11:15 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 142so2358692ykq.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=p/64+nMuECyR1sYz6XDH56s+Y6J4LjK3xkQTwaQNaW8=;
	b=vcDi2DWPfp+LHjckgbrfUUhfwsAfQciUdtnydsoyE1FQYoiL4W5rYFGH4GexP2iXHm
	KGWuENyHZrfkxNsuC3g2E6cY5EPRpwI/C4VcLlDTOqpgKkt+ItIj8GREaK6u1wJsd7xi
	tfrzoGOkvWV881fY8lV6IuNxNyoS+qQZhxm3wygGB53+bA09AdEUE/YH2CZWaCNXBL0o
	CNAX0wKN2KbMbFH2SVJcKmJe6zg7NeD9ZNeg+9fTKylgZjlEDu7Phiir5NrmfoKhJk9o
	GjEZe5oGk/tt5cI2wWq+opw0+6h1HbWFrXPuUzRp1CC1qJkzMy49emnzhW7DtzIEkjGk
	tDcg==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr29000048yhi.67.1408126276597;
	Fri, 15 Aug 2014 11:11:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 15 Aug 2014 11:11:16 -0700 (PDT)
Date: Fri, 15 Aug 2014 15:11:16 -0300
X-Google-Sender-Auth: r8QHV3xb-UeD0GCEuZddUE5CxX0
Message-ID: <CAP9ODKpr3f2MkPgO-3sYR7ik1OvTG_NPm+8wNdu7w5yd1w-NAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [for-daisy] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Fri, 15 Aug 2014 18:11:19 -0000
Content-Type: text/plain; charset=UTF-8

commit 466e0278acc96aabd29877933b22ae19e23cf810
Author: Koen Kooi <koen.kooi@linaro.org>
Date:   Thu Jun 19 08:54:28 2014 +0200

    php 5.4.14: use pkg-config for libxml2 detection

    Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

