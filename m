Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DA38C77551
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 14:04:58 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id to9so33083521pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=rR+ADYhJDzrQsLt9mZ/2kWd+vAbE2KcrwYIfEMi2CtA=;
	b=f6iHZI2PMI15Oq3MuIk11BhbLQ4CkNitcDiXc9hgMk6updReXj0t0xIxnmMOCfAbVj
	jvEjFHXbB46eUCfbEgd7hYylU7pCVdK6m7FwPskjiyauAix+eAxZmxc09+aZHL5Gtp60
	ULqJFURI7xuKusj8l2wfM7knUQDc/ZzPY8/1KihdsycYm+nHZMrJxu/R4+yKM9RxqnOC
	TXEjJwiE9rw63NWxqZKOd+Ll41fHADRNeXCB2i+sRSb8uCrlaMrVWk7UATVQQCX4OorY
	W7QFXIBHn3Q/pwUhI7lNPLcMNp2zdNTd4pdCS8m35YKdebiSXvMHE4fpQnfz7LE7ZLH+
	X6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=rR+ADYhJDzrQsLt9mZ/2kWd+vAbE2KcrwYIfEMi2CtA=;
	b=NfXrSvY1eSTZ5hMc9sX0pZroFXILk09Ggmn29u3rY96IPp2Wae8WJKfg640tDFV5eq
	OPlXidzBpGHcdfT43ZesqhZBWLj84T3umH0lMYYXbl1/yfr+krV8gyML3PjhCT67Q1wo
	Xi8I3Yz1P2SSbJhWxBDNI1gdtlu03xrl5yGz/P6CtJnHas5/QeCHRHfSrTiXT90GV4Li
	SNh2V6sseQoJ0GqpLbY/idJNKbVExZdtjuRMUhcHo9Bh5tneMJ6w4b5qr1DP8eKkTXqG
	RPsWIPgVrKtMeWbuv48amE0+pX3GmZJxzaXF/xmtoBPS/to1hx2DRSnDy55bHVZ+dTpI
	wNZw==
X-Gm-Message-State: AE9vXwPSJkOTbd4bZtMlX8GZMG4aIiqUjL/Y6QRrsxjHFCrEtwkEzh0YSK6ENWyXUYgjnw==
X-Received: by 10.66.217.170 with SMTP id oz10mr72462578pac.61.1473170698809; 
	Tue, 06 Sep 2016 07:04:58 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:9c0c:c2c2:3ede:c006])
	by smtp.googlemail.com with ESMTPSA id
	29sm3956801pfp.88.2016.09.06.07.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 07:04:57 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d16f8d9b-2d69-116c-1eb7-35f871344e65@gmail.com>
Date: Tue, 6 Sep 2016 07:04:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
Subject: Please merge krogoth-next > krogoth
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
X-List-Received-Date: Tue, 06 Sep 2016 14:05:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Please merge Kogoth-next to krogoth.

TIA,

Armin


