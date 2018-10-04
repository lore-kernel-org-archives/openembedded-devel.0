Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id D10BC79A3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 23:14:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id g89-v6so8047800lfl.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I1vHeHa4mWMg0fBe//49Bik0+1RahDWGSHuixzNBAHQ=;
	b=R6qxoCd7NsZl4Hj/uPP7DF8qOB01iOtJd4T73btq/WYGgY3RzqpsuppgqCJ7MoJHka
	mv/zbddC3x1HI5LTfP9fGV+sSezv6eOfu5pAlQ3ZdBS8Bd08BR0HRSC5P2alBpypcW5k
	YeGlTK+EfLvLJ6aUvA55HD+a9aLwpRMKWxCfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I1vHeHa4mWMg0fBe//49Bik0+1RahDWGSHuixzNBAHQ=;
	b=Zb3dvGwHErLO6DmSu/9SnYCOUEND3Aie4biatrWf+9cug2ZGELAu9qqsfqAtXTLmfy
	wpZgy9j3LidXFC4751H8nJdPuveaQFGYukKXVmqmPTSiYX7Pcfu/Tpk2kifbjbIfL163
	SuudqGdQVIlxxI0zDtWkm8uq0tLfjedelgkCeOyAceaN+aI2hHX6PI1+9W3a/Wc1Cv86
	UXRBpmthFB9jM/uLHYGEpEdtJzOlVBm3mIaFQCROJhWg4voK/C8sx0Gu5J1xqEIMPbvR
	llN9w6QieauyfXpa+DsCy453nupFzELLQSb4FdI7rNFwsREmdmoKRrZNYude/RaWBqz9
	s5VA==
X-Gm-Message-State: ABuFfohCbKkxeZzrX7ae37rZ1aRrHDpILvs1DIYnKhuMLAd+6MJjzx80
	KV80GerZpZXGcwoBoLbBkN6dXfrHMO1rSLyD31hP8w==
X-Google-Smtp-Source: ACcGV63RZdbMVgRSlcQOZXO3YH74n3PgIwOWNxBXXJV6R7f/r23CdBQLQNP+P2TCBwuZP15wjOoxN6QO+vcuKgCrkTM=
X-Received: by 2002:a19:12a5:: with SMTP id 37-v6mr5251377lfs.51.1538694864237;
	Thu, 04 Oct 2018 16:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181004225610.13853-1-daniel.diaz@linaro.org>
	<CAMKF1sp9o5bUTANAHDJQORPzB-HHjcAHoA2r_NocKULEy3hovQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp9o5bUTANAHDJQORPzB-HHjcAHoA2r_NocKULEy3hovQ@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 4 Oct 2018 18:14:12 -0500
Message-ID: <CAEUSe7-KWFdmxiBSzfHtv5q00Vx=fsuOY3E91DthqFs5TgsVQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libhugetlbfs: Update to 2.21
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
X-List-Received-Date: Thu, 04 Oct 2018 23:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Thu, 4 Oct 2018 at 17:59, Khem Raj <raj.khem@gmail.com> wrote:
> seems like you forgot to delete the patch file which is removed from src =
uri

Yes, I did. :) V2 coming right up.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

