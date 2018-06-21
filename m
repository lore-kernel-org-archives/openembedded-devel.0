Return-Path: <mr.changyuheng@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 22E1777DAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 22:46:25 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id r11-v6so2217692pfl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=F5SPEe7bH5pNKnjxZRlNJxwDFXZ8vcyqSoGN5y2Fz+g=;
	b=Jo632VkAk0jlL53oZlq7RCOnlucyFd7o7yEOExqDnfiQs48FDtP2Mrr+fCVwmM2Pt3
	vwyyqDrOcoRYcbe8Klvc5eo9nSKGwBFWlonthX6kwA+yX2odItOklglJq0pvN/pFNNzr
	4blMR8j+/z5m90fFAFZU899Whvetv4WKWGd3UEzEoeuxaKQzvsKkM/cnvr2R/NtlRmqw
	vAy4IycOo/CHzD6chBwOZu8zJrzqLvlPEwONw8OCEzZnDxRzXRvlnfbEJc6Yq1XGTekC
	Z504BjunGa7RAPuYSKWRbiyZa+GcoOhAxDAeM3y1f+26oHH/zdtalw4/ak1c4s3od/Sk
	gnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=F5SPEe7bH5pNKnjxZRlNJxwDFXZ8vcyqSoGN5y2Fz+g=;
	b=pdRzWexm0dOtySFotvLPE8q4Pg4rUClV7TiuZHap6Hr1WTr5XzPL635WY7Jltf3UQL
	OPxJfS+FNHkfO7mNE88dIb8TlPm3QKaOV73L0tcIpEkufxE9axc4bOxRGV+4DC1XzF5F
	1Td2arb51nSho/L20QOysQgG7PtMP7cIz4W91g3e3oqw81+9dTy5QdYx3qSv0epqHP4D
	g67rySilUptCbTkuTCh0XcosEgDGyoETde6bOx6Cuq3h8oJK/0NuNiVxBu4Pjnl9o5If
	MWLfnicj9/6dLx2pu41pfJbrcmhdoE3xxAHpM3O7XqKSbfFvdDaRTk5Cf7Gxhf3jarhe
	e+xg==
X-Gm-Message-State: APt69E1TA2CIF+7H7i/9uN5Hj84kN3hz3amWTMXVCSVRQOeoB2/EABPF
	6RBxwN0nb+4hTUr+AHDaTPqcDI6m2mTfShpIbVaKYA==
X-Google-Smtp-Source: ADUXVKJHSCJ86Un0d62Z9TA933iLPa1LHP9ihQxktdhJuCbUhy7E++TY2jJDsRfv9UjJqAP6w4cL9nBTNRNpnLTFtsc=
X-Received: by 2002:a65:43c9:: with SMTP id
	n9-v6mr23769267pgp.399.1529621186037; 
	Thu, 21 Jun 2018 15:46:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:3b0b:0:0:0:0 with HTTP; Thu, 21 Jun 2018 15:45:45
	-0700 (PDT)
In-Reply-To: <CANnkhLOrKpULd6iUBOs--aJfRmNMyzY9T4MfF5T=AgNcOnBFPw@mail.gmail.com>
References: <CANnkhLOrKpULd6iUBOs--aJfRmNMyzY9T4MfF5T=AgNcOnBFPw@mail.gmail.com>
From: Henry Chang <mr.changyuheng@gmail.com>
Date: Thu, 21 Jun 2018 15:45:45 -0700
Message-ID: <CANnkhLN8jLmWN4-74EVFwyQPA8cGEsCO6ZV+inPXkk+Q-aE6vg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can't see my patches on lists.openembedded.org
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
X-List-Received-Date: Thu, 21 Jun 2018 22:46:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hi guys,

Does the mailing list server lists.openembedded.org have any delays?
I've sent several patches to it but couldn't see any results in the
archive. Or do I have to subscribe to the list?

Regards,

Henry

