Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UBE1q-0004xg-6Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 01:41:02 +0100
Received: by mail-vc0-f176.google.com with SMTP id fk10so1616499vcb.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 16:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=PvgHY5zzRPfEwPl8ImbeUQdwGplA0t9EvAKHv4s7kds=;
	b=jYSY5lwWEemuNt8ZtlxeIEuVuvSM3U8dP8RVOH+9B02gSzw/tllYA4w6Chy/aAxFBr
	yQdoU/1oRhnBKVBLvjJhsw7PtzsMHUBqIusiGvAhsUO8KUIF3MCJolqMVtLWQPZJVEUs
	QxK6bjt3OiE+R/QTkL1yjGgZ9nxl+cH5rVPgVHb0dxJEhOVPdH9PVPaueECjvqn01Nx8
	7agCowtYMxBCgTCdxukOAwNaZb5hX5JjNESjRycWCgsVLElsDCzzWJ8OfH5Z4mkd8XHU
	vQOLjLPEs6GV8fo5EIz4ENsMFtnIalr45PTL75jW1Go1cQab+uXckhNItsImLH2WQgfX
	zKAQ==
MIME-Version: 1.0
X-Received: by 10.58.23.199 with SMTP id o7mr3448958vef.2.1362097467106; Thu,
	28 Feb 2013 16:24:27 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Thu, 28 Feb 2013 16:24:26 -0800 (PST)
In-Reply-To: <20130228235113.GE3279@jama>
References: <1361950224-26188-1-git-send-email-schnitzeltony@googlemail.com>
	<1361950224-26188-2-git-send-email-schnitzeltony@googlemail.com>
	<20130228235113.GE3279@jama>
Date: Fri, 1 Mar 2013 01:24:26 +0100
Message-ID: <CALbNGRQ3jzM=L7SD=gK=8=-HMxE7rJpbrwoCm4mShv4DXo2bLQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] geany: fix compile by removing extra check for c++ compiler
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
X-List-Received-Date: Fri, 01 Mar 2013 00:41:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2013 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 27, 2013 at 08:30:24AM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Thanks, now it fails a bit later:
> | configure:17392: checking for perl >=3D 5.8.1
> | configure:17399: result: 5.14.2
> | configure:17403: checking for XML::Parser
> | configure:17409: error: XML::Parser perl module is required for intltoo=
l
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130228_192523.log/
>
Another chapter of success-stroies :)

Will check that next week

Andreas


