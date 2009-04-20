Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LvvcG-0007RM-NL
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 17:41:04 +0200
Received: by bwz19 with SMTP id 19so1953342bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KT1rIh8so+YMy0GNb9mY1tNihblenaekxvtqCHhOahs=;
	b=JVnXGn0CEsiXe8tJpx84GcbwC2dfqkH+jUG4cvHRBNADeWy6m6PNv1DM5NgYmPp7tV
	584cJLaApbZFVp+3j2VFt/5v/6Bc6TGXHn5PQtCFjsD3RmdE6kzncENTat6hQLcLyubO
	zd0DYCNrjGSpRPckx7L3Wl/3SeQmGXTyJEoog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dqsJp79ZL4hQ30xmYhos7DUsHLGN6WEWnC4c0F3Uub2++GK0Ty8fOHWTnU0MYXlKQq
	S1QAuSO2o7ci4ovllqc3TAmJQo4pl/8E5BZPubYEjZBjpTz1A5WXhmmjuPcVXC1NHEkO
	au2N7kbcMZfuexcka7xLd/yyB/4qdMjHI/lrs=
MIME-Version: 1.0
Received: by 10.223.127.4 with SMTP id e4mr1671259fas.100.1240241803254; Mon, 
	20 Apr 2009 08:36:43 -0700 (PDT)
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<20090417183927.GU17629@smtp.west.cox.net>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
Date: Mon, 20 Apr 2009 17:36:43 +0200
Message-ID: <d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: initramfs howto?
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
X-List-Received-Date: Mon, 20 Apr 2009 15:41:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

You can look at the initramfs-kexecboot image for a really slim initramfs.

Regards

Andrea


