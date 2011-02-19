Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pqmbu-00025H-Ef
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 14:12:30 +0100
Received: by bwz10 with SMTP id 10so621145bwz.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=weg5NcLyFSIBq9xxBrvHgrg1B5xBNYvU7mUgx1R8IG8=;
	b=WMhzKZWkpxfFZNERfzASFmC6vTMXRftbwZPQHPIoSdEB4hGp2vHYJlpB02s7GxYUWL
	0LpAD/97oo8bNta29m2uV72OpYuGp3XS1die8NqmvSskjfHKzdwrpOPYZywLdIil1GmY
	e0+GOI+ZbzxnWIlP+zhtV2fxG1vwX0Us8m8Hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=unZhCbQ6oqharN3I89BYclok0y6hf0NUQcdPD/WPG0JSWnggo4BeXIJaDoZBNL1AzC
	zPOqsrCHLB3KRusuQ4xZYFJHUc8lnhHksVaNuvNH97nY4fPThmDc+eweVcGNnvH5SlgP
	rLNgmBtjmfru0YxH4R+tLbGavZsnOE+Qh8U9M=
MIME-Version: 1.0
Received: by 10.204.46.210 with SMTP id k18mr1634230bkf.159.1298121074236;
	Sat, 19 Feb 2011 05:11:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Sat, 19 Feb 2011 05:11:14 -0800 (PST)
In-Reply-To: <AANLkTinwo=chD6eARn_EQeJuRPwbUYsnkx0EBVLtbCvL@mail.gmail.com>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
	<AANLkTinwo=chD6eARn_EQeJuRPwbUYsnkx0EBVLtbCvL@mail.gmail.com>
Date: Sat, 19 Feb 2011 13:11:14 +0000
X-Google-Sender-Auth: gd1Rg7eYVbUj8y7H7TmWbT5q9l8
Message-ID: <AANLkTi=d-wg=qxkCU8kj9jdZ1bzB8kUOJwPD1SQcn+Xd@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Patchset pending for merging from O.S. Systems tree
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
X-List-Received-Date: Sat, 19 Feb 2011 13:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 19, 2011 at 13:04, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Applied the first 10 and the last patch.
> Thanks for contributing.

Thanks by pushing them.

> I did not push the cmake patches as they have no acks yet and I feel
> not comfortable with cmake.

Right.

I already have few more patches queued up and will send them once
again for review on monday probably.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


