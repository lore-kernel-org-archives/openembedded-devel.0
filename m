Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2716FF73
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Oct 2016 01:49:26 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id oz2so50019953pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Oct 2016 18:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=p7ekWU507DM/wY+kincUUyJ7UlX6WzS1QQS8exb0qqQ=;
	b=QCeo5zakekVkk2ibSmbq8b/oxLp/1pHVHAQivcGLeR2yzeHi6XIwL2vGRNMmOkSzij
	8+bqUouQkLlBP0gG+2zlVncczMbXETXXZjWsuMTex6NhYPXvWPAnvPiKz4f+ZY61hds2
	7vL/fbCJ0wGWp5RFnF+VLiPfbFctzMsMqMU5+FgHvpNTXd2+9Cwp0QNhUCU2mCujSAy9
	5DUzZF8ReKJehwFEbDQ8b7xEfF+MdseQp3f+UBXsQkJPEH+cnnNIJmfyRAxQENmWNXzZ
	XYrQiyx+XpKR5l2sMdIJq7loVN4HviFNK3toCySi0nx4mSgfzZiZe8KxR74gc7xlf5OG
	gx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=p7ekWU507DM/wY+kincUUyJ7UlX6WzS1QQS8exb0qqQ=;
	b=ld0j2j5U89pl3cX9za533QxkN5QuwFcmWdRj99CnNubtQCEVUmxHq7FQ6MCpAIV/BW
	8q/4by8+nSuTQo2DUpswhj3wvDlql4+a1/NrzkYkrpWgZGsWijNBlf7VV6lY7VEjGPrY
	OX/77lG9wcOi6oKnHXxqDmhwlRc8mtW7ID250suZ3paFhzvK9lZqiOLn3bLmJ85+nj0w
	CKYiexj+p2ydaNol+LCwTTwBap4UUifTKzq19to1ImDQfAyeKSAenQlgXnWtwURpTUT2
	PXEHJ3AfTKJydXJBkCkS8enFDoZf02pN2VXJKexbv7e9YGpD2GfRZYUtuP6y+SdOHTeL
	CLfg==
X-Gm-Message-State: AA6/9RnUsCZ2Gt5cU6WqOf0KGIVwb+a+3imIcVPXNgc/UDhzB4mEeF0CRi1kTijRaimPOg==
X-Received: by 10.66.16.74 with SMTP id e10mr25087698pad.148.1475372967862;
	Sat, 01 Oct 2016 18:49:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c1fe:336b:94fd:8c8e?
	([2601:202:4001:9ea0:c1fe:336b:94fd:8c8e])
	by smtp.gmail.com with ESMTPSA id
	e1sm37500098pap.11.2016.10.01.18.49.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Oct 2016 18:49:27 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fcd0421a-6fae-9013-b002-f92e5f7d9e71@gmail.com>
Date: Sat, 1 Oct 2016 18:49:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: merge jethro-next to jethro
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
X-List-Received-Date: Sun, 02 Oct 2016 01:49:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please merge jethro-nex to jethro


TIA,

armin


