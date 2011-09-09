Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R20HS-0002Go-Iw
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 14:34:02 +0200
Received: by vxh2 with SMTP id 2so180114vxh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AEkvOdCP1E+pfhRhKnxY7hbMvQjkyY/XrPKPkXlRhyk=;
	b=KX8Arb809YA6s6LzKmpOmOAAk4uWywesNuWQZ2VybZUb7ynn0jy0IwR8UN+Z2SI332
	nMtUBqS7Jm0mTSFdIO5dVPdWnXavAyJ36b3Z3kqYiNvpMHAKV0uCnrWXe998L48yWagz
	4zupywbe4hqr25DYNSVm1oG/6OIZPdjw/+YnM=
MIME-Version: 1.0
Received: by 10.52.94.6 with SMTP id cy6mr2090924vdb.153.1315571337522; Fri,
	09 Sep 2011 05:28:57 -0700 (PDT)
Received: by 10.52.167.72 with HTTP; Fri, 9 Sep 2011 05:28:57 -0700 (PDT)
In-Reply-To: <20110909111519.GG4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
	<20110909065128.GA4124@jama.jama.net>
	<CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
	<20110909110614.GE4124@jama.jama.net>
	<CAPhDKbHT0-HCfGeexqY05W-kd8xx8rMuRcwQRN-uZcM+K2JSUA@mail.gmail.com>
	<20110909111519.GG4124@jama.jama.net>
Date: Fri, 9 Sep 2011 13:28:57 +0100
Message-ID: <CAPhDKbGgG_aYGT-oeUz1dqS3CC4h=Zo+L=KF-7+00n571r1PEw@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 12:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 September 2011 12:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> I see, I cannot reset it too for you.. so I will change status of those 4,
> but please send updated patch as suggested.

No need to, see  f4faecdbd0b7c83e5787735ef1495a34aca861e4.

Cheers,
-- 
Ilya


