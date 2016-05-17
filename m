Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 42C24731DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 21:23:33 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n63so16594937qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=WwDn/xVnnwK6kJ0TPL1Jp2g6tBnlu7yIW81zCB3/Cqc=;
	b=pBERIDgQtjqLOxQmjQPC9U8s8vY8P1HYpuOVlejTQSkmi82H2IbZwJGmwAbdrpeSsx
	oPAR9Z+uYKAYocvt/xfTpoNhGGtuQj3CiqwMKseTvPHhYUIbMdFPBIZODrnHgRJacQPk
	ddqhx7s9BK5E5lrdiFZCdVHzFuZpwL5I7Vwm98wU2rrLBEJCPb9gqviChjR2LD9Yh/IV
	fSYxXYr6fLugsZBa9OVCP16rNotz5rs4Vckh1JNHyiiFV/mggw8m7fCGaVTZ07nKCb/2
	7Nl+R4+9/uJoDOZDX1TMIBKpu5wL1+C1O0sN9kxMaNUhuftm8JSKzg5NMdXigsyXwZ+O
	bphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=WwDn/xVnnwK6kJ0TPL1Jp2g6tBnlu7yIW81zCB3/Cqc=;
	b=I6ZmwmIWk0FaqtmwBiKS05cXu6Iw8iA7hIdt9byMHVNyJ4Z7OLDaKa4JihCFJVuPX+
	OTMru+DKAakp5qEmaGZMoOpR9rxidnFooa27OqHSc/I+IW4HWckzknSyPoXem1AcwJuv
	2xGaJsjxm98gHTsI6mb2REfM1X5e+3XWU3KbSq8gFxNBPnqQ5oMs89OWkh7RAc6pCLeR
	yF4Gb2eJagFHjAVC/vNU2CZpvxsoVPGZOaW8+oMPCdOK5uDeD0Lb4nqIfs79+fEuIG+I
	YeN+OrcziZ9MozooSuOSWpT1YC7UVEpOLBq0OStQVZ5u9Z+8prqVRw/eoZ2sPV1MOzsR
	DnCw==
X-Gm-Message-State: AOPr4FVyh82e5jEEsyaF/crPrOZyxh8+QubEwdzFaxYmRyrI3cifOv08cW6QADrJhq8XLg==
X-Received: by 10.55.65.74 with SMTP id o71mr4336546qka.133.1463520213682;
	Tue, 17 May 2016 14:23:33 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	t65sm2428287qhe.0.2016.05.17.14.23.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2016 14:23:32 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573B8BD4.10503@gmail.com>
Date: Tue, 17 May 2016 14:23:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: jethro-next merge
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
X-List-Received-Date: Tue, 17 May 2016 21:23:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Any ETA on when jethro-next will be merged to jethro? its been three weeks.

regards,
Armin

