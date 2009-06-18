Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1MHNH3-0002BL-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 21:27:51 +0200
Received: by gxk2 with SMTP id 2so1779706gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d8jvRXJm6hf0K+2flFRAI5LI9GBh3gbr5JJMbA97B8g=;
	b=GSY58d2n1eFGOYFsxWx4PsJthGNIctcZcWVBe8fkS51Qtnwk8DUp+ZtbX44+8Wuchn
	XFVV6ZiLF7rAncre4OGJK7Asc5S9UahE6Oce22D+nww5yz36wuattQCVyyJYtxD10ZwG
	C3IjeuwOBE+bjRJYYIRq1g8q1mOh3rN7bQAk4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SfeCQs+qkKnl9Rkqi8cVBuld9y0dCeqv6B+3nqDqMIid+i87iIVDsNh8FmzXKI0BJN
	mAnMmHYgEt9oW5G+6LfbdC0KT9dheAfgq53ld0sJH/nPaNvMxL1FBd4LZ/qjLy5hJuRM
	FafNuJ25iA8Z2FXwSQRqb83JSM8nDq8DYA4h4=
MIME-Version: 1.0
Received: by 10.150.124.11 with SMTP id w11mr4204429ybc.34.1245352633385; Thu, 
	18 Jun 2009 12:17:13 -0700 (PDT)
In-Reply-To: <200906181438.27000.marcin@juszkiewicz.com.pl>
References: <37367b3a0906180511n7ed19782j28fcf902cb9077fd@mail.gmail.com>
	<200906181438.27000.marcin@juszkiewicz.com.pl>
Date: Thu, 18 Jun 2009 16:17:13 -0300
Message-ID: <37367b3a0906181217n117c0863r914d36052a3daa62@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Thu, 18 Jun 2009 19:27:53 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On 6/18/09, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
> Dnia czwartek, 18 czerwca 2009 o 14:11:58 Alan Carvalho de Assis
> napisa=B3(a):
>> +CONFIG_SYSFS_DEPRECATED=3Dy
>> +CONFIG_SYSFS_DEPRECATED_V2=3Dy
>
> Removal of those two would be handly but linux.inc takes care of it
> anyway.
>
> Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>

Thank you Marcin.

I will fix it and send again as PATCH v3

Regards,

Alan


