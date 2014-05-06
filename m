Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0D03665F4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 03:05:12 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so64581yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 20:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eyO4uhAvZGQrGQAqU2AR80dULrwQoyvjSvFogsKsMl8=;
	b=SHQS+SzLRvUXFh8SYdDPb/e+DXEUtwyuNIfrEt6ISB2PI24vjlvR5Zif5pmGKnP5rI
	vh9xFmtteYX2J7K37OhJqGaqjTZVKzrwrw2zdXe7/DMztObd3CSmoYDyCHb7TLyt8tGe
	TySeILc1s3Nd8Ae0m/+llMe0/dc3zQ02dnwLumyAWA8jsMQc9BH5v/bPOQSGqYovKgT9
	SRcFKkpQs3T3CDOAS9Wg8KXsro7N4fKD/cmXVuc4Wje9djUHO1E0ljjmsVlv+5WEzlO1
	mYYGRr7D0hyLFMYo6L7TL8M8CB4HISifh6GhHnDaJzMlsn4LvYhGI/bNRP9R8+4NzygH
	F2bA==
MIME-Version: 1.0
X-Received: by 10.236.142.16 with SMTP id h16mr33990064yhj.2.1399345513750;
	Mon, 05 May 2014 20:05:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Mon, 5 May 2014 20:05:13 -0700 (PDT)
In-Reply-To: <20140506025648.GO2486@jama>
References: <1399344605-8547-1-git-send-email-otavio@ossystems.com.br>
	<20140506025648.GO2486@jama>
Date: Tue, 6 May 2014 00:05:13 -0300
X-Google-Sender-Auth: aIiGkXn71REGXbEM6nCcHfj0_YM
Message-ID: <CAP9ODKpMBAuf5tYJJmogA8e3VwZZSTeZTi93LBpFCTtt_4JNVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] v4l-utils: Update to 1.0.1
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
X-List-Received-Date: Tue, 06 May 2014 03:05:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 5, 2014 at 11:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, May 05, 2014 at 11:50:05PM -0300, Otavio Salvador wrote:
>> This updates to last stable release and, as a plus, fix an out of tree
>> build failure.
>
> file://openat.patch was removed but not the patch itself

Can you amend it? or should I send v2?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

