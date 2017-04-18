Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 750AF601A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 19:38:34 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id 88so1594714lfr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=+TZg4/OIe85t8NE9+of02RzUyYAROm8UsxnFiJtfhuY=;
	b=EzKwHW3Xo20RADVZnWjA7pxFA6+qlcX8+uAvcwfqXx2ANTLE4sec6eP14B6MOLkPwq
	AxjU1ZnoWqKdUOQiItrVST7qkRCPwu0CgUsNzHZcJ4FstPgu7aJMdLQs/OJ1PTcXNsZu
	q5evwAfKHXQJJ5EdYGXKW1seZ2pQZedRCC/Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=+TZg4/OIe85t8NE9+of02RzUyYAROm8UsxnFiJtfhuY=;
	b=meeGf1ky/gNUIB0OshG7+Dx5QcjCEBDaVe+FLH/6u/F6jCPUgSOyLMZ4o2ARMxCsw/
	N5O/6f54VFU5O/b5zt0OAN7hVUWgg49Fb3zHwdI64Wua2a9Uf4yBfdrzF/Y0NtXmdUqr
	5AAJIAzXF0ZVPKq5N92TZlgO+MwdtKUoBc23kxj5oIO/nAmQO5z/9CTDIYaATHQXXW7l
	Q+oMFt5gdMJor/VGfMBefHzajB3vRu7tE0KMjctGvjs3xUCSBssndWDjcRAm7OkrtdOe
	Mb/FYH1JC+GhL2UzERlEBWGwgGIQb5BV6RfImxcRLNmcUjARrIDsQ40GX+FmybOJvdGe
	jP+w==
X-Gm-Message-State: AN3rC/6WjBOHo3CeeEsQy9NXr6V5KI4PRTWqVnsXATmiTWWFTqF48/Rc
	deg63ITjPhO6MqjO
X-Received: by 10.46.84.90 with SMTP id y26mr2517139ljd.20.1492544315780;
	Tue, 18 Apr 2017 12:38:35 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	t23sm19050ljd.30.2017.04.18.12.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 12:38:34 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58F66B39.2060104@linaro.org>
Date: Tue, 18 Apr 2017 22:38:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: [meta-browser] chromium: update chromium in morty to match what is currently in the master branch
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
X-List-Received-Date: Tue, 18 Apr 2017 19:38:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

To make it visible in the mailing list too:

https://github.com/OSSystems/meta-browser/pull/33

Thanks,
Andrey

