Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 26B71758DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 00:09:53 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so1684680pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=DjUXjqan077PCIGCPrPGMQTIhNMh+pFtC6d7jlUgnCM=;
	b=v9bUbbrC+yP36N8Z8hpmwyevPmlHnz4I9EMH65BxR36qiw2yDP2k2uFKeLHhijCqF4
	owI1TQmp47nC6NKoojLBokS2u3StMrAxFcezsyE8jZ5qg0GdAsHmM0cpui9B1puYNH54
	5Cd5fyIFi2UxJaIibidH2s9/rcZacIgkbXp9wWkK0bB4qfqreFiMTa2+gZJK12eZouT2
	C+wehushpYnWTydWpjLM5ePzXWmZwvo7lgr+6qg7ezI063Tamfp/DhUHVeDlW6afcs7Y
	56lpssY/O+0/ywcXvT886Gh3HyBGmJcNeFccwJBw0ap2W1pZV9vDfocuq2p5f8TMxbdX
	Zbgw==
X-Received: by 10.68.57.171 with SMTP id j11mr276722pbq.17.1445299794102;
	Mon, 19 Oct 2015 17:09:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:6de1:f851:17fb:8dc4?
	([2601:202:4000:1239:6de1:f851:17fb:8dc4])
	by smtp.googlemail.com with ESMTPSA id
	ro3sm175773pbc.69.2015.10.19.17.09.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Oct 2015 17:09:52 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5625864A.4000007@gmail.com>
Date: Mon, 19 Oct 2015 17:09:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: dizzy-next sync to dizzy
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
X-List-Received-Date: Tue, 20 Oct 2015 00:09:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Martin,

Are there issues with the changes in dizzy-next? need Otavio to signoff?

Dizzy behind by:

7f1df52 fuse: fix for CVE-2015-3202 Privilege Escalation
e3dbf78 ipsec-tools: Security Advisory - CVE-2015-4047
0fb90be mariadb: Security Advisory -CVE-2015-2305
c580b62 libssh2: fix CVE-2015-1782
e00844e ptpd: disable libpcap detection via pcap-config


