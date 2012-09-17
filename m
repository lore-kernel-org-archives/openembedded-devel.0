Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDZTR-0001rk-Fs
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:26:45 +0200
Received: by iebc11 with SMTP id c11so9704045ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 04:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=H4UjqG5TovaruvHd1XA777NuVblIrpJ2VG4LBrMtSmI=;
	b=FS2Fx862YFutkK/ufsljskcF0ZNS+ZrxG+Ios6REXgP7GKosg6fBSiWciazwxHYgAp
	KMiKdH/zNlCX6eVcoLSKJJPeke5MssZYDMGHR/xGZ8HcRUrcaXEhDcyaawBsVMs6vm/Q
	/Fl07HR/sraN9XqD4IeQ6baaPKhCBJUgkWdDA1lgL1tBQX05xxCnjO0fhs+rdL3doAy0
	p/1lo/PeBPBaK/7gT6zN7YMxeuASNOZrH4EXA56mrUM3lXgKmfcOAPh2fQus1F577Qna
	j2NxxmYsWXC/c6AXx9FdsUSAAxu7xjyN5cvrkGqSdV4LtfZlvc5Id3csNKcrRlOu7PCT
	yHDw==
MIME-Version: 1.0
Received: by 10.50.5.180 with SMTP id t20mr6424421igt.31.1347880446371; Mon,
	17 Sep 2012 04:14:06 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 17 Sep 2012 04:14:06 -0700 (PDT)
Date: Mon, 17 Sep 2012 13:14:06 +0200
Message-ID: <CALbNGRSJPF_ecKSaeM4+URRuHBgPXhUJavqHuciq+Q1SOoO9+Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: xfce update question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 11:26:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a huge patch series for xfce 4.10 + plugins under test. Is
there a chance getting applied these days? I am asking because oe-core
is in release-freeze and I don't know if meta-openembedded does same.

Andreas


