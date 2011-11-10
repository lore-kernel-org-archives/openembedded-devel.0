Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROZ0D-0001TR-7W
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 19:05:29 +0100
Received: by bkbzs2 with SMTP id zs2so2663282bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PlkR6ckOAqoJnb3/sAbzl5Hl1TP1YUFbOIlj/q56SH8=;
	b=LpkOAQhmGJHiXz3Qt6Qc3suS2CvSmbYiM5bjlqSg52bfsFa/4cvvjGxGuwSW0Aqk6b
	BWKnYNph1Iz9CUNLIQ0BLjn4GncsP97q5B6wVi6b+p/Gba2yhEIHi5PSQJmlmXWcIUP2
	ZGg+BV7bwEAc7icgbtn+lRwcfqW+Th1zhwkfI=
MIME-Version: 1.0
Received: by 10.204.141.156 with SMTP id m28mr5814387bku.26.1320947951157;
	Thu, 10 Nov 2011 09:59:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Thu, 10 Nov 2011 09:59:11 -0800 (PST)
In-Reply-To: <j9gusc$722$1@dough.gmane.org>
References: <cover.1320942838.git.otavio@ossystems.com.br>
	<2c620d32a60fd571d00a4b98b572d60f49bf8b0f.1320942838.git.otavio@ossystems.com.br>
	<j9gusc$722$1@dough.gmane.org>
Date: Thu, 10 Nov 2011 15:59:11 -0200
X-Google-Sender-Auth: usqpB9YMf47UMfL5J2Qz-3aRGnk
Message-ID: <CAP9ODKpPXz_Lj60bDBB==enY3zRM6gLCbg+2A8qhxf1DDMKCeQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] atftp: add 0.7 version
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
X-List-Received-Date: Thu, 10 Nov 2011 18:05:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2011 at 14:41, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
>> +DESCRIPTION =3D "Advanced TFTP server and client" +SECTION =3D "network=
"
>> +PRIORITY =3D "optional"
>
> PRIORITY doesn't exist anymore in the oe-core world.

I fixed the repo with this change.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


