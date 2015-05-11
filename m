Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 08AFC6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 16:07:04 +0000 (UTC)
Received: by iecmd7 with SMTP id md7so34059897iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Tp12t+xzOFgWzQa5PJSPDwtOnkBvKVfg0hrBqObN+gw=;
	b=r5H9bstiG2Y5qsCgTbVlpT90PGQR4gCRh4aIqoz3d/rlbctlOkqyLA+6BRY3/b4Qpd
	M46lLNX/vgsNP5FoWzzF6WppC1UFkDkO/LFt89LJqbpuuAx92nTC5YJv/h9E785qGP7R
	KSRBtmG2FZ12G9Y8SvAn/1D0yYJLvhvG1RroYRBTpPNllSkaGYKEzxl0SeVjtQEzXbal
	K3C2xIvejIDd9vMdb1pyBbmhs2RN6n+LJ9XbCq0CVC74pZRM2dvuZhqVEx7MiQNL6bI1
	HnZf1fcWx74d1713ZtJoFdWhv2FUcJqanS6A7uFjW2WWqqPI5za3gELx30WgMGp3cKxi
	QgvQ==
X-Received: by 10.43.56.146 with SMTP id wc18mr11649686icb.24.1431360424239;
	Mon, 11 May 2015 09:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 09:06:33 -0700 (PDT)
In-Reply-To: <20150511091643.GG2400@jama>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
	<1430852951-18707-7-git-send-email-raj.khem@gmail.com>
	<20150511091643.GG2400@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 09:06:33 -0700
Message-ID: <CAMKF1spGXt=mNhu94Q72Le-uLY4yDLTDR6qLMMTinS9X6uJdng@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 May 2015 16:07:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 2:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please send v2 with PNBLACKLISTs removal once the runtime testing is
> done.

it worked ok runtime in my case. but which recipes are you referring
to wrt blacklisting

