Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJWTo-0004Oe-8N
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:50:56 +0200
Received: by wye20 with SMTP id 20so4657053wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xO+/C6CMcWZyI63KrNT5jqJotBAQ6pVEOu+N9tM4Ktk=;
	b=DIFU484UXf0F8u3JYBkkeNx2v738i4vQt6YWuLdAQtc7lKfGgZjPLChry15GAoEisy
	AOoSvMeu0V9hKumAU1ba62OKB5VDxSnoICoQgSYxZkgyhz5NnyKLLly2WugLksLYXEj0
	khle1wHnKS6JsiqVic9C4AtTk3S+DfRcgePpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=MhoXyvgMBbb5Bqd9H81ZqkMdAvgiJxZKh2vj17rJtB+cIHNyXpJCj5ob2m1b9R/93t
	o3+xv19GhKrTZASmudRkcw2WD1B+t+/1Iaml4L+9Ae2Jc72KhvqX/oTHEjo6U862Ns3A
	l682T/iBf9+y8lw420qP0VOf/QgKGuKX6hkME=
MIME-Version: 1.0
Received: by 10.216.121.200 with SMTP id r50mr3234303weh.7.1304970491438; Mon,
	09 May 2011 12:48:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 12:48:11 -0700 (PDT)
In-Reply-To: <iq9feq$rn7$1@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<iq9feq$rn7$1@dough.gmane.org>
Date: Mon, 9 May 2011 16:48:11 -0300
X-Google-Sender-Auth: hjyzO4TEAxpmejPhyrBZ6YByuC4
Message-ID: <BANLkTi=154VwfG32+DzjurgbbBmYHHaSHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] Pull request for misc changes
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
X-List-Received-Date: Mon, 09 May 2011 19:50:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 16:31, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I've merge the 12 patches and I'm doing some final sanity checking
> before pushing them.

Don't put the setxkbmap on the merge. I will resend it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


