Return-Path: <idealsim@laposte.net>
Received: from smtp.laposte.net (smtpoutz300.laposte.net [178.22.154.200])
	by mail.openembedded.org (Postfix) with ESMTP id BA07F783E1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 21:06:33 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout012 (Postfix) with ESMTP id 054028DD1E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 23:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1503176794; bh=9ifLXeAHJ/exj/7ddFljIPXpgg5bqFMP4EOtoCB5Ft0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=FU5XSEujUPPFVSmM2rlcM7Weq7foW2INX/c0O8AKY6rVt6Q7icEXsolNjn+PAL+1X
	l0x+texYZYUJAJJR/MVd6iSa2+CphiGFBgxzI5PaN0JdSSRNSuxxEYr31mJNzOGCdT
	KBdzjbd07XMLDcZV+37rqCY/o5fEFdPETK6PkQUIj24xjfTLRcAHVP8NZKh8zI26xz
	wa1/TBHI5WldaUF8VEKBXT9s5d/OrzkKHxTCg+Aw4f+/QWfeMuUvxvH8WxVn3GQNmi
	Er7kIKXGtufJMPoarpEEtRPzSJTs8XUFmplY485zIFW/nStOVIgOQtuk8emUhYKqRb
	7XTu0Qhk/EkRA==
Received: from lpn-prd-vrin003 (lpn-prd-vrin003.laposte [10.128.63.4])
	by lpn-prd-vrout012 (Postfix) with ESMTP id 008748DCD2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 23:06:34 +0200 (CEST)
Received: from lpn-prd-vrin003 (localhost [127.0.0.1])
	by lpn-prd-vrin003 (Postfix) with ESMTP id E5F8D493305
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 23:06:33 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-118-187.w2-13.abo.wanadoo.fr
	[2.13.101.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin003 (Postfix) with ESMTPSA id C3D1D4932C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 23:06:33 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <55765cc3-9a1c-14fb-35ea-005ee7e833b9@laposte.net>
From: idealsim <idealsim@laposte.net>
Message-ID: <d02f9878-0bfe-a2d5-a3a9-0ebb5392ba06@laposte.net>
Date: Sat, 19 Aug 2017 23:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <55765cc3-9a1c-14fb-35ea-005ee7e833b9@laposte.net>
X-VR-SrcIP: 2.13.101.187
X-VR-FullState: 0
X-VR-Score: 0
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddthedgudehlecutefuodetggdotefrodftvfcurfhr
X-VR-Cause-2: ohhfihhlvgemucfntefrqffuvffgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfh
X-VR-Cause-3: kffffgggjggtgfesthekredttdefjeenucfhrhhomhepihguvggrlhhsihhmuceoihguvggrlhhsihhm
X-VR-Cause-4: sehlrghpohhsthgvrdhnvghtqeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsthgrtghkohhv
X-VR-Cause-5: vghrfhhlohifrdgtohhmnecukfhppedvrddufedruddtuddrudekjeenucfrrghrrghmpehmohguvgep
X-VR-Cause-6: shhmthhpohhuthdphhgvlhhopegludelvddrudeikedruddrudelngdpihhnvghtpedvrddufedruddt
X-VR-Cause-7: uddrudekjedpmhgrihhlfhhrohhmpehiuggvrghlshhimheslhgrphhoshhtvgdrnhgvthdprhgtphht
X-VR-Cause-8: thhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggu
X-VR-Cause-9: rdhorhhg
X-VR-AvState: No
X-VR-State: 0
Subject: Re: <DKIM> [meta-qt5] populate_sdk error in pyro
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
X-List-Received-Date: Sat, 19 Aug 2017 21:06:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I have resolve this issue like this thread explain, but i think this is 
not the good way :

https://stackoverflow.com/a/45754078

An idea ?


Le 19/08/2017 à 18:10, idealsim a écrit :
> Hi all, i'm trying to build the sdk with "-c populate_sdk" but i have 
> this error at end :
>
> /Transaction Summary//
> //================================================================================// 
>
> //Install  103 Packages//
> //
> //Total size: 108 M//
> //Installed size: 310 M//
> //Running transaction check//
> //Transaction check succeeded.//
> //Running transaction test//
> //Error: Transaction check error://
> //  file 
> /opt/poky/2.3.1/sysroots/x86_64-pokysdk-linux/environment-setup.d 
> conflicts between attempted installs of 
> nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and 
> nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk/
>
>
> Complete log here : 
> https://gist.github.com/modjo756/c8a6eeebc1ab0787ee72033f09d99ac2
>
> Do you already meet this issue ?
>
> regards
>
>
> Mickaël
>


