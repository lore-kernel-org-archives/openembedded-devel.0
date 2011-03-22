Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q25lm-0002ZN-AK
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 18:53:28 +0100
Received: by bwz10 with SMTP id 10so5870105bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=hkJGMcFQ/5d0f7mhWQT2papkcVg1rjo+BVhEJKkedus=;
	b=TqSnCaBSMMfJrcpzWGwjA3eC7KFPwu7OeKcd/ZmKId33U8J1c+OW8pLQz+/i2VFbfJ
	3Vfx90aWMExpIUNF5n0VsqhWf84QscLpjTHF8pbRoQll1hqH0SWBuprG5UPOOx/oKIV0
	SukCQj/v8UWaQVfWPZDU0KNewBSIJuhrXDHLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=BpqJchM6ZJDPZoOmANcY5oxFOOXSk3F6xsg9mAIhTCyYnBed/Btrews+qB8/YFA2Yy
	KZXfkHsPrVQzaFdr6wRUPkt0Sn9ETRhyyIiAnTd8qE/BCaOnwLhPgokOt/phnCTF8Ba9
	a+F5tPwt4KpkJg47i6um1BHMDBkIYBvRxvnko=
MIME-Version: 1.0
Received: by 10.204.141.15 with SMTP id k15mr691753bku.50.1300816296055; Tue,
	22 Mar 2011 10:51:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Tue, 22 Mar 2011 10:51:36 -0700 (PDT)
In-Reply-To: <20110322172251.GB22283@sakrah.homelinux.org>
References: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
	<AANLkTi=Q6ATHuoUN87y8G9futYc+2iJ9c23YLRfPYOZj@mail.gmail.com>
	<AANLkTim2xJnB2x3gDkA4vfmghv6UeamRcUPYXhSxjxjf@mail.gmail.com>
	<20110322172251.GB22283@sakrah.homelinux.org>
Date: Tue, 22 Mar 2011 14:51:36 -0300
X-Google-Sender-Auth: 1e3cucEqXFZ17at9YgbgacikJEg
Message-ID: <AANLkTim6tyczYw-1YayMzzD6c3nPF3fvhAAwHvhUhntM@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 17:53:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 14:22, Khem Raj <raj.khem@gmail.com> wrote:
>> I see no point in having lzma images but we can use xz utils to
>> generate lzma if desired. I'd say to us to drop lzma-native and use xz
>> to build those or drop them.
>
> Seems ok. Can you cook up a patch ?

Sure.

Will do for next patchset.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


