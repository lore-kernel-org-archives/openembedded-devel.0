Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0007C65DD6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 18:57:19 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h18so2574524igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 11:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iSyX4qKSIL+bybu0JDOkGryRAEJTpGRz3QSQVYpaEwY=;
	b=Ee23opZ1xwjd5+JsgikorIn0zsNVADMls7xvDvH3emhvmhU5xz25izn0LS7/TwB06v
	DnA6FoJrERG+qhlKjP8rJUd7sp6hQi0wpW8HgTJ7yeJus1s+fQo/1nSDTMzHGeKrEXUz
	q68D9JNz2Lh3sHPf1S0unK+8WFOmBNOsAhvdjbbzl4nH4ZbZ0NPiuEHCFXCHfC//2Yc1
	AmLN0aS9OpxURwqBLv2lq8ELGZ2pqWuuenWWbc9O8PgtEGaKPbTk+N2U9jSGhbm/0szH
	+EKQ9mW6FP+cs2ugSDuR82fdYB+NxGuc9ygdQzHrjHo0XUEjOa47r2INd8xM6xKQDq5a
	T7wA==
X-Received: by 10.42.161.69 with SMTP id s5mr2948213icx.70.1398452240381; Fri,
	25 Apr 2014 11:57:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Fri, 25 Apr 2014 11:56:50 -0700 (PDT)
In-Reply-To: <20140425182652.GZ2486@jama>
References: <1398450265-27979-1-git-send-email-raj.khem@gmail.com>
	<20140425182652.GZ2486@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2014 11:56:50 -0700
Message-ID: <CAMKF1soef650vnpY3ca8JAXTAiP4KqWk-ksMP=Afncdg5KsDwA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] htop: Update 1.0.2 -> 1.0.3
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
X-List-Received-Date: Fri, 25 Apr 2014 18:57:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 25, 2014 at 11:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> "[oe] [meta-oe][PATCH 1/4] htop: upgrade to 1.0.3 and apply brokensep"

inheriting autotools-brokensep is a workaround until we have fixed the
 package proper intention should be to not use autotools-brokensep and
fix the packages and use autotools-brokensep as last resort.

