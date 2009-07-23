Received: from [209.85.220.228] (helo=mail-fx0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MU2o3-0002oo-1L
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 20:14:15 +0200
Received: by fxm28 with SMTP id 28so1035358fxm.12
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jo0ie+/4Oxrxng7xqGZ2ZlFZa8PeSBKuxXunUchIhBE=;
	b=DzIYLLmM+DXd1Zyp5y7mqtyzN9yhq/miQyBt/7obIlTMhY9CNFsPkgu5XkVp+1o0Tv
	XgteELEswVbpeiD98ADeDu3+SIFsasXCDclPBwomWFjBS2egswhvYl9wyHBxQazkYpDJ
	XCHH0LNvahe+xtI84l2z0m3u9HVveprX8Sdac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	b=lUWMElcrSv+QuhoA1vt1DEdG0m0f+a1SpP1dXrE/ldYysooSfUH9Xo0cp1j0ZO7I53
	p2irLVIdVVmmH5N2vY/+eRYqjySdcoINHx8KjP1fljTOKJkT8dL5oVNLpB7+CYHvuh7G
	+PSXxFwAoJm6BIWlGklmKAyDaSc8EntqjnvGs=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.223.119.5 with SMTP id x5mr1357022faq.40.1248371996192; Thu, 
	23 Jul 2009 10:59:56 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 Jul 2009 10:59:36 -0700
X-Google-Sender-Auth: 4e692066493fd009
Message-ID: <b6ebd0a50907231059p27e821edlf3c7f92838ba4cac@mail.gmail.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
Subject: UserVoice for feature/enhancement requests rather than bugzilla?
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
X-List-Received-Date: Thu, 23 Jul 2009 18:14:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I set up http://openembedded.uservoice.com/ ages ago, when I first
heard about uservoice, when it was beta.  The interface is much nicer
than bugzilla for users to request features, and has a nice easy
voting mechanism to determine what users find to be the most important
features.  I think we should play around with it, and see if it's
worth using for that purpose.  I think it is, personally.  Leon
Woestenberg just had a bitbake feature request, which brought this to
mind.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


