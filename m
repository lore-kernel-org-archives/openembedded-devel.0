Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkrn-0006x7-CM
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:22:31 +0200
Received: by eekb57 with SMTP id b57so486915eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sLLua3kRCXkLk8G6cIVtivQAdX1eu2LrfcBL8+7tvJk=;
	b=bBW1WLxnLuXWtTcA7EknhALciAH9VPtssXyOzgGdRb6WddwzLfF0o+vRrR+VFEEFmo
	a/XDBiVHmQRkzsY9nUbCTZrnfCha6YS+Wj51aar0bZr3QCndbiutH4iQaThtm6Mo+Jy0
	RLo8KDdNNWK7PNcDRhjFQSBZProEFWXv8y+04TrOGX5r2z9gnfxXuyhxV58KzM/Jw9Uw
	zVAxfu8z23vGaT7wZo5IPXBmDVZr2yQdeEB0tm2JpezOpMrESpqfxN7t6jlI2qFUKYPe
	70L3m6qd+DpZAHFhze2vp6mG1ncNEm+ejtchR9emD3QtEtRqC66s4ZB3oMnFv0Beu2pI
	hgIQ==
Received: by 10.14.213.137 with SMTP id a9mr7053387eep.38.1344111049195; Sat,
	04 Aug 2012 13:10:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sat, 4 Aug 2012 13:10:19 -0700 (PDT)
In-Reply-To: <jvgr60$ig7$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Aug 2012 13:10:19 -0700
Message-ID: <CAMKF1spLej1gvXiSYX_OfqhaFK0D2bLZ-hi-8HGHiTUVG9V29w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Sat, 04 Aug 2012 20:22:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 3, 2012 at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Move gitpkgv into oe-core

OK until I fight moving it into OE-Core :) , I have sent a V4 of
patchset which creates a copy of gitpkgv.bbclass
in meta-systemd. I believe it will be short lived. Please take a look
at them and install if ok


