Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 534D360167
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 16:33:00 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id l4so439474lbv.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:delivered-to
	:delivered-to:message-id:date:from:user-agent:mime-version:to
	:subject:precedence:reply-to:list-id:list-unsubscribe:list-archive
	:list-post:list-help:list-subscribe:content-transfer-encoding
	:content-type:errors-to;
	bh=0IHeb/McMXZ2IjAG8G+4MS5mIVQsC2ecMMYDXOyw/kQ=;
	b=LrPy1tSF0po8zGY93vLtRTLP5KiMT2XNdACc334T+DYaKofj9JDy1NKGtbuZ00JIcU
	u+6xii1HX2kNvlFo+Ibc67aNw+2bW0ezl1sRSvVHeRbnvd4kfwPqzg+IhL7XSg9SMuV4
	qks2Tl8TeYRi6h1gccliao2U+aHAZdgj/lP12wJnQJzzCAmrs4cCPaGbP65O7WTaa2wk
	2zCE6wf/bCyVTZC+O9WtSb6XHABIdqWCOa3WJwFVFSaoyJOXCX3C6dp9acih2M61Dg0S
	QN3YtleeG77OgSJGstc2DGPnNf4H6/C1AHnzOeTSKBgm47x4mM6TjAsdtv2UyTC2X2sS
	buHA==
X-Received: by 10.112.35.202 with SMTP id k10mr17508568lbj.14.1399134781195;
	Sat, 03 May 2014 09:33:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cr6sm2953040lbb.19.2014.05.03.09.32.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 May 2014 09:33:00 -0700 (PDT)
X-Google-Original-From: Jack Mitchell <ml@embed.me.uk>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Sat, 3 May 2014 18:33:18 +0200
Resent-Message-ID: <20140503163318.GA2486@jama>
Resent-To: openembedded-devel@lists.openembedded.org
Received: by 10.170.148.11 with SMTP id p11csp14671ykc;
	Sat, 3 May 2014 02:59:38 -0700 (PDT)
X-Received: by 10.66.141.12 with SMTP id rk12mr45470499pab.152.1399111177802; 
	Sat, 03 May 2014 02:59:37 -0700 (PDT)
Received: from mail.openembedded.org (mail.openembedded.org. [140.211.169.62])
	by mx.google.com with ESMTP id
	pb4si1850841pac.277.2014.05.03.02.59.36 for <multiple recipients>;
	Sat, 03 May 2014 02:59:37 -0700 (PDT)
Received-SPF: none (google.com:
	openembedded-members-bounces@lists.openembedded.org does not
	designate permitted sender hosts) client-ip=140.211.169.62; 
Received: from mail.openembedded.org (localhost [127.0.0.1])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0C760B9B;
	Sat,  3 May 2014 09:59:32 +0000 (UTC)
X-Greylist: delayed 2651 seconds by postgrey-1.34 at layers.openembedded.org; 
	Sat, 03 May 2014 09:59:17 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9CC601AA
	for <openembedded-members@lists.openembedded.org>;
	Sat,  3 May 2014 09:59:17 +0000 (UTC)
Message-ID: <5364B398.5000802@embed.me.uk>
Date: Sat, 03 May 2014 10:15:04 +0100
From: Jack Mitchell <martin.jansa@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-members@lists.openembedded.org
X-BeenThere: openembedded-members@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Errors-To: openembedded-members-bounces@lists.openembedded.org
X-TUID: oamMv5WkCmaj
Subject: Website Text
X-BeenThere: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sat, 03 May 2014 16:33:04 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Good Morning All,

First off, I hope a lot of you are having fun at OEDAM, I wish I could 
have been there but while my company will pay for entrance and ticket 
fees, they won't pay for the expensive part, travel and hotels.

I have seen on the OEDAM wiki page that the wiki/website is on the 
agenda so I thought it would be a good time to send out an update on my 
involvement. It's been a slow 6 months since I volunteered to help out 
with the project and while a lot has gotten done, it's not quite as much 
as I hoped. However, that aside I think now would be a good time to try 
and get some collaboration on the website text while you're all in a 
room together.

The current website address is http://frontpage.openembedded.org/

All the text probably needs some work, most of it is copied from the 
current OE site with some slight tweaks but I was concentrating on 
design at the time. So, I will list all sub categories of text below 
along with my concerns and anybody else can chime in with their thoughts 
and views. If you want to re-write a portion for review as it's 
completely wrong, please do, I'm not going to be offended.

* Header Text

	- Can we still claim to be best-in-class as a cross compilation 
environment? It seems a touch... arrogant IMO, thoughts?

* Support/Advantages/Available Recipes

	- General input; can you think of any better subheadings or things we 
should be advertising?

* OpenEmbedded and The Yocto Project

	- This needs a complete re-write, what I am envisioning here is a quick 
explanation of how OE and YP are related to clear up initial confusion 
about OE being superseded etc...

* Recent News

	- There is talk about integrating an auto updating feed here with git 
commits/new recipes from the layer index. This will come last when me 
and Paul have had chance to discuss what changes need to be made to the 
Layer Index to make this possible.

When these points are hashed out, then I will create the 
Community/FAQ/Download and Documentation pages and we can discuss these 
on list again.

Slightly off topic, I am having trouble with pushing to the oe-website 
git repo, if anyone at the meeting can help with this then please drop 
me an email. Philip, you were CC'ed in on the problem that I sent to 
ka6sox with the error if someone wants to know the details.

I will try and be about on IRC today if anyone needs me, I'll be in and 
out of the house and the timezone differences will obviously cause some 
issue, but just ping me if you want to know anything.

Cheers all,
Jack.
-- 
_______________________________________________
Openembedded-members mailing list
Openembedded-members@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-members

