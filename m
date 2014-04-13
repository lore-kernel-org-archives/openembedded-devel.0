Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 35E4065E74
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 15:54:12 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so2536318igq.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Apr 2014 08:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=x3NmmN9QsT+haAIJuxXXE3AW2LIEP7QwWJ6pxycGfVk=;
	b=fQBB90nY618hWmbNF9iaFb/1ZP07oHKBWi1cmo07ppBogbAptS9daVNTFVYFmvQ052
	Z9s5pluxWc/z8j0JbBtbF0yP9Z0MekJe5q1Scb3FFJ8AE6tSwsawDbtcb3D7a05r/6Rl
	EHpJoSLkkX9r4/xcofEmrjOlC100OgQJeAr1GRMfUX/MinRDCPgdoGF54UF/K6NWmZHc
	IMIcH1xDigwzySQJgmsMScNfsowfD9c2FqLcBFyAxVvzwFUUZCHOpPabcJAqfFNp2tAm
	iQGa3CI+c+/j9s4e9AZerUISpXtm06AMAu2rUDwZ6Qj7YBLn6JtwIsIPth7TH7zVaLlA
	D1eA==
X-Gm-Message-State: ALoCoQmsmyQwi91ZvHmAMLkkOtERIpYT+lDJeeGoS6lRX8k5qZOHoCAoS0S3p6u+4C2WZ3SQdyC1
X-Received: by 10.42.247.132 with SMTP id mc4mr29266227icb.44.1397404453362;
	Sun, 13 Apr 2014 08:54:13 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id z4sm22434779igl.13.2014.04.13.08.54.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Apr 2014 08:54:12 -0700 (PDT)
Message-ID: <534AB323.7050509@linaro.org>
Date: Sun, 13 Apr 2014 11:54:11 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>	<1396701582-15906-2-git-send-email-trevor.woerner@linaro.org>
	<20140412104412.GW2132@jama>
In-Reply-To: <20140412104412.GW2132@jama>
Subject: Re: [meta-oe][PATCH 1/3] liblockfile: remove configure warning
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
X-List-Received-Date: Sun, 13 Apr 2014 15:54:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/12/14 06:44, Martin Jansa wrote:
> Can you please rebase on current master (maybe you have one more patch
> which you haven't sent), because in master there is:
>
> EXTRA_OECONF = "--enable-shared --enable-static"
>
> so this doesn't apply.

Okay, I'll send a v2.

