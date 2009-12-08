Received: from smtp1.cybercity.dk ([212.242.43.251])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NI9EQ-0004zZ-2V for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 00:12:37 +0100
Received: from natla.sgh.dk (0x4dd5bf76.adsl.cybercity.dk [77.213.191.118])
	by smtp1.cybercity.dk (Postfix) with ESMTP id 2CA67586811
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 00:13:57 +0100 (CET)
Received: from phoenix.localnet (phoenix.local [192.168.0.226])
	by natla.sgh.dk (Postfix) with ESMTP id 42E386334
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 00:53:46 +0100 (CET)
From: =?utf-8?q?S=C3=B8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Dec 2009 00:10:54 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-020632-generic; KDE/4.3.4; i686; ; )
References: <1260221130-4958-1-git-send-email-sgh@sgh.dk>
	<hfl1ck$sog$1@ger.gmane.org>
In-Reply-To: <hfl1ck$sog$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200912090010.54382.sgh@sgh.dk>
X-SA-Exim-Connect-IP: 212.242.43.251
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Unset DEFAULT_PREFERENCE for mesa-dri-7.2 and mesa-dri-7.4
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
X-List-Received-Date: Tue, 08 Dec 2009 23:12:37 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Tirsdag 08 december 2009 09:05:40 skrev Koen Kooi:
> What's the rationale behind this change?=20

virtual/libgl pulls in mesa-dri-6.5 which does not compile agains libdrm=20
2.4.11. mesa-dri7.4 compile clean though.

> And why do you comment it when we have an scm that can track changes?=20
Ehm ... might not be the best change then. My apologizes.

/S=C3=B8ren Holm


