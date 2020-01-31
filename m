Return-Path: <krussell7711@gmail.com>
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEB860283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 21:22:50 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id v19so8667106oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 13:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=wBmHGVfT/qIP+5GD3OxlijVeHCy+N6c8SEojYoqVEaM=;
	b=S+bUbzHyalg8k3yAE8czH517kOB7mbvGIrO/Z5iJ+ZR+4GFdGvTZiB5o5OwregRed+
	gwCpAMXIBnWe6wq4T2Z4dq/PCrVlV3KXZl8Qe2Ul8KCJaw3bNE/CeM+nTo1xXTzgw2l7
	f7Qn0G2XL067wW334A/quqZ8WyQNOMGHXoHaNvQjn/aR9Rd1rci+6/YavcmfOaWCiYUE
	7lPDN0/Bhw728bGvYE/i4GCDgVOMobuEW0+P/xr/JPrMrxQJPw5EBN8n4KTaOZfMZwG5
	Dq9C/ka7i5AvKJNWzs1dx+1DbtRX/NyM9nz4s7RSDfJvR6HfrnjoVGjF2TvFR7LxVvh/
	20FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=wBmHGVfT/qIP+5GD3OxlijVeHCy+N6c8SEojYoqVEaM=;
	b=RUVgOXY+107hh7+9ybHC5CuRCesiuCk6Yfdw4TYd+/S8b+fV4qSAT23B9d9tfIqHAg
	XXhyy/A8dqteHDYN6r0oD0nuJbl0EwIyqkKs7a3NiG3yeUEprXz9eNi0IfgpcAliq3U4
	dTKfn9niShJ+2v/0v0M04BU8pnSL6rkYyd2O90dDLBUBMwg5MrtfJM1iOJ71voARcE1i
	io/RM26XZyKRFEGuOeaSPbSyIrPTaDmiKLT5OuRKq+JBundxMIBe3WB6AFkN0oqGxrAA
	pziYJmPhB0F//VZSoN5wfgP9YJtxlF7ODptsij65b6O5nFDiAYmmePe7bVpPRqGWDAyW
	d3Hw==
X-Gm-Message-State: APjAAAVgomfyhrwqkJwOOYEGV5JjuuhrEnOKYV1kQTu+z4cFyzOh2N6Q
	lGDD3dmzBjh9OuxwoQX6Kc1Zg3wffdkfovVzEQznTA==
X-Google-Smtp-Source: APXvYqwu/t6RxSLUzYSNDmrMbhnohhIYgce2Lrx40kyY7MzVvRrlXu/BD8RP8JMe1yDCKO2LBuCrc/Rm8nW4TPv/79Q=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr7923116oic.74.1580505771689; 
	Fri, 31 Jan 2020 13:22:51 -0800 (PST)
MIME-Version: 1.0
From: Kyle Russell <bkylerussell@gmail.com>
Date: Fri, 31 Jan 2020 16:22:40 -0500
Message-ID: <CAFrQVPN-BGUPWXvDfdhU+VxY-D-ULVcpM7fYcFnMBVbN9-hNoQ@mail.gmail.com>
To: richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-java] OpenJDK11 LTS
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
X-List-Received-Date: Fri, 31 Jan 2020 21:22:51 -0000
Content-Type: text/plain; charset="UTF-8"

Has any work been done towards supporting OpenJDK11 with meta-java?  I've
been using openjdk-8, and would be interested in helping contribute support
for the next LTS if there's interest.  I wanted to know if anyone is
actively pursuing this first though, or if anyone has uncovered additional
dependencies that need to be sorted out first.

Kyle

