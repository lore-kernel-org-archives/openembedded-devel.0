Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpoEc-0007am-7i
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 21:44:26 +0100
Received: by bwz10 with SMTP id 10so1862884bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 12:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mMEQZumnmZFjmMhXIKWX462XjtBKCOj2KMn6YmqtEKo=;
	b=pXdVurqiMyqYNkjs/RVji9woOG+hPxmQT52mE2Q86tqzmy69IVh1pTvazCqZG3uXJK
	ngap9+SlSmkzGxHUpqtLZzntk28yh8F+LMMu5ZWHV1eHTNPDWsRtIROaBJT1TEeG/tnB
	zgmPjQsZgCPWPe1PO/1UVCd3d4A6Of5XSm8dw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ZbzM1k3YEXDDXYkhuvJpi+jaEEgOT/okAqU62OAxcNa6VSbqToc9wRExqWlR5x2tLJ
	o8GlLuieAV0QX9qDfoF+B9qEw0HU+tu0AtQ1WOheSJagmdTI7wGg0VlbmKYeklNRI4HI
	wR8fKHrovGab3tx3mTGm7BttrMX2DueAP8Ygg=
MIME-Version: 1.0
Received: by 10.204.15.83 with SMTP id j19mr865293bka.105.1297888994178; Wed,
	16 Feb 2011 12:43:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 12:43:13 -0800 (PST)
In-Reply-To: <AANLkTi=pcOHKF78X_uezE9Yqj9m=TLT5FPsWePp_Vs11@mail.gmail.com>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
	<AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
	<AANLkTi=pcOHKF78X_uezE9Yqj9m=TLT5FPsWePp_Vs11@mail.gmail.com>
Date: Wed, 16 Feb 2011 20:43:13 +0000
X-Google-Sender-Auth: 9lllPiCe2JarVqLXNJSYX44PPd8
Message-ID: <AANLkTikC-UoqKmOEC8-qWu3eN0CGAT=vsZiYF2mhuvYr@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Pull request from O.S. Systems tree
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
X-List-Received-Date: Wed, 16 Feb 2011 20:44:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 18:23, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 15, 2011 at 11:45 PM, Frans Meulenbroeks
...
>> And one request (or maybe discussion point for the community).
>> Would it be possible to post patches. That makes it much easier to revie=
w them.
>
> on contrary, moving forward this would be a better model where folks
> can publish their git trees to get soaked in upstream.
...

For me this works fine. In either way.

I've been using pull requests internally and also in some other
projects which I am involved. Personally I think people that work more
frequently on OE or big patchsets are better reviewed using GIT tree
and sporadic people can use mail patches since they can even don't
have a place to put them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


