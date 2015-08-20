Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id A135B608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:22:43 +0000 (UTC)
Received: by igfj19 with SMTP id j19so6109428igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc
	:content-type;
	bh=yHt4vvblzfLbKeGAi/cNqUNc966QGNTD0CshqkQvb0E=;
	b=jBVFl4Zlxap5SdMGY8sy6F5haFCqFoVapnUr3B8YdY0T4mmCbyNJ63Ov46367JuWWX
	740tfflcZpqGqk/n2llVzd4whVLamT+2WEjd5MqexFqFmKwmsj9OfNLZDs5W5O57Vn6y
	33bHTL3STxkfCef2mxvIiUnOuktpPeDOLmK2qAH1U+El5QoBQuKQLpUJr15LHVGOvyzf
	mzwUL0r8/XW+XNH2WBhrrh3EBc6GtRsBo8vInzLNUGxCKaW1yjMvEp8ghu6dEkavrrxJ
	qUQHvoxXwzGUvxNXGxOslTIPvEFEigr1xZxNh01KFk/slW7fRXy3+cVPvmjeF/Xt21Dr
	8FEA==
X-Gm-Message-State: ALoCoQm0bfGQK3EMmHLtmwCpGGwn3oT9cA+5w95WH5wwSY7WT2rGUv4FTB2pHGScCRmI1H1EANsW
X-Received: by 10.50.88.41 with SMTP id bd9mr778292igb.4.1440112963361;
	Thu, 20 Aug 2015 16:22:43 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169])
	by smtp.gmail.com with ESMTPSA id lp3sm329399igb.12.2015.08.20.16.22.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 16:22:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv127 with SMTP id v127so63929666iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:22:41 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr4821306ioi.192.1440112961457; 
	Thu, 20 Aug 2015 16:22:41 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 20 Aug 2015 16:22:41 -0700 (PDT)
Date: Thu, 20 Aug 2015 20:22:41 -0300
Message-ID: <CAP9ODKrP8H-mSZf0k0sJLKRRgLS=sDk4Vwv1Jx+qH5e3PZ-=mw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Backport for Fido
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
X-List-Received-Date: Thu, 20 Aug 2015 23:22:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

Please backport 6ea7ac016987832e51b0721ce5a52dd4e2f3d0a4 for fido, of meta-oe.

Thanks in advance,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

