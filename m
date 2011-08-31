Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QykW2-0001i3-DD
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 15:07:38 +0200
Received: by bkbzu17 with SMTP id zu17so772488bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CoFV/Z77HwAFSRp1vh4xRmE7OnCGIn7gnDyWES+J2rw=;
	b=SBU5Iqdize2EIgt6TREkb1yxWC7QNelr+ZXEOXOIlEwWwmOF4SmVMwxvx/vGOH/zUn
	aW0LL91BjK21Ppd9I4vTw7MjUHSUpK7I1hyujBdWEHdPx0Be+vAUa0cdtsdZSxwcUhAR
	ysbNJYUcW4LarbeO6i4kIIuezbUy53FP1Ut0c=
MIME-Version: 1.0
Received: by 10.204.148.154 with SMTP id p26mr253036bkv.160.1314795760908;
	Wed, 31 Aug 2011 06:02:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Wed, 31 Aug 2011 06:02:40 -0700 (PDT)
In-Reply-To: <j3lad2$v75$2@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
	<j3lad2$v75$2@dough.gmane.org>
Date: Wed, 31 Aug 2011 10:02:40 -0300
X-Google-Sender-Auth: -2VuKs7fYkKy_MF3A7xj8R1qOqc
Message-ID: <CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 13:07:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2011 at 09:45, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> Please accept PR =3D "r0" on new recipes since it makes it more consiste=
nt
>> and easy to new users.
>
> Consistent in what way? If you want to be consistent you need to add *all=
*
> variables to the recipe and set it to their default.

Not really; consistency has nothing to do with verboseness. PR is
something we will need to change ofthen so makes sense to be in
recipes.

Besides, this is also on the policy so or you change the policy or you
follow it. Otherwise makes no sense to have a policy if the person who
merge the patches do not follow it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


