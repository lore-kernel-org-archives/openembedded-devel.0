Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBC387025E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:15:29 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so5738187yho.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cmIBTMs0ztRzerFdnEf95LPKMhErczEUaoJHd8JGI7s=;
	b=YuxyZL3FjneDVg1EddGJ2EWPT0c2YwqRGsHQ/L9pfz0HLKJTZwRUi+AUWk8ITsZa52
	El9X+spg65VUMYeVT7cE1Gxi/ig/2XCgO82XJ4GuWmjV/5aVl5XxKwbUTTtTfZDE5z/I
	UkpqlJ8vPg+Z9I6wpBtHgP2k3j6uGr215XZ+P6Gd1BjUf5RZLgQbER91qDdgWFgq8/gO
	Wz+cETSgt11l3KNz7MISRhyLnmeyId/NzZpytQGwFUfrZGGt1VqdtoivRC42qgo7M3Ul
	5Aqbz3ra1nbzLfGIgWQGVEL+qU0K9s9wj1IPxHxBZaso//8K0ugOrWID/CxeW+MBwgPH
	1/mQ==
MIME-Version: 1.0
X-Received: by 10.236.15.6 with SMTP id e6mr36547674yhe.43.1407716131073; Sun,
	10 Aug 2014 17:15:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 10 Aug 2014 17:15:31 -0700 (PDT)
In-Reply-To: <1407661142-12785-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407661142-12785-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 10 Aug 2014 21:15:31 -0300
X-Google-Sender-Auth: Sn-DwK4hYm6pmFz5UCJV56nu_R8
Message-ID: <CAP9ODKrm_JFHPt79UuvONVxH2qdY+A8+X6+4_oKgD465wEkeiA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy][PATCHv] ltrace: add PV and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Mon, 11 Aug 2014 00:15:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 10, 2014 at 5:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

