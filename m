Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 835CA65D94
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 01:31:17 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wn1so2391167obc.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 18:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=O4Hibt2+dryU4LZxTkqCu7mk3fuoiSYekNxvwPbi5cw=;
	b=BhU8qczpUYxjg3FjoPPyIZZye/Z0rFTswV7fJZQkzFmq5227d1y63s5SueEo5VVg7E
	+9IZfdZXwNDsGxR/zbepfyST0/1k6vf8QepX7LLvzm042adYEtsjdJiT6GHDuSMbMh1m
	6yT58/ue+c8H1SyN6D8gtV/+owmcyrkHotHAhcEgTDtLEV0C2GdwVZHalSjaXxkvehWk
	i06BpWu0KGnCH9JZd+50pUHK2jnDSNLbxTZEZt0+32gw4669i9XgrJn5cuOhBvguHSs2
	r5HkN3RpWzt7roHZo1bbyQ/f+bp0yZ7kh4sjIJL0bBT7MTlJbpOpqRtkDrIc4E+SKRt4
	i3wA==
X-Gm-Message-State: ALoCoQnjnxqDBIq7ofAOHdR4M91CjHJfAbMyxPLuEiqPIzl1uxww7pfSTumjeG5LgKEowCtcXSyh
X-Received: by 10.182.102.134 with SMTP id fo6mr19531843obb.10.1397871078934; 
	Fri, 18 Apr 2014 18:31:18 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id f1sm133397255oej.5.2014.04.18.18.31.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 18:31:18 -0700 (PDT)
Message-ID: <5351D1E5.2020302@linaro.org>
Date: Fri, 18 Apr 2014 21:31:17 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140418183632.GG2486@jama>
In-Reply-To: <20140418183632.GG2486@jama>
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Sat, 19 Apr 2014 01:31:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

Just to confirm... when we work on this, we should be working against
master-next?

Best regards,
    Trevor

