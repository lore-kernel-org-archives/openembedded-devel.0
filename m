Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4206F609B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:42:46 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so2402355wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=t6ku5WirRdP2Qzw82DKkjoh//HQWZ+uEnvxz5HJSo8Y=;
	b=VNP1Vw3XBiNTtcfpyqvwuMXBucXzy3IMbk6P+2GNotoFJTY7P9oWg2j6UXkO7YCHrw
	U1PQR1F040eUZD1xhnjHuIKJlPVWwvWY31/vG+xciXUhMIIQdQ5QnPHfhqyuZ7Pwr+lC
	eb4wUj+0G/U3bpnYTciNXOaTUaGUMGmhZa0/TS+89jhTz029VM5XA45vXUTAm7DLbt9v
	IeUYiTdt2dAszPhjtBrEqoCBuUJSdzLSna4xDAlXrYanriAdyzahKSAIPPx0dgIkbyLq
	H+xfxLnzYVCoJM7Q3j8vlpLj92wzM12MARYTxO1IRZC1m5yRMX0B/qwVno0e8ApM/qBf
	jZOg==
X-Gm-Message-State: ALoCoQmHtU2kqSe+XEgVocDv8fs9VLoLGzlEjyfh5dPBMGtQ8fHuy4b0j9vo6Ds7IWcsCoQqxZ0l
X-Received: by 10.181.13.112 with SMTP id ex16mr41157044wid.58.1408027363825; 
	Thu, 14 Aug 2014 07:42:43 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	x11sm11905671wjr.15.2014.08.14.07.42.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 07:42:42 -0700 (PDT)
Message-ID: <53ECCADF.9040400@dresearch-fe.de>
Date: Thu, 14 Aug 2014 16:42:39 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <53E89286.7050303@dresearch-fe.de>
In-Reply-To: <53E89286.7050303@dresearch-fe.de>
Subject: Re: Ralink RT3572/RT5572?
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
X-List-Received-Date: Thu, 14 Aug 2014 14:42:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 11.08.2014 11:53, Steffen Sledz wrote:
> Are the linux kernel modules for Ralink WiFi-USB devices with RT3572 and/or RT5572 (available from <http://www.mediatek.com/en/downloads/>) still integrated in an OE-Layer?
> 
> If not, what would be the right place for them (openembedded-core, meta-networking, or something else)?

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

