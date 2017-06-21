Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE2A71A76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 17:27:31 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l75so67118902ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pj4FRu9yZdQzBrLqhIp7IvzluKkhU8G4Hzk2Qi6T1D0=;
	b=k/NFc4aT3hpZ1N0UH8QZj3BfB1gEiL4Jc75AcqMhLfg/w8Juzhiuaj8a1/Lwk2LjCU
	W5aD1D4ZepO8rX2K8BkyK0PCz5MMcbmRE8D8n2o76/K5dFn5vtSK6lIYMu8TW0zlV8xk
	LhM08IzzhVMg4PPmM/7C+eMWRjIlK9bMa15pxFjO9sdJB+DstJlRYjHsCwg2DUpJ6uuU
	0ydb8l1ZfshAx1J/40we1e4Fk7rS2UVU1IsRqQWKy03IjONDR/I3KRtTZQn55flBLDgt
	RnLzfA7XmtPacq2NU7u06v0sTdMK+j7b2O4OskLlmVUadXLNpcFohFmgs/2s4XHTK4hw
	hVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pj4FRu9yZdQzBrLqhIp7IvzluKkhU8G4Hzk2Qi6T1D0=;
	b=KNkWZpyU+Q4C7IJ7wxF+4my9rQloOjvQj+3TmJVMFIZeaVCI7eyfvqsuKNYvY4ZQr7
	zSKokCHIn2A1ObCJzB7uKlJPWGhptIOzORw9dXZUVdmrg44SMCLX0V4H5hShJi4O9VeR
	cl8zCDQgQMZO9xVUdSF4Dj1DUXswcJwyI3U1xDaT26RLCGP2rFQ8/tjjS4FdritnFHqb
	IaW7Swoam5cvxNGMkmHa/ZDh8qz1rHFNm7LTIWEbJ4T8O1g/Y6GbT68vvh1EIyt1wPeg
	+SZ2WmYjvc8m24iXXCz191NUXTj/XNhCtSj8fS3nNOoAn3ABPctgXmvOm1d72q80vkDR
	ixNA==
X-Gm-Message-State: AKS2vOxKkSu/v4GW3/2D03pfE3Nangk8RuFx45AABUGD680Moo+wXWPv
	KblfPLzs8FRyrtZq0g+EnCLgdGeM0Q==
X-Received: by 10.129.62.28 with SMTP id l28mr26788322ywa.130.1498066052613;
	Wed, 21 Jun 2017 10:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Wed, 21 Jun 2017 10:27:32 -0700 (PDT)
In-Reply-To: <CAKmWj-1bxyR6gCMpOf+nQPvAWW2vz8dULDnL5DQ141OMcohF9A@mail.gmail.com>
References: <CAKmWj-1bxyR6gCMpOf+nQPvAWW2vz8dULDnL5DQ141OMcohF9A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2017 19:27:32 +0200
Message-ID: <CA+chaQcd7tJZ+O0==e3=cfWFm_rBcaZHGnv5=9zhaX8QnMcudw@mail.gmail.com>
To: Paul Knopf <pauldotknopf@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: cflaat@medxchange.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 pyro support?
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
X-List-Received-Date: Wed, 21 Jun 2017 17:27:32 -0000
Content-Type: text/plain; charset="UTF-8"

tomorrow

On Wed, Jun 21, 2017 at 4:22 PM, Paul Knopf <pauldotknopf@gmail.com> wrote:

> I notice there is no pyro branch for meta-qt5.
>
> What is the status of this? ETA?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

