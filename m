Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KQm6l-0004yr-8M
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 18:43:31 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3843rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2008 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rp9/7+pIxZgBFNo9cSPc5z58EBPb6ppwONDWsNWKYCk=;
	b=jpVrQZK0RQwv+tyG7pAIZzVSjyKVpU7mQxueDhrNZEc8OgMobzSQL+fk7rRzoOzwbc
	yBzH6ECgkYSFJBAEN0DcxvM24sanr/GypDW7yiAFwnIdEIXWDskXqpvKNnMlvN9GVIuR
	AJWMZIcgXHu2WIx8xstzMrh/8FVHyKoYUM79c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=UZBpGIfu1L1o0KvpdCCsoF55B1sQissGdIRKTwOfkTxotSjjMYGj4WTROygVKJRUq0
	L/7DIytp0wGhN1KlpoMfbl86DLWTZgW7y3OoKDbkhV1JqKm6Z/VOkvDJ51jt0DEeHzvz
	JcrtJaZWfxEj9hnSIgv9QkoUTETjHJeHjo6gE=
Received: by 10.141.23.7 with SMTP id a7mr152363rvj.58.1218040999503;
	Wed, 06 Aug 2008 09:43:19 -0700 (PDT)
Received: by 10.141.163.6 with HTTP; Wed, 6 Aug 2008 09:43:19 -0700 (PDT)
Message-ID: <c384c5ea0808060943q392cefd2i240e76a096aa4edc@mail.gmail.com>
Date: Wed, 6 Aug 2008 18:43:19 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
MIME-Version: 1.0
References: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
Subject: Re: RFC deleting libpixman in favor of pixman
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
X-List-Received-Date: Wed, 06 Aug 2008 16:43:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Daniel,

On Wed, Aug 6, 2008 at 5:36 PM, Daniel Willmann
<daniel@totalueberwachung.de> wrote:
> Any objections, something I overlooked?
>
From the April 7th discussion; please keep the DEPENDS for pixman
empty, so do not include the
xorg dependencies, as pixman does not have any depends.

Thanks,

Leon.


