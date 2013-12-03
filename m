Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id A60D16AA18
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 23:40:35 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wn1so15204447obc.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 15:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6uoVeE/l2cBMB0e8/sTe5jIDfF6c6MYtJo+lXRoUjtw=;
	b=DhSZ/n0HtVa/2E4qRRyq2NlQ5xYqJmCCChBsNinZE2fhnVsPR8czOxcFGiG9zVBnUv
	okaAmlJa8fgQ3aCU/vzYn5sjtxwRDC+TTH4JK1+GTKgitiP/XwHuqP73/fNY6BQyoYON
	mvqBeTL05nHxbBQfZSp+Ipw/1AVn1GZGOVyflRemAFHBpGF46jYN0R3mGw5H+fpmjG0h
	UUdTpK83nYSDGKAVIjodN+I1jleqTpsHcUGnp58oAf2azxS8yPuos2bQrmJrYIdpWU4H
	0TE6acAhUMRM74w2r5DzPia+EsMhV+CM7xg8H0alXsWZPadX9tsP+g3OVDZHF8wH+OR5
	oP3A==
MIME-Version: 1.0
X-Received: by 10.182.143.103 with SMTP id sd7mr20598obb.70.1386114034730;
	Tue, 03 Dec 2013 15:40:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 3 Dec 2013 15:40:34 -0800 (PST)
In-Reply-To: <20131203230542.GG3714@jama>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
	<20131203230542.GG3714@jama>
Date: Tue, 3 Dec 2013 21:40:34 -0200
X-Google-Sender-Auth: Axj25OB6Te_rpk9yKIpIHtFTSqE
Message-ID: <CAP9ODKq16jf4Q1p+3uQu2N5o1sf2oA_9cnBcLAUXQw=Crbm+VQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe 1/5] meta-oe: Drop pointercal-xinput from SIGGEN_EXCLUDERECIPES_ABISAFE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2013 23:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 3, 2013 at 9:05 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Dec 03, 2013 at 07:44:03PM -0200, Otavio Salvador wrote:
>> The pointercal-xinput has been moved to OE-Core so we should handle it
>> here.
>
> Is there patch for oe-core doing that?

No but I can send one. Do you handle it or want me to do?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

