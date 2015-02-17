Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 105C865C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:04:41 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 142so12080511ykq.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=s7Po3VNVUZJotKGg1YlG/5D3tx8ZVtEYLz6jfpqTUmc=;
	b=QlyN0gBiNhFIhYPbZnGWHZMIqvQ8kt0gaGkWhaEZulGh+4PJx5TxyCIAgcgaDlAuYS
	fTU6bUo0lEQR84pcRwXAucOZa3GwxKT8Hy7EgVDEJO3tgTpq4KsjR6fafPrjLo3iSteg
	N1E2uyHDuoMhbJNFCfWfz58Hq8dnnIOiUSvSlLim8ilpnue8+jM3xa6uZBasorJdGvhe
	PSRhNC30pqR1OhgWR8Ar7z8p7pIVZ4+BoUrOmQ9bnV4Zaj0uIIYGF3ne877GxvWWVY/g
	ZlPeSHA6bh2Lp+fAZ6Ezt6SgmsYKWPXzoj/5Qo1+pyJFmJunL8ezit2Sv3+SGCfpu1j8
	vy1w==
MIME-Version: 1.0
X-Received: by 10.236.22.71 with SMTP id s47mr1329782yhs.37.1424178282958;
	Tue, 17 Feb 2015 05:04:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 17 Feb 2015 05:04:42 -0800 (PST)
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA062A02C5@SEXCHANGE0100.lpg.priv>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
	<20150213142036.GC7116@saldanha.aker.com.br>
	<CAP9ODKopq=3zswceRwSDisfaS1WXiJBg8-MT+8rARQ_ncu3QZQ@mail.gmail.com>
	<F48900D76F0D8349918584FEEFEB4BCA062A02C5@SEXCHANGE0100.lpg.priv>
Date: Tue, 17 Feb 2015 11:04:42 -0200
X-Google-Sender-Auth: _MD5GyNmMQIVNTYkyWEXRhDcdn8
Message-ID: <CAP9ODKpxGD4nNzCcwYYJ3oggxo_N_Mo7JrDnxM4kZtAojCJR5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
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
X-List-Received-Date: Tue, 17 Feb 2015 13:04:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 17, 2015 at 11:03 AM, MONDON Daniel
<Daniel.MONDON@lpgsystems.com> wrote:
> In may case, it is icedtea6-native (for java 6)
> :)

This one I think we fixed ;)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

