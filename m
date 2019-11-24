Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DE95E7F8AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 20:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47LhXg5ytgz4M;
	Sun, 24 Nov 2019 21:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574627220;
	bh=kRuI0mlBwEy49ST6BtJ0tzOL5yf4x8FGn8PTXPwA4Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dP1cxPZekZKeLbyo5ESsxEV56q2ZkIpymZ/1fj6wiHmAFhh+kQLFDaVgHzJIgLQU/
	6aW6hikreBwdamozGLvCrGO5GYf3v3YCPjTSrEipB92dd4v9luzEEUsruMkf8M0Mkt
	XVPbgWhKe8eLFNp8sfCFR57kBfRr9FlSc/iY3kpp5sUh+EjfUo1xSrYWDtVVn+Jdat
	BW1Sc/2+JtkdSRiURKnRHs2imj8s8YtVGhagFwMzFrm6fG8ifmiRgsFoPxtYn9lZwn
	YQxtuUqdeB/dhQ5p8jo5N5gdt8tG5I68ejwITptejUTrIy6RtC9LG2oSF8/QTWYdLG
	eZTJDdmkvd0sj72Q9YQuSD0nToDsDmuHAyudyydr7Wife2yLexwNucn9cfdhhfVTdg
	KjasKjIEOs41FgcWRaHb9KHrj9lnx6R+XP0tCe+b6DOhRvdeOf73zSicw7IS8A4E5q
	y+3jPHO+rziejVw/ZMw1/xOqQH5gOERic0b2HFoGk0c71yMUDxMStcBJ09s/CESh4y
	2cE3IEfvecAyT4eHUfnbzESU4K7BD3+NaatBURIMvcibbShSh9U7h1SL1mgfPti3K4
	UEPotnyzzdn55c74SibZmYKySf2jtOQg/wwBFwTRYOYvIeC9Lps9aRdPfK1BH9YfvG
	glp52q0CY3IMHYXBymjOI3/Q=
Date: Sun, 24 Nov 2019 22:26:57 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191124202657.GA22445@localhost>
References: <20191122163045.11693-1-bunk@stusta.de>
	<20191122163045.11693-2-bunk@stusta.de>
	<601a0b5a-876d-a457-f203-d6894c14fe8b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <601a0b5a-876d-a457-f203-d6894c14fe8b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][zeus][PATCH 2/3] python-more-itertools: downgrade 7.2.0 -> 5.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Nov 2019 20:27:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Nov 24, 2019 at 11:46:10AM -0800, akuster808 wrote:
> 
> 
> On 11/22/19 8:30 AM, Adrian Bunk wrote:
> > From: Hongxu Jia <hongxu.jia@windriver.com>
> >
> > Python 2.7 is no longer supported. The 5.0.0 release will be the last
> > version targeting Python 2.7. [1]
> why is this a zeus issue? Zeus core is still supporting 2.7. Please clarify.

python-more-itertools > 5.0.0 does not support Python 2.7.

> - armin
>...

cu
Adrian

