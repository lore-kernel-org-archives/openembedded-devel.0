Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 772C270260
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:13:20 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x19so5508235ier.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 14:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=1By6ZXCQrukrWKwSe2XsBcPD1IKWtnJYUvnP9AcyjQ0=;
	b=FqUoQws/S28bITr896TxhZNbcElcXIiEioeKY8dTLanyEJ9ozE6If3cmU6/Un2lpky
	Tsiyhic2cqbI7U3yQ99QpSNfUvIfMGhmcdBXJpIGnNdHOuZaMTb6SEVIWf65mWDiyaN5
	7cOmvblMfwuUo/CuXuGmYswCjUMwDrcnDn32ExiMGrLnnCzE+P/HkFLXKwdc859AkyZn
	20oU01qUQXhpVepAZ0yLBzdSmArgH0EJu+IQ2V/Axg4qSHHwjFKjPYv19TWXXas5B2r0
	eCa9opY887Brb36h3T4JQV70P9kgujY/Jt/eLZqjyYqvuFUs0/PgYomr6lzBz7gZTq1c
	4aog==
X-Gm-Message-State: ALoCoQlgIA9MUg3EgAWT8vJgXjqDYUFXPjlMkEacYEs0JMrnhSYE/g41PB8aMuSIAXAHRCLuacXR
X-Received: by 10.50.137.71 with SMTP id qg7mr24258486igb.24.1405804401894;
	Sat, 19 Jul 2014 14:13:21 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	kk10sm20666919igb.19.2014.07.19.14.13.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jul 2014 14:13:21 -0700 (PDT)
Message-ID: <53CADF70.8050201@linaro.org>
Date: Sat, 19 Jul 2014 17:13:20 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.11.1407130825500.24436@localhost>
In-Reply-To: <alpine.LFD.2.11.1407130825500.24436@localhost>
Subject: Re: some questions about overriding tasks
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
X-List-Received-Date: Sat, 19 Jul 2014 21:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Maybe the following email thread will help?
http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085319.html

