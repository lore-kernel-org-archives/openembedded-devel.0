Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id ACF956013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:39:15 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so81223993igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aYx59ZLHznyisjQT5tyFEGbBV/Sy9yjAUP5NCyb2nZI=;
	b=U7C9ktE7z+qMVy/yaE6c3+3frpEinj3+sVi8torLZDiuQ6cbctvLKUScuvK+31plo1
	CQCmGs863DOTRML5Mka0o6l74ixsDCzfrKd5ynvK19tqE38apEiT8hgwPj04ddK050o1
	KNWVMRgzxuj4vVqG4JMp7+VNsrc4Qz8LwWXLq+EdHv2hN+IfEmoWbCimSAwU7ewQPhst
	zGomjc2vqo3B/LgVAZTb4DwgTqzQgRcGNZUUtNSswIjQcG6Tl/yXXMiYgOU07wJmSbSJ
	gQ6F3wfaQnSgYw2Z5Djm2m4F5Akee92MKBnFlR3evOb8rYbQgU+fNAV8mt+bEdZxhApK
	+CJA==
X-Received: by 10.107.18.170 with SMTP id 42mr15362726ios.38.1431373156183;
	Mon, 11 May 2015 12:39:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 12:38:45 -0700 (PDT)
In-Reply-To: <20150511185853.GJ2400@jama>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
	<1430852951-18707-7-git-send-email-raj.khem@gmail.com>
	<20150511091643.GG2400@jama>
	<CAMKF1spGXt=mNhu94Q72Le-uLY4yDLTDR6qLMMTinS9X6uJdng@mail.gmail.com>
	<20150511185853.GJ2400@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 12:38:45 -0700
Message-ID: <CAMKF1srd2tGki0OTSMT7U3SiQX0CB-2ZhLOXejaQ2qR=fSbQgg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-gnome][PATCH 7/7] obex, gnome-bluetooth: Depend on bluez5
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
X-List-Received-Date: Mon, 11 May 2015 19:39:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 11:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://git.openembedded.org/meta-openembedded/commit/?id=73ba7cd70f75a898bf4c3f8ae38c9904fc3e4724

this patch was pushed after I have submitted the changes thats why I
did not see it.

