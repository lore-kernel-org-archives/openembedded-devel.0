Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC7560138
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 16:04:46 +0000 (UTC)
Received: by obbgh1 with SMTP id gh1so128797903obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 09:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i4auYU58zothXiC+bDtXmAFZuSVabo/1npM3+IihtUg=;
	b=lk5Jc1qd7yS0lndJiDmBbmakFC7eL+PQBq5gD98RjMNDo9rXBGNZ/jJpgK+BSc4bUW
	/T7opWRYrgZl1syI+hvpngUVGKTc13NSNJh14UNtL4pHiJS+qnsmE5ZCldlBpkBxLbUO
	IpbKpnGa4i3HvDETjernfzwc6JEkgyZS4PWBmWVc47LOfmC2NSwNi61OoJw+h/kT6KY8
	Ws3xBuvGNP9vQp2aGy7kFmDFd4QyS2nk33f6VbH6INQVK8/HFpY0vPHuDyjH8PFFv+ds
	jPAGlUzHRXCVVLClisFSI9g6mV8dnvQM09hAzPs3yCZV6znqBan6wtrwsHXHY3TRZNoj
	0RWw==
X-Gm-Message-State: ALoCoQkhT0/icgsI90nL0RTrHN5K8/4YibhCs+IK7fTZdC1mmVQKFM9KgAeJcy+vwBPGZzBMWT/u
X-Received: by 10.182.125.130 with SMTP id mq2mr19057193obb.52.1427990687134; 
	Thu, 02 Apr 2015 09:04:47 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id ds7sm4711356obc.3.2015.04.02.09.04.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Apr 2015 09:04:46 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu,  2 Apr 2015 11:04:02 -0500
Message-Id: <1427990643-16120-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAP9ODKpdtB_kq173kcoURafhoNGTmQqU2i-RabmG9fJro6KOOg@mail.gmail.com>
References: <CAP9ODKpdtB_kq173kcoURafhoNGTmQqU2i-RabmG9fJro6KOOg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V4] libhugetlbfs: add i586 to compatible hosts
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
X-List-Received-Date: Thu, 02 Apr 2015 16:04:51 -0000

Thanks also for pointing out that I neglected to update the patch version
in the commit message itself as opposed to the cover email subject line.

I believe I have corrected both oversights with this submission and will
try to avoid these mistakes in any future submissions to OE.
Hopefully with the formatting issues resolved this patch can finally be
validated and merged.

Thank you all for your patience.

Regards,

Gary Robertson


