Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N79CD-0001x8-GM
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 15:56:52 +0100
Received: by fg-out-1718.google.com with SMTP id d23so1052081fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=LZIQA/s466l14M5fUMViZhigJPhjQoqgQIJdpD1NIA8=;
	b=G8c65CfkDG6CT73uiwAUWJ8e6GIvBgM+Sumorf3Avqr0M6836QF1lElE2jxC70y+xu
	0rWYBQRYpob/rvY8L/MrdYZhZOS94SyRGXZAlYynGqK1qli8m4kufgCgeRkuI1KiLpuJ
	mhbohqx8McLx5JWDZ0iAE5ftAH3CsAbng28uA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=PfgHYMsE7gLsOKV3tA4jCBX44tszokGEt3KkJdCdo7G4Bp+MUV39rJx83Vt3BwhJAk
	Vc4MYasaXUjylKwGnmQ1bCHOca+fTnWRKU1AeYXgtEEeBW/aOt/cXao0hU14xzwZpncR
	wyflKSU+32E3USeUQecOxiK1WPwsdTh0N3XKo=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.162.129 with SMTP id l1mr628366hbd.206.1257692135663; Sun, 
	08 Nov 2009 06:55:35 -0800 (PST)
In-Reply-To: <ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org> <1257682982.26962.14.camel@opal>
	<hd6ggj$tf3$1@ger.gmane.org>
	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
Date: Sun, 8 Nov 2009 12:55:35 -0200
X-Google-Sender-Auth: d5d7c2edd7987bca
Message-ID: <be7a9f3d0911080655o4eff671cnaf59a134e7a97ac5@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 14:56:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Nov 8, 2009 at 12:08 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Without making a comment on the commit message:
>
> As stated before the 3.33 version is clearly mentioned as "latest
> development version" on http://xmltwig.com/xmltwig/
> The last stable version is 3.32
> This project decided to provide snapshots (or whatever you want to
> call it) of the new version. In this case 3.33. Their choice.
>
> IMHO OE should have used the latest stable version.

I fully agree and I didn't notice it was state on their website; In
this case the only wrong side here is OE (not upstream).

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


