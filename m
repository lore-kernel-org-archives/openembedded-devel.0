Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id D22C872A78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:49:39 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so74243474igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=IfutUXaMfR9wHkJgc646Xt8k5sS1cgu4sWXyaH6W/sc=;
	b=i6q74FJNIO0BF6qMEdNAMtIp+QelIwP76jAZT1x46NbvTF2mOr7v+a2jgYSVRDUVuX
	9AEROhY0e+gUiq9j0s8ollU4dhzWAq3G3qMlfszmG0zTrYF7/nBqWdAjKSUlN2nYU7E0
	iC2JKj39arcrF6l0KXKFZtb8+g46yEmINMK0InQR+0SbtE269r5RWvi1ITuNm1bxxf1u
	2S773Zg+bNRo4MCB7HzDx3RsjghQdWGR9nVnsHTUQJRBYBrSkWFVmEkKlAGj72ugyMrn
	t60SJXsmq2SEmtgGBKwFN853EmzYqgh6cJ/1s524TpgkTZEgfO9XGjfo/O80+ER8fNB/
	kvGQ==
MIME-Version: 1.0
X-Received: by 10.50.79.195 with SMTP id l3mr15158664igx.30.1430160580455;
	Mon, 27 Apr 2015 11:49:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 11:49:40 -0700 (PDT)
In-Reply-To: <1430160343-2781-2-git-send-email-Martin.Jansa@gmail.com>
References: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
	<1430160343-2781-2-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 15:49:40 -0300
X-Google-Sender-Auth: HCjsgkgcxokpa6bf4YE3HpcPltY
Message-ID: <CAP9ODKorGEwbAPVawZCOPCA3gH2y8YOAP4j27AQixPUM8uYZ5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] libsecret: add missing dependency on intltool-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:49:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 3:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

