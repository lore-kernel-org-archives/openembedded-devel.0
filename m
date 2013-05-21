Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1FECC69697
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 03:02:42 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id er7so163880obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 20:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=/uc3TNWnApJy5bSgqI6FEAhpmPSC8RVWM5ypT/0DLR8=;
	b=ckIzw6J0uFXp/PGNmPtMu2OF1kmaeDQakSZpADs7nJR2kr6vNJXvfwgsIBkrlsLqws
	5/TQDbncWmg2z2EBlID8A3KK4WbBccbtWJ74EaSvklhbJnBB6opPoT9beFjB0Xf6dJp/
	4qC2sDtGBrWXkRczTwAjMZTtZaYwtEAE4+FpV48AJ3EVwp3InGzej3/WVkwAD9S1Hjza
	JLH38isxRSot2DwRtyRQVjc+eZZ2I1DAQpmR12kmYI5yp3N6RuROja59vOgXdBzq1dBX
	MCVvenHgN8qFoAlbFuW5ZuJOlcx2g7i2LtQyOl0AErfZSMqWT+hp/l9q8RyZZnX6FFoA
	GF0Q==
MIME-Version: 1.0
X-Received: by 10.182.40.202 with SMTP id z10mr190368obk.74.1369105362587;
	Mon, 20 May 2013 20:02:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 20 May 2013 20:02:42 -0700 (PDT)
Date: Tue, 21 May 2013 00:02:42 -0300
X-Google-Sender-Auth: p1vZ5EPkVsyKtqN8sISsBwBi7f4
Message-ID: <CAP9ODKr+v8t-FjbFFc-D+P+L-753yuz_EyPEgrWsm1gz4mKHsQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [for-danny, for-dylan] Samba fix
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
X-List-Received-Date: Tue, 21 May 2013 03:02:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

Please cherry-pick the bac6da16a0d57f30c2cde1d805b3957147abdaeb into dylan
and danny.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

