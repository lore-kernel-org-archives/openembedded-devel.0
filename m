Return-Path: <p.patat@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 381C66D290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:59:06 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so1791683wgg.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2013 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=f5Z5ZhnVA7Du6FckgSRdi+emAX5vw04bhGuhPRcEm+8=;
	b=eh+p9WGMcoei1BQtx0Wpcw8bptp7mavgRZKdXU7IL1meRzICyoETSyU7AMcTYLcitq
	WKtY/MLBcjf5ji+HaXR9yCIv9IIw5OPPubsU9pGCLQG4R1RzvS0DzP/rjv5sE7HDaZNn
	AjvGdWJP8/MJl8wM32tPHGKuqTQOAR5hIbHbL8pks11o0j6gI1izIkV7zqOt2wLKhcWe
	GLyC8tkN1Q/XxUzTSDEVcKIB2KPm0+92PAwQVENx0jYjCTvFiu0n5zAAE4Al6hEBffd5
	EnbdW3jlfF7rfIHNWB20zuquSo/4mwitkeFiTvLB6/SK8Sfm77pKrvh39T7jEsY7tB+y
	gcWA==
X-Received: by 10.180.231.6 with SMTP id tc6mr11820127wic.59.1383559146888;
	Mon, 04 Nov 2013 01:59:06 -0800 (PST)
MIME-Version: 1.0
Sender: p.patat@gmail.com
Received: by 10.194.9.33 with HTTP; Mon, 4 Nov 2013 01:58:46 -0800 (PST)
From: patrick patat <patrick.patat@innotis.org>
Date: Mon, 4 Nov 2013 10:58:46 +0100
X-Google-Sender-Auth: B2TrQ_lhAcvKs7VRRPICn_L8B3Q
Message-ID: <CAF+NyK4VcBrm7TNwPZdjzC1t0ma9VgCf+j31DSwD4S63z6T2-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-multimedia][dora] backport request libao patch
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
X-List-Received-Date: Mon, 04 Nov 2013 09:59:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Is it possible to backport this patch
http://cgit.openembedded.org/meta-openembedded/commit/?id=153372542a75625cda97b864afc25b3cac54772d
to
dora?
Without this we can't install libao plugins.

Thanks,

Patrick

