Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q24l2-0003ge-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 17:48:36 +0100
Received: by bwz10 with SMTP id 10so5810891bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ZzNzCFmjTxpUCQ6ScJiRV2I0gHOfVHqH6gmY+N/eLrc=;
	b=wHqM8gqM6SxFh5mAJGEFrhGv5cZ1NkhG4KBfRr45ECLZ+S1Ju2UChAnXmUkrvH9X2h
	BdD1gZrdZibkMXuHVoxwF0PygVF8cPClmkKZ+tFtXbANi8qDOlICFSjaq+v+cQD8wyfU
	fPzcY+I0UvNQTqyTR6QpgugZAuUxg7JMMKfrk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=dKAVxedcvFo/NDE9e+bLZ6OXrtMGfOgIxehW1VZT5pJiFljxn9bO4vXYuTC0IB7v6t
	y5J1lKEjRrrazjsXuc0fJ5UGsUhJQHSk44yxrpI+OueHOPqX3ZTiqIeQt1P4sJSrzcAk
	3vHi99xtPh9AV0zR2rJo8Ose5y99XvgpDGhnA=
MIME-Version: 1.0
Received: by 10.204.133.91 with SMTP id e27mr269828bkt.23.1300812406258; Tue,
	22 Mar 2011 09:46:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Tue, 22 Mar 2011 09:46:46 -0700 (PDT)
In-Reply-To: <1300812057-24450-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300812057-24450-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 22 Mar 2011 13:46:46 -0300
X-Google-Sender-Auth: damWF-h6-WVxGYdVDEDn61XpnSE
Message-ID: <AANLkTimvvF9NRr4pizr0ZuGjm2yEAGXVhZeSMFUObhB4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] native.bbclass: define empty PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 22 Mar 2011 16:48:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 13:40, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


