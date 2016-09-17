Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8537765CBA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 05:38:48 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id h8so101359965qka.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gF4ZZbAaf9i/AtEC/WFSP4WstNpT7ypqkctDyEmvkLM=;
	b=HcwT26WG0vk3rp7IydU5ZIsztLfuoyf3D4od81AAMLApYcSVwig3DTWzGg9si8nTp6
	x1RnfHSKWSCIFMdq1BhtfE6KUM1SGHb4ojdxRPQMXGYfni/IxvQONdKiVhn9QUvZU7ne
	dAyc7DhAwDWOKWSoOBr9BpXwpWxCuPq3fDlESCgg6CBb+EXTq7frBQHeC1Y6RDflsC3I
	YDBSLWBdJ09+chidJauwa2p5K4ScGBPLaKTLgx2W8+DqaA+1lSLxs1jyXR60801surZL
	iWoE+CACezL1OG3muWb87h4sjCzkyKKgurK7CZbhsnZHrUFwCG233zCbenE96iHf592z
	ZyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gF4ZZbAaf9i/AtEC/WFSP4WstNpT7ypqkctDyEmvkLM=;
	b=izMyh/0oHuyqxp7bsc9Sz47/iFaTAOa1QG13U+RdWxjvYZvSOHbNx1ji+V2LPRBxYU
	06MHykGp1xk+zDcjeGCQUaFjXz1CobSEX6Z8T3vBOSrQpK/Fdkxbk6YpmiVN6NbGIf0I
	X2iYEKlIZ/+W0e1bEPndz/Tdyu/S8g2/p2AsLS9n7ESunJcQPwaptxEa/uhaCcJEi3Fd
	qiMmPoxpsS2khMiuwhIQuSXzCI9D9WfHJm5OXmXcf1aAnosQ1gLHbMF5lcMVzVJlgVc6
	RK0OxKuzbHoFhneCZC1c28m1VbT8qzvlsGdrW8aXorW6g8ftXjIsdrsI1H6hzfl5BkJL
	9deg==
X-Gm-Message-State: AE9vXwNldnVyE0mZvzgbW2vdJHIVc4DNmNQvRbmJRFOqn6Ve6ydfY0I/nj7vkR0YWbEAmsYvBumt3x6SFni4MA==
X-Received: by 10.55.170.82 with SMTP id t79mr18923755qke.151.1474090728502;
	Fri, 16 Sep 2016 22:38:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.32.33 with HTTP; Fri, 16 Sep 2016 22:38:47 -0700 (PDT)
In-Reply-To: <20160915084338.GC2641@jama>
References: <20160915084338.GC2641@jama>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 17 Sep 2016 01:38:47 -0400
Message-ID: <CAHUNapRLh3tP97wSJUoKb6ACWHvEUxJrKtBRKLZN8LHnrHZPfQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-09-13
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
X-List-Received-Date: Sat, 17 Sep 2016 05:38:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin, thanks for the report and the updates. I'm still planning
to take a look at the various chromium things. I'm glad to see _some_
of it is building ;-)

