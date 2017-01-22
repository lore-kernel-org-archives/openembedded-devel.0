Return-Path: <torcolato@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 40FFC6010B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jan 2017 18:04:33 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id c206so121283204wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jan 2017 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=vk3V2GjkQ1Y0Zl+Yy0hiCgh6uTUrJ7wXTaOkNtRw5D4=;
	b=bZ7+TSjH4X8cC7VoX1/Jh1yDDpMNvKTD1oVLCBPoX91zMqmr4Ewc7IlOyXe0n3Q1WX
	CEpezCv87VVHwQ+DlnAZcmAECBzex9e9WLuFhPBL+FYdVsanMXoqExF58ADqQh99rVeX
	Kd5H6ZQdx1/x3iSkRp5lqICyc99Yir65tSDULwJwslHRXxdS7t8Xvn+AV6gAmAz0VrEY
	x4fPw+kDNXAqZp3j6rvf0n8CsA0i0rAwe0BiWJJNVziiUd4JG4pMBBRN99p0kPrci5K6
	r3KqmaBmm3vvjMU5NDkozSWXK+u/CsGlS2JAjrmOZci8ZOAPFlUm/PyT3wYXZeSNuXta
	MURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=vk3V2GjkQ1Y0Zl+Yy0hiCgh6uTUrJ7wXTaOkNtRw5D4=;
	b=ixwxSfAfF5V/vzj19KbePH0RWiLcSowyepJxMEg7uPJZvfR8VIyt8qjrFNPssJ4/A7
	6sfAjPl9xW7NFga/xlSQBhNkrJ0GK7Lfk6ANdpTsodgJ5J6xVTV5tk9UlgtJgH9/a6lL
	oIzei+Mv4PCzj4jM+BMXon12ewpsgSu/sZ1WbOJnSPod/v70H0jmlDMJGb9P+92dAx1k
	B3qkDFDlFgr7WLTR6LNLqLhYbL2HmSl9DgepvCslXIC9Ol4qBkz0QdR02Dopv9mE7AMG
	wRW7B2LU6vWtkm/j2vhhPPI2bbonFwgmMwayPFntEvPmICnrGG1VxkmqBwY9Wy4II9Lp
	/7VA==
X-Gm-Message-State: AIkVDXIdTJX6YKLXc6xnVGKMpBuKtcDu1xGayyhVURdJ62rLuFosCt5BwcyD1eE9b6ekpQ==
X-Received: by 10.223.138.172 with SMTP id y41mr20141453wry.118.1485108273735; 
	Sun, 22 Jan 2017 10:04:33 -0800 (PST)
Received: from [192.168.202.100] (p5B20D9E6.dip0.t-ipconnect.de.
	[91.32.217.230]) by smtp.gmail.com with ESMTPSA id
	n13sm7101677wrn.40.2017.01.22.10.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Jan 2017 10:04:33 -0800 (PST)
From: Christian Lox <torcolato@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.0 \(3226\))
Message-Id: <37E7CB14-F61B-4421-8E21-7F190EC293EB@gmail.com>
Date: Sun, 22 Jan 2017 19:04:32 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3226)
Subject: Python pty module
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
X-List-Received-Date: Sun, 22 Jan 2017 18:04:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all.

Hope this is the correct list to ask such questions=E2=80=A6.

I am in need of the python pty module but have no idea what I have to =
bitbake to get it.

Any hint highly appreciated!

Thanks
Christian


