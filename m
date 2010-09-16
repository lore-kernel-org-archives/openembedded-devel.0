Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ow7pY-0003s7-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 08:20:28 +0200
Received: by iwn2 with SMTP id 2so789029iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 23:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bLd/uNiKL0x25+M01iYPyvP2hyIEHqASS+cXT2X2X6o=;
	b=mQJkwvY2ghk3ge5Sp8OjQq+dlxHtCqFzotGtmXqmpAOSjUZi+2fRA/aqjpqWuXp0Bc
	QfVti7AlAOV15TvWFm+HoOxLCHPi9vpFjUKy4PpaeRwi+OyrfhCFjysTEIlS0Nprr27c
	/vGRU1+++kwa9lcaJ6AeAcD1PtGk+1YzdAt38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pvm0Tfv+lfuigJTTXUShvn18DnVLSji2oakm5Q6nJ9mqrrTnFEvnX5RvAovAmtuuGy
	RBBxIXT74jz+ywLGuWbgjvjW4fyZzWEIUc5ujHI1GFlfP6YrkqoQ3NIwPyJ8iDzl/EJ0
	l9b0Qes25SZTX1JKtPFSK7UAp/omt+VOTu1w4=
MIME-Version: 1.0
Received: by 10.231.152.146 with SMTP id g18mr3030525ibw.48.1284617974801;
	Wed, 15 Sep 2010 23:19:34 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 23:19:34 -0700 (PDT)
In-Reply-To: <4C919DB6.4010603@gmail.com>
References: <4C919DB6.4010603@gmail.com>
Date: Thu, 16 Sep 2010 08:19:34 +0200
Message-ID: <AANLkTinbo5Bb8LTGQQrHtPwOXU2L1kYsx3gU=mNNGe0_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] zziplib_0.13.59.bb: add new recipe.
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
X-List-Received-Date: Thu, 16 Sep 2010 06:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

There seem to be an in-tree user:

ogre/ogre-egl_svn.bb:DEPENDS = "gtk+ wgois cppunit zziplib boost
freeimage freetype virtual/libx11 virtual/egl"

Frans


