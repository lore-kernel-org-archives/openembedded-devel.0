Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SC7V9-0000Ak-6r
	for Openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 12:50:15 +0200
Received: by iaag37 with SMTP id g37so8728364iaa.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 03:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=IvTPeuKyip5/gHrJzoe+vqlT4+JKHpiGM1SgMYLnU0k=;
	b=M08RLnzLE+4guz0cW60abeq99lJSuPWjaz40DN9jzjhdj1XPNt0wIB6ZrL7NYvBesR
	yrUy9Ey3crVLeg3cjyb+rR+n25K9avxBEHUuKUaO6F4F6AeC2lCoYqZ1p0GdFPws1x7g
	MhuRsSNjl7F8ZbNurHds10xqZBSkPTjIe64Xalb+m07wlMsjqgYZcs0RdHRj/jVCsKyu
	yavtq2qpNNGFEQLg+5RwqdN5hO0KO2klyhMArC99IL5Lus3/2gjj1GgZvYGzY39VfJZr
	Kv4V0QCq9iaNFtMTXk1Hic/rFY/zkM8kNpUX5dw/nB0SDt97ISMbBTA+9FjSO+xPXTEp
	N44Q==
Received: by 10.50.181.132 with SMTP id dw4mr5044284igc.62.1332758474958;
	Mon, 26 Mar 2012 03:41:14 -0700 (PDT)
Received: from [128.224.170.210] ([89.121.200.106])
	by mx.google.com with ESMTPS id df1sm9950763igb.12.2012.03.26.03.41.13
	(version=SSLv3 cipher=OTHER); Mon, 26 Mar 2012 03:41:14 -0700 (PDT)
Message-ID: <4F7047C8.10403@gherzan.ro>
Date: Mon, 26 Mar 2012 13:41:12 +0300
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnt903bMXP9eVJ8yYSpaBTEChYqpx8qhRM0xauV2Qmqs3PWdNfRjkNvatTSj/0w200iCnd7
Subject: Build from precompiled rpms?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 10:50:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everybody!

I want to speed up my build process by using rpm's from older builds.

For example, i want to have a build with a new layer meta-yyy. On a new 
build i want to build only packages from this layer and all the other 
layers built from rpm's already generated on a previously finished build.


@g


