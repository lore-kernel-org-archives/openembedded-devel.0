Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A75776FF9B
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:47:17 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id t190so56230652pfb.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:cc:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=+X6O1zGSio43Wm2gSwb6lHeU0Z8ZARXFUmUJsdW4cMg=;
	b=iNrknTAkyOZmU4n8Ol8UgWtMuMiESxt34ANs/8MLlfllJu8vyJK7BVObju+whtppai
	xDsh2BBhNRo73EjC0HJ9K3hKf6kz8myYjSfY5jDCDksamIUCJdkn0Q2hU531tLsiJ2jm
	SIlNRyLZ/2CnRxuKXO7oTIXeiJYyHsv7PHJ2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=+X6O1zGSio43Wm2gSwb6lHeU0Z8ZARXFUmUJsdW4cMg=;
	b=aLw6iBC7wDyzEfTzaNOUx3Xu0ArEr7wF6ubUb1+ijQBIhDS/us+6SvCbYAwEiZA/Tv
	lxZSPMlqocME/9HGEMVZvxc0rh1DXRw1a/b3QaG+D3A8EXaP+5HxsjDArnnRyjdI88h1
	JJXr/JwMIexKDnBI6XtgvXecbrqs5Q2lU3hs/wOWKtn03a2Y2e2YU9po3SBMs9HOeNM7
	ZVR/1xXtRKRIDjvi0ndaiz63X3Lx6mrPof/G/VnHmQQBJAPfXbNNDkI5keqtNCk8jhdE
	uxsK8SFKfyE4p9pNT1C2x8TIRHkmxCZOpZ6gGSSt/V1RBVJendQDc6nk6X/sKHxTLfd9
	VX6g==
X-Gm-Message-State: ALyK8tJ1C/J/4kN9xSgYQRG3xDUb1QSRRZbxks0+EKG9KPGCmKT2J0CERbLjCE9SVviUhV/O
X-Received: by 10.98.93.65 with SMTP id r62mr22693252pfb.114.1466444837911;
	Mon, 20 Jun 2016 10:47:17 -0700 (PDT)
Received: from yct-desktop.lan ([2001:470:b:16e:222:4dff:fe50:c906])
	by smtp.gmail.com with ESMTPSA id da2sm6863331pad.3.2016.06.20.10.47.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 10:47:16 -0700 (PDT)
To: bitbake-devel@lists.openembedded.org,
	Openembedded-core@lists.openembedded.org,
	Openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
Date: Mon, 20 Jun 2016 10:47:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Belen Barros Pena <belen.barros.pena@intel.com>, "Perez Carranza,
	Jose" <jose.perez.carranza@intel.com>
Subject: Patchwork users: Help test new version
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
X-List-Received-Date: Mon, 20 Jun 2016 17:47:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

OpenEmbedded is nearly ready to upgrade to a new version of Patchwork.
The new version offers several new features that will allow OpenEmbedded
to improve developer workflow and automated checks on incoming patches.

If you are a Patchwork user please visit
https://patchwork-next.openembedded.org/ and take a look. If you find
anything amiss please e-mail me directly and include patchwork in the
subject line.

Thank you for your help upgrading this important system!

-- 
Michael Halstead
Linux Foundation / SysAdmin

