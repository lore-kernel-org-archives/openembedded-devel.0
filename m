Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKKdi-0000Sr-44
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 03:24:30 +0200
Received: by bwz5 with SMTP id 5so1018101bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MeG3QFOnJeIC+bbDcbB9IbQR1TwbpN3XuNW54L6c1vw=;
	b=FHgXH5j//ufTKmimgRIltYX96trq1FiZpWeJrHyWS5Zl/9fXK30Vgv7nBVHNL8OOxW
	zLig+k40dctmdP2fVd/0wwAbk0Jy/1obOYpNwJG1kkE0vI0vFrVj1wiMcCsT78+cs5L7
	r073Y6ZZLqxhfJSEBk2dYjYTTPquFCV8gLnlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=M9LunBVUe+b9KjgsuFi/AEkgKQoVr7Ppjx1jgaMbPGW8tE0ai+QtOCe1INFQdP+fKT
	GsqubBUo0txg9F0shAlQESav22vhFy5YIELEP+Xjt0Bl8e5va14/EwOyJpIOx4B486A4
	4ySM1x1raLLMwNfK91uIWSO8IVs3QMky2K0YE=
MIME-Version: 1.0
Received: by 10.204.49.138 with SMTP id v10mr5626504bkf.108.1305163303107;
	Wed, 11 May 2011 18:21:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Wed, 11 May 2011 18:21:43 -0700 (PDT)
In-Reply-To: <1305145805-14609-1-git-send-email-eric@eukrea.com>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
Date: Wed, 11 May 2011 22:21:43 -0300
X-Google-Sender-Auth: kmUlqp1X1ROLctlu_NtZgFbCftk
Message-ID: <BANLkTikMJMOX+KF2Ge=T_ueUwPQXA_yssA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Update qt to 4.7.3
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
X-List-Received-Date: Thu, 12 May 2011 01:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 17:29, Eric B=E9nard <eric@eukrea.com> wrote:
> Please test these recipes you are interested in as for now I only compile
> tested qt4-embedded & qt4-native.

Please add translation package back; this is a blocker to me and this
was dropped since last updates (it was available on 4.6 recipes).

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


