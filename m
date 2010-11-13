Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PHMUc-0003tc-7V
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 21:14:35 +0100
Received: by ewy24 with SMTP id 24so2130068ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=4yZb0C0/Gl3z/4rlYm+v4FZVwhQMnzSysiUCKgH9Wrw=;
	b=xCAw/DIJtqpEfagAVgFZyvEF1K4SfhBnz0OV4/KHd3++tlyDh6OBPPlf699cj1w9Ze
	iB78xDFG+pgscT/89AucnyZY1+iTvGTpjePbt+Z61LeGb9NR534gra9zoLnag36ZOGDY
	o034bqNj4ScmuTQ8wsMDHdkNeMeH+JisITX0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=ar6uxML7x/SMeQ5JLqXBjBIODEebYWwZb6vEhd9GagvO4lJDF1Ayd1Hjwe8WijVXNJ
	nyCUxvYuXCMM9dnJJsv4uyHKHbBFiiuRaBaKuoWZ9QuZPjIBcSR0L4p4I0d7s4kncFDz
	we7QqYGk1SiP3lVjZMVTJBfbqihyFjgeJE62E=
Received: by 10.213.4.142 with SMTP id 14mr1184707ebr.30.1289679214079;
	Sat, 13 Nov 2010 12:13:34 -0800 (PST)
Received: from anarsoul-laptop.localnet ([80.249.83.145])
	by mx.google.com with ESMTPS id b52sm4708501eei.1.2010.11.13.12.13.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Nov 2010 12:13:32 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Sat, 13 Nov 2010 22:12:47 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.36-gentoo-anarsoul; KDE/4.5.3; i686; ; )
References: <1289596368-4717-1-git-send-email-GNUtoo@no-log.org>
	<1289656078.3521.0.camel@gnutoo-laptop>
	<20101113193528.GA26952@rhein.zuhause.netz>
In-Reply-To: <20101113193528.GA26952@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <201011132212.47612.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libsdl-x11 1.2.14 : fix alsa detection
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
X-List-Received-Date: Sat, 13 Nov 2010 20:14:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 13 November 2010 21:35:29 Henning Heinold wrote:
> How the hell the patch is 1,4 mb?

By deleting 1.3mb patch? look at recipes/libsdl/libsdl-x11-1.2.14/libtool-
update.patch

Regards
Vasily


