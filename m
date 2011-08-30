Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QyQTQ-0002nr-GS
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 17:43:53 +0200
Received: by bkbzu17 with SMTP id zu17so5079531bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OT/iIDfxkkpfarDY0SuE+XXyqR3VeqSn9n/+0Wuaj2Q=;
	b=SRjxyaEKkBP9z8+Wav0n+TNktPS1MSvsLx8Zbjqztpq7IdomTK/RyPtHHVs23DOBrO
	XiVnYVLRjbH8uXooAAzq77IG5qQY0sH+SDR/DP6dGvIm9KuvpZnd0c4904VzUNUib+Hm
	uM0bgxGXLsPoiuha4FbehrqWWKXLTX6UMy7zA=
MIME-Version: 1.0
Received: by 10.204.157.25 with SMTP id z25mr219074bkw.212.1314718723206; Tue,
	30 Aug 2011 08:38:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Tue, 30 Aug 2011 08:38:43 -0700 (PDT)
In-Reply-To: <j3j01o$35m$1@dough.gmane.org>
References: <cover.1314710525.git.otavio@ossystems.com.br>
	<j3ipqj$ib6$1@dough.gmane.org>
	<CAP9ODKpaJAfkqxUwcBq=TO6Ye68s88EY12k_M=qgy08ZP5r6QQ@mail.gmail.com>
	<j3j01o$35m$1@dough.gmane.org>
Date: Tue, 30 Aug 2011 12:38:43 -0300
X-Google-Sender-Auth: RdWeF8DY9OoYui14YkBkZDgBPYI
Message-ID: <CAP9ODKoTv-rGDY8VrgcoBNKDjtU5P1wBS8_Uk71506qKbpPs1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] Remove recipes from meta-oe
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
X-List-Received-Date: Tue, 30 Aug 2011 15:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2011 at 12:36, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> 2.21.x breaks for arm with the armv7a-sec instructions

2.20.1 was failing to build here.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


