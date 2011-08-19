Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QuR7m-0006nN-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 17:36:46 +0200
Received: by qyk4 with SMTP id 4so402613qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=D5G/dBIsgYdA1BM0Cz3vVWceg9UBI27Ej5ByY5MhD6Q=;
	b=ssR6N/REQmZMrWEmB5OB/dE6wyNApSo0q0m6js/7AMUXtndWAl0gjKcVOX+TfwXaJK
	CCG0GdAYwvyvO5ElaDqHBNzJt1AQ0M9Y2KR9RZSaAxjXIgOtddoEiRjpWtiQ3OSbPdIs
	2XeCIMEvJAZpqy9wDue6xcJ89JBXcWaQBMV9Y=
MIME-Version: 1.0
Received: by 10.52.92.199 with SMTP id co7mr2341667vdb.85.1313767925060; Fri,
	19 Aug 2011 08:32:05 -0700 (PDT)
Received: by 10.52.112.161 with HTTP; Fri, 19 Aug 2011 08:32:05 -0700 (PDT)
In-Reply-To: <4E4E8152.5030500@gmail.com>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de> <4E4E28AB.8010806@dresearch-fe.de>
	<4E4E717C.2040506@gmail.com>
	<CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
	<4E4E8152.5030500@gmail.com>
Date: Fri, 19 Aug 2011 08:32:05 -0700
Message-ID: <CAGDS+n=Fx-YYC6TbwWsM_xZEw4u0H1n5d8a0jMFwf1q+UZj+XA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 15:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 8:29 AM, Khem Raj <raj.khem@gmail.com> wrote:

>> Is there an easy way to tell OE to ignore a recommends for either
>> libgcc-dev or libgcc-s-dev? =A0The issue seems to be (at least on my
>> machine) that packages more or less randomly recommend one or the
>> other. =A0Then the image build fails because the two packages supply the
>> same file.
>
> I dont think there is a way out. I think one of those 2 packages should b=
e
> stopped from building

Which do you think should be disabled?

Steve


