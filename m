Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHEwB-0004CT-GJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 15:15:03 +0200
Received: by bkat8 with SMTP id t8so5088874bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VmHk4f4XJSAFmblKPFu2IsCCmFEXY+4cNhfBNoF0VzQ=;
	b=kgX1f7Yw0d7lN1N3TGw8a2pUB96fNMo+UjyFLJh1aZwCEIX5NxnHA/BDgiCs2FSed/
	Vev4ASVD+6Z5/QLe+OEESwJTvpENUvpnY6UQ18u+tSVNiyHy213NB17+io/KUktkm/b5
	D16nZH5hI2w1b8FiIOOt5HKpgC7hW+dRbcx2A=
MIME-Version: 1.0
Received: by 10.204.15.194 with SMTP id l2mr10620042bka.83.1319202543254; Fri,
	21 Oct 2011 06:09:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 06:09:03 -0700 (PDT)
In-Reply-To: <j7rp7b$3nl$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<1d63385213ee2d6741906cf2e61ccfb6fee58270.1319168013.git.otavio@ossystems.com.br>
	<j7r1gt$3jk$1@dough.gmane.org>
	<CAP9ODKryW=T3KVjGu1F1sWovbpZYE5eJSRTe+f+WxbAnQEJ0Xw@mail.gmail.com>
	<j7rp7b$3nl$1@dough.gmane.org>
Date: Fri, 21 Oct 2011 11:09:03 -0200
X-Google-Sender-Auth: yWMWuhOCejFfWL_2QVtWvbqlO7o
Message-ID: <CAP9ODKoOaeN5TAd2g=6_847mjagDua1Q0n6wZeAq3-rduEroeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/4] systemd: do not recommend systemd-serialgetty
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
X-List-Received-Date: Fri, 21 Oct 2011 13:15:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 10:40, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
>> Someone moving to systemd will need to review everything once again and
>> it won't hurt to add one package if he really wants to have getty on
>> serial. Many won't want or use it.
>
> They are getting it right now with sysvinit already. What about a 'serial=
'
> MACHINE_FEATURE and move it into task-basic?

Works for me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


