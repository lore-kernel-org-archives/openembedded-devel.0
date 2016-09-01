Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 587DF6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 13:54:18 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id e124so103657825ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BavWIusVgpLVO1/8OFclxzuYwWnCl4YRC+clVPGsIyw=;
	b=WouBZxHJNmU3vIT0zusnniCu+k9XjLws/DgH34fq518BPEsf6i3zDlpLDnAenl8veo
	VvHF9U0CiEeO/+L9XlOqMipjMJsOXHD2MXpz8KQ+934z1G7knfNce3F80v/7qURjIe1K
	oy6ibnlax+29wPMKXQAa31+GN6y8LbBBK3uQLBRX9HEv4i5cissppa+FRqpwXiDeZFOs
	EcTWIqapvJtfngfFQK5RWwyklEV4zx3Wu68Ms9/OcsZRw0500BSel6jTZcJ9QUgoyDjI
	TX7obNVoxu5cReJWvN6WYw1NGyd/Z2y2bbLYYBWAt7WWpUbWFiW6algLx1EKh5Qu75cW
	CArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BavWIusVgpLVO1/8OFclxzuYwWnCl4YRC+clVPGsIyw=;
	b=jDGEM9lya4B6Pk1xgORsvRI4ByuXOpEzlgH4m6g4W8BIi96FsXZbe4q2e9lohmZXxU
	VXgtLlrQIn0JveyFmSVp+oGy72dtbdkpskammSqQntGSD5qvfqcAbAKWJv04YNeDp7r7
	kQGd+kt0WKRIXXMUW5k42JSQPUcbL17ub5CDQRdvrbH7CQ0sEyvyTSiPDrT/p85Aouwl
	e1oIFV+oVwRDyTdWGpWNmwkLhRFi//T/OxOegQiZsvrLJygm/QGvkNKKphQLNdoz5MDn
	IT594p/AL94XPeNAaTfGtXV+eFIorf5/KYTy5dnZu8cw1tQA2K6+YUdEtg+2NMaUJnfZ
	wmZg==
X-Gm-Message-State: AE9vXwPnCxFk1yHllSxXWkR3gKhcjU91Sqkkn4T9mFs0ZszjePNUSSAs8JBuIqAk8Cm7CQ==
X-Received: by 10.36.200.134 with SMTP id w128mr22721645itf.92.1472738059470; 
	Thu, 01 Sep 2016 06:54:19 -0700 (PDT)
Received: from openSUSE-i7.site ([45.72.199.207])
	by smtp.gmail.com with ESMTPSA id
	192sm15966048itk.17.2016.09.01.06.54.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Sep 2016 06:54:18 -0700 (PDT)
Date: Thu, 1 Sep 2016 09:54:16 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160901135416.GA6471@openSUSE-i7.site>
References: <20160901134240.5272-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160901134240.5272-1-twoerner@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade patchset
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
X-List-Received-Date: Thu, 01 Sep 2016 13:54:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Oops, I should have checked the mailing list before posting. I only checked
master and master-next :-)

