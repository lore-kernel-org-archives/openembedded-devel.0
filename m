Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UW4QY-0005ca-3f
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 14:40:34 +0200
Received: by mail-ee0-f54.google.com with SMTP id e49so953664eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 05:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pW7kzDT68rqwgtidu1UMjzeC4dgIPMSjOLf41FA4t4U=;
	b=gBPL2nEWt+ZCbkr3kp7cW87GJI/FOMhMphPag2T9nAIVtixJevGr35s5Uo6QKcK5LB
	k4UIMyIzRcDPEmYmq/nVjJOJRPbeB2QojbJyXrV33iryqguOLV3+6YaQFshDdx70Y0Gk
	FMLUBxOjvdqSl/X0WberOaHXR2cEFcOpV2PxorurQhJX2bK+HlZhJqB121Lpr7w5UGZW
	UTicqsBZaBwoXHZCPL/KW8QO+GFh089HJK4bxfmjwROjo0gkWt0Y3XHfnqvUodO+txH1
	Gqvavy0nIK4TP1YOqmHv5uAlzbyCRIQFlI6v6J8HFMN98Cu9PxRRG5ap9H964ZYEh++N
	JN+g==
X-Received: by 10.14.109.131 with SMTP id s3mr54329264eeg.26.1367065364086;
	Sat, 27 Apr 2013 05:22:44 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id j43sm21561010eep.4.2013.04.27.05.22.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 05:22:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1505854.4Uj52mcVBD@helios>
Date: Sat, 27 Apr 2013 14:22:42 +0200
Message-Id: <AFA307A0-88FF-40C7-8C8C-D5321875384C@dominion.thruhere.net>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQluIxWvinZaZdbWgQBB25q0F/OPTry5osuIcKvXC9eqAfPA4b/p/he4deI8o37rT1l9vXxY
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 12:40:39 -0000
X-List-Received-Date: Sat, 27 Apr 2013 12:40:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2013, om 13:23 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Saturday 27 April 2013 12:54:00 Martin Jansa wrote:
>> common (8):
>>  I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to
>> nonworking=20
>=20
> If we have this number of recipes failing, I think we need to do more =
than=20
> just move them to nonworking. Could we perhaps try to have an =
organised effort=20
> to fix up these broken recipes? I'll be happy to help out.

I have patches to fix xbmc and I need to fix up media-ctl and =
qcanobserver.=


